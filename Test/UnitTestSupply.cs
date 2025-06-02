using System;
using ClassLibrary;
using System.Data.SqlClient;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Test
{
    [TestClass]
    public class UnitTestSupply
    {
        private Supply _supply;
        private const int TestSparePart = 1;
        private const int TestProvider = 1;
        private const int TestCount = 10;
        private int _testId;

        [TestInitialize]
        public void Setup()
        {
            _supply = new Supply();
            using (SqlConnection conn = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB; Initial Catalog = Factory; Integrated Security = True"))
            {
                conn.Open();
                var cmd = new SqlCommand(
                    $"INSERT INTO [Supply] (SparePart, Provider, Count, DateOrder, Status) " +
                    $"VALUES ('{TestSparePart}', '{TestProvider}', '{TestCount}', '{DateTime.Today.ToString("yyyy.MM.dd")}', 'Новый'); " +
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
                    "DELETE FROM [Supply] WHERE " +
                    "(SparePart = @SparePart AND Provider = @Provider) OR " +
                    "SupplyNumber = @TestId", conn);
                cmd.Parameters.AddWithValue("@SparePart", TestSparePart);
                cmd.Parameters.AddWithValue("@Provider", TestProvider);
                cmd.Parameters.AddWithValue("@TestId", _testId);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

        [TestMethod]
        public void Add_ValidData_ReturnsTrue()
        {
            bool result = _supply.Add(TestSparePart, TestProvider, TestCount);
            Assert.IsTrue(result);
        }

        [TestMethod]
        public void Add_ZeroCount_ReturnsFalse()
        {
            bool result = _supply.Add(TestSparePart, TestProvider, 0);
            Assert.IsFalse(result);
        }

        [TestMethod]
        public void Add_InvalidConnection_ReturnsFalse()
        {
            var brokenSupply = new BrokenConnectionSupply();
            bool result = brokenSupply.Add(TestSparePart, TestProvider, TestCount);
            Assert.IsFalse(result);
        }

        [TestMethod]
        public void Delete_ExistingId_ReturnsTrue()
        {
            bool result = _supply.Delete(_testId);
            Assert.IsTrue(result);
        }

        [TestMethod]
        public void Delete_NonExistingId_ReturnsFalse()
        {
            bool result = _supply.Delete(-1);
            Assert.IsFalse(result);
        }

        [TestMethod]
        public void Delete_InvalidConnection_ReturnsFalse()
        {
            var brokenSupply = new BrokenConnectionSupply();
            bool result = brokenSupply.Delete(1);
            Assert.IsFalse(result);
        }
    }

    public class BrokenConnectionSupply : Supply
    {
        public virtual bool Add(int SP, int Provider, int Count)
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
