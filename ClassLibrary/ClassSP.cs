using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
    public class SP
    {
        public bool Add(string NameSP, int CountSP)
        {
            bool result = false;
            try
            {
                if (NameSP == "") { result = false; }
                else
                {
                    using (SqlConnection conn = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB; Initial Catalog = Factory; Integrated Security = True"))
                    {
                        conn.Open();
                        SqlCommand cmd = new SqlCommand($"INSERT INTO [SparePart] (NameSparePart, Count) VALUES (N'{NameSP}', N'{CountSP}')", conn);
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
                string sql = "DELETE FROM SparePart WHERE ID_SparePart = @ID";

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
