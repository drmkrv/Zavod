using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
    public class Test
    {
        public bool Add(int Rocket, string Type, string Result, string Date, int Employee)
        {
            bool result = false;
            try
            {
                if (Rocket == 0 || Type == "" || Result == "" || Date == "") { result = false; }
                else
                {
                    using (SqlConnection conn = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB; Initial Catalog = Factory; Integrated Security = True"))
                    {
                        conn.Open();
                        SqlCommand cmd = new SqlCommand($"INSERT INTO [Test] (Rocket, TypeTest, Result, DateTest, Employee) VALUES (N'{Rocket}', N'{Type}', N'{Result}', N'{Date}', N'{Employee}')", conn);
                        cmd.ExecuteScalar();
                        result = true;
                        conn.Close();
                    }
                }
            }
            catch (Exception sqlEx)
            {
                result = false;
            }
            return result;
        }

        public bool Delete(int id)
        {
            using (SqlConnection conn = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Factory;Integrated Security=True"))
            {
                conn.Open();
                string sql = "DELETE FROM Supply WHERE SupplyNumber = @ID";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@ID", id);
                    int rowsAffected = cmd.ExecuteNonQuery();
                    return rowsAffected > 0;
                }
            }
        }
    }
}
