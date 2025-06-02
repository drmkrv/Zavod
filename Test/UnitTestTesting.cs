using System;
using ClassLibrary;
using System.Data.SqlClient;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Test
{
    [TestClass]
    public class UnitTestTesting
    {
        private Testing _testing;
        private string _connectionString;
        private int _testId;

        [TestInitialize]
        public void TestInitialize()
        {
            _testing = new Testing();
            _connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Factory;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO [Test] (Rocket, TypeTest, Result, DateTest, Employee) " +
                    "VALUES (11, 'UnitTest', 'Success', '2023-01-01', 11); " +
                    "SELECT SCOPE_IDENTITY();", conn);
                _testId = Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        [TestCleanup]
        public void TestCleanup()
        {
            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(
                    "DELETE FROM [Test] WHERE Rocket = 11 OR Employee = 11 OR TypeTest = 'UnitTest'",
                    conn);
                cmd.ExecuteNonQuery();
            }
        }

        [TestMethod]
        public void Add_ValidData_ReturnsTrue()
        {
            int rocket = 11;
            string type = "UnitTest";
            string result = "Success";
            string date = "2023-01-01";
            int employee = 11;
            bool actual = _testing.Add(rocket, type, result, date, employee);
            Assert.IsTrue(actual);
        }

        [TestMethod]
        public void Add_InvalidRocket_ReturnsFalse()
        {
            int rocket = 0;
            string type = "UnitTest";
            string result = "Success";
            string date = "2023-01-01";
            int employee = 11;
            bool actual = _testing.Add(rocket, type, result, date, employee);
            Assert.IsFalse(actual);
        }

        [TestMethod]
        public void Add_EmptyType_ReturnsFalse()
        {
            int rocket = 11;
            string type = "";
            string result = "Success";
            string date = "2023-01-01";
            int employee = 11;
            bool actual = _testing.Add(rocket, type, result, date, employee);
            Assert.IsFalse(actual);
        }

        [TestMethod]
        public void Add_EmptyResult_ReturnsFalse()
        {
            int rocket = 11;
            string type = "UnitTest";
            string result = "";
            string date = "2023-01-01";
            int employee = 11;
            bool actual = _testing.Add(rocket, type, result, date, employee);
            Assert.IsFalse(actual);
        }

        [TestMethod]
        public void Add_EmptyDate_ReturnsFalse()
        {
            int rocket = 11;
            string type = "UnitTest";
            string result = "Success";
            string date = "";
            int employee = 11;
            bool actual = _testing.Add(rocket, type, result, date, employee);            
            Assert.IsFalse(actual);
        }

        [TestMethod]
        public void Delete_NonExistingId_ReturnsFalse()
        {
            int nonExistingId = -1;
            bool actual = _testing.Delete(nonExistingId);
            Assert.IsFalse(actual);
        }
    }
}

