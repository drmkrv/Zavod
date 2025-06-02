using System;
using ClassLibrary;
using System.Data.SqlClient;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Test
{
    [TestClass]
    public class UnitTestAuth
    {
        private Auth _auth;
        private string _connectionString;
        private int _testEmployeeId;

        [TestInitialize]
        public void TestInitialize()
        {
            _auth = new Auth();
            _connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Factory;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO [Employee] (Login, Password, Surname, Name, LastName, Post) " +
                    "VALUES ('testuser', 'testpass', 'TestSurname', 'TestName', 'TestLastName', '2'); " +
                    "SELECT SCOPE_IDENTITY();", conn);
                _testEmployeeId = Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        [TestCleanup]
        public void TestCleanup()
        {
            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(
                    "DELETE FROM [Employee] WHERE Login = 'testuser' OR ID_Employee = @testId",
                    conn);
                cmd.Parameters.AddWithValue("@testId", _testEmployeeId);
                cmd.ExecuteNonQuery();
            }
        }

        [TestMethod]
        public void LogInFunc_ValidCredentials_ReturnsEmployeeId()
        {
            string login = "testuser";
            string password = "testpass";
            var result = _auth.LogInFunc(login, password);
            Assert.IsNotNull(result);
            Assert.IsInstanceOfType(result, typeof(int));
            Assert.AreEqual(_testEmployeeId, Convert.ToInt32(result));
        }

        [TestMethod]
        public void LogInFunc_InvalidLogin_ReturnsNull()
        {
            string login = "invaliduser";
            string password = "testpass";
            var result = _auth.LogInFunc(login, password);
            Assert.IsNull(result);
        }

        [TestMethod]
        public void LogInFunc_InvalidPassword_ReturnsNull()
        {
            string login = "testuser";
            string password = "wrongpass";
            var result = _auth.LogInFunc(login, password);
            Assert.IsNull(result);
        }

        [TestMethod]
        public void LogInFunc_EmptyCredentials_ReturnsNull()
        {
            string login = "";
            string password = "";
            var result = _auth.LogInFunc(login, password);
            Assert.IsNull(result);
        }

        [TestMethod]
        public void GetFIO_ValidEmployeeId_ReturnsFullName()
        {
            int employeeId = _testEmployeeId;
            string expected = "TestSurname TestName TestLastName";
            var result = _auth.GetFIO(employeeId);
            Assert.AreEqual(expected, result);
        }

        [TestMethod]
        public void GetFIO_InvalidEmployeeId_ReturnsEmptyString()
        {
            int employeeId = -1;
            var result = _auth.GetFIO(employeeId);
            Assert.AreEqual(string.Empty, result);
        }

        [TestMethod]
        public void GetPost_ValidEmployeeId_ReturnsPost()
        {
            string employeeId = _testEmployeeId.ToString();
            string expected = "2";
            var result = _auth.GetPost(employeeId);
            Assert.IsNotNull(result);
            Assert.AreEqual(expected, result.ToString());
        }

        [TestMethod]
        public void GetPost_InvalidEmployeeId_ReturnsNull()
        {
            string employeeId = "-1";
            var result = _auth.GetPost(employeeId);
            Assert.IsNull(result);
        }
    }
}