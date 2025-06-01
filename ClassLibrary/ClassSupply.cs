using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
    public class Supply
    {
        public bool Add(int SP, int Provider, int Count)
        {
            bool result = false;
            try
            {
                if (Count == 0) { result = false; }
                else
                {
                    using (SqlConnection conn = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB; Initial Catalog = Factory; Integrated Security = True"))
                    {
                        conn.Open();
                        SqlCommand cmd = new SqlCommand($"INSERT INTO [Supply] (SparePart, Provider, Count, DateOrder, Status) VALUES ('{SP}', '{Provider}', '{Count}', '{DateTime.Today.ToString("yyyy.MM.dd")}', 'Новый')", conn);
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
