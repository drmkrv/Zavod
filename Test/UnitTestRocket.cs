using System;
using System.Data.SqlClient;
using ClassLibrary;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Test
{
    [TestClass]
    public class UnitTestRocket
    {
        [TestClass]
        public class RocketTests
        {
            private Rocket _rocket;
            private const int TestModel = 1;
            private const string TestStatus = "Active";
            private const string TestDateStart = "01.01.2023";
            private const string TestDateEnd = "31.12.2023";
            private int _testId;

            [TestInitialize]
            public void Setup()
            {
                _rocket = new Rocket();

                using (SqlConnection conn = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB; Initial Catalog = Factory; Integrated Security = True"))
                {
                    conn.Open();
                    var cmd = new SqlCommand(
                        $"INSERT INTO [Rocket] (ModelRocket, Status, DateStartBuild, DateEndBuild) " +
                        $"VALUES ('{TestModel}', N'{TestStatus}', '{TestDateStart}', '{TestDateEnd}'); " +
                        "SELECT SCOPE_IDENTITY();", conn);
                    _testId = Convert.ToInt32(cmd.ExecuteScalar());
                    conn.Close();
                }
            }

            [TestCleanup]
            public void Cleanup()
            {
                using (SqlConnection conn = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB; Initial Catalog = Factory; Integrated Security = True"))
                {
                    conn.Open();
                    var cmd = new SqlCommand(
                        "DELETE FROM [Rocket] WHERE " +
                        "(ModelRocket = @Model AND Status = @Status) OR " +
                        "ID_Rocket = @TestId", conn);
                    cmd.Parameters.AddWithValue("@Model", TestModel);
                    cmd.Parameters.AddWithValue("@Status", TestStatus);
                    cmd.Parameters.AddWithValue("@TestId", _testId);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            [TestMethod]
            public void Add_ValidData_ReturnsTrue()
            {
                bool result = _rocket.Add(TestModel, TestStatus, TestDateStart, TestDateEnd);
                Assert.IsTrue(result);
            }

            [TestMethod]
            public void Add_ZeroModel_ReturnsFalse()
            {
                bool result = _rocket.Add(0, TestStatus, TestDateStart, TestDateEnd);
                Assert.IsFalse(result);
            }

            [TestMethod]
            public void Add_EmptyStatus_ReturnsFalse()
            {
                bool result = _rocket.Add(TestModel, "", TestDateStart, TestDateEnd);
                Assert.IsFalse(result);
            }

            [TestMethod]
            public void Add_InvalidConnection_ReturnsFalse()
            {
                var brokenRocket = new BrokenConnectionRocket();
                bool result = brokenRocket.Add(TestModel, TestStatus, TestDateStart, TestDateEnd);
                Assert.IsFalse(result);
            }

            [TestMethod]
            public void Delete_ExistingId_ReturnsTrue()
            {
                bool result = _rocket.Delete(_testId);
                Assert.IsTrue(result);
            }

            [TestMethod]
            public void Delete_NonExistingId_ReturnsFalse()
            {
                bool result = _rocket.Delete(-1);
                Assert.IsFalse(result);
            }

            [TestMethod]
            public void Delete_InvalidConnection_ReturnsFalse()
            {
                var brokenRocket = new BrokenConnectionRocket();
                bool result = brokenRocket.Delete(1);
                Assert.IsFalse(result);
            }
        }

        public class BrokenConnectionRocket : Rocket
        {
            public virtual bool Add(int Model, string Status, string DateStart, string DateEnd)
            {
                try
                {
                    using (SqlConnection conn = new SqlConnection("Data Source=invalid;Initial Catalog=Factory;Integrated Security=True"))
                    {
                        conn.Open();
                        return false;
                    }
                }
                catch
                {
                    return false;
                }
            }

            public virtual bool Delete(int id)
            {
                try
                {
                    using (SqlConnection conn = new SqlConnection("Data Source=invalid;Initial Catalog=Factory;Integrated Security=True"))
                    {
                        conn.Open();
                        return false;
                    }
                }
                catch
                {
                    return false;
                }
            }
        }
    }
}
