using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace ClassLibrary
{
    public class Transportation
    {
        public bool Add(int Rocket, string Status, string DateSend)
        {
            bool result = false;
            try
            {
                if (Rocket == 0 || DateSend == "" || Status == "") { result = false; }
                else
                {
                    using (SqlConnection conn = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB; Initial Catalog = Factory; Integrated Security = True"))
                    {
                        conn.Open();
                        SqlCommand cmd = new SqlCommand($"INSERT INTO [Transportation] (Rocket, DateSend, Status) VALUES (N'{Rocket}', N'{DateSend}', N'{Status}')", conn);
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
            using (SqlConnection conn = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB; Initial Catalog = Factory; Integrated Security = True"))
            {
                conn.Open();
                string sql = "DELETE FROM Transportation WHERE ID_Transportation = @ID";

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
