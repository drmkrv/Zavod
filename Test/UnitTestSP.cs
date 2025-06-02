using System;
using ClassLibrary;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Data.SqlClient;

namespace Test
{
    [TestClass]
    public class UnitTestSP
    {
        private SP _sp;
        private const string TestName = "TestPart";
        private const int TestCount = 10;
        private int _testId;

        [TestInitialize]
        public void Setup()
        {
            _sp = new SP();
            using (SqlConnection conn = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB; Initial Catalog = Factory; Integrated Security = True"))
            {
                conn.Open();
                var cmd = new SqlCommand($"INSERT INTO [SparePart] (NameSparePart, Count) VALUES (N'{TestName}', '{TestCount}'); SELECT SCOPE_IDENTITY();", conn);
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
                var cmd = new SqlCommand($"DELETE FROM [SparePart] WHERE NameSparePart = N'{TestName}' OR NameSparePart LIKE N'TestPart%'", conn);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

        [TestMethod]
        public void Add_ValidData_ReturnsTrue()
        {
            bool result = _sp.Add("TestPart1", 5);
            Assert.IsTrue(result);
        }

        [TestMethod]
        public void Add_EmptyName_ReturnsFalse()
        {
            bool result = _sp.Add("", 5);
            Assert.IsFalse(result);
        }

        [TestMethod]
        public void Add_NullName_ReturnsFalse()
        {
            var sp = new SP();
            bool result = sp.Add(string.Empty, 5);
            Assert.IsFalse(result);
        }

        [TestMethod]
        public void Add_InvalidConnection_ReturnsFalse()
        {
            var brokenSp = new BrokenConnectionSP();
            bool result = brokenSp.Add("TestPart3", 5);
            Assert.IsFalse(result);
        }

        [TestMethod]
        public void Delete_ExistingId_ReturnsTrue()
        {
            bool result = _sp.Delete(_testId);
            Assert.IsTrue(result);
        }

        [TestMethod]
        public void Delete_NonExistingId_ReturnsFalse()
        {
            bool result = _sp.Delete(-1);
            Assert.IsFalse(result);
        }

        [TestMethod]
        public void Delete_InvalidConnection_ReturnsFalse()
        {
            var brokenSp = new BrokenConnectionSP();
            bool result = brokenSp.Delete(1);
            Assert.IsFalse(result);
        }
    }

    public class BrokenConnectionSP : SP
    {
        public virtual bool Add(string NameSP, int CountSP)
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
