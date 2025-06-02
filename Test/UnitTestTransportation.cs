using System;
using ClassLibrary;
using System.Data.SqlClient;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Test
{
    [TestClass]
    public class UnitTestTransportation
    {
        private Transportation _transportation;
        private string _connectionString;
        private int _testTransportationId;

        [TestInitialize]
        public void TestInitialize()
        {
            _transportation = new Transportation();
            _connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Factory;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO [Transportation] (Rocket, DateSend, Status) " +
                    "VALUES (11, '2023-01-01', 'TestStatus'); " +
                    "SELECT SCOPE_IDENTITY();", conn);
                _testTransportationId = Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        [TestCleanup]
        public void TestCleanup()
        {
            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(
                    "DELETE FROM [Transportation] WHERE Rocket = 999 OR ID_Transportation = @testId",
                    conn);
                cmd.Parameters.AddWithValue("@testId", _testTransportationId);
                cmd.ExecuteNonQuery();
            }
        }

        [TestMethod]
        public void Add_ValidData_ReturnsTrue()
        {
            int rocket = 11;
            string status = "TestStatus";
            string dateSend = "2023-01-01";
            bool result = _transportation.Add(rocket, status, dateSend);
            Assert.IsTrue(result);
            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM [Transportation] WHERE Rocket = @rocket AND Status = @status AND DateSend = @dateSend",
                    conn);
                cmd.Parameters.AddWithValue("@rocket", rocket);
                cmd.Parameters.AddWithValue("@status", status);
                cmd.Parameters.AddWithValue("@dateSend", dateSend);

                int count = Convert.ToInt32(cmd.ExecuteScalar());
                Assert.IsTrue(count > 0);
            }
        }

        [TestMethod]
        public void Add_InvalidRocket_ReturnsFalse()
        {
            int rocket = 0;
            string status = "TestStatus";
            string dateSend = "2023-01-01";
            bool result = _transportation.Add(rocket, status, dateSend);
            Assert.IsFalse(result);
        }

        [TestMethod]
        public void Add_EmptyStatus_ReturnsFalse()
        {
            int rocket = 11;
            string status = "";
            string dateSend = "2023-01-01";
            bool result = _transportation.Add(rocket, status, dateSend);
            Assert.IsFalse(result);
        }

        [TestMethod]
        public void Add_EmptyDateSend_ReturnsFalse()
        {
            int rocket = 11;
            string status = "TestStatus";
            string dateSend = "";
            bool result = _transportation.Add(rocket, status, dateSend);
            Assert.IsFalse(result);
        }

        [TestMethod]
        public void Delete_ExistingId_ReturnsTrue()
        {
            bool result = _transportation.Delete(_testTransportationId);
            Assert.IsTrue(result);
            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM [Transportation] WHERE ID_Transportation = @id",
                    conn);
                cmd.Parameters.AddWithValue("@id", _testTransportationId);

                int count = Convert.ToInt32(cmd.ExecuteScalar());
                Assert.AreEqual(0, count);
            }
        }

        [TestMethod]
        public void Delete_NonExistingId_ReturnsFalse()
        {
            int nonExistingId = -1;
            bool result = _transportation.Delete(nonExistingId);
            Assert.IsFalse(result);
        }

        [TestMethod]
        public void Delete_AlreadyDeletedId_ReturnsFalse()
        {
            _transportation.Delete(_testTransportationId);
            bool result = _transportation.Delete(_testTransportationId);
            Assert.IsFalse(result);
        }
    }
}

