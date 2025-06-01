using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
    public class Rocket
    {
        public bool Add(int Model, string Status, string DateStart, string DateEnd)
        {
            bool result = false;
            Console.WriteLine("Данные для добавления:");
            Console.WriteLine($"Model: {Model}");
            Console.WriteLine($"Status: {Status}");
            Console.WriteLine($"DateStart: {DateStart}");
            Console.WriteLine($"DateEnd: {DateEnd}");
            try
            {
                if (Model == 0 || Status == "") { result = false; }
                else
                {
                    using (SqlConnection conn = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB; Initial Catalog = Factory; Integrated Security = True"))
                    {
                        conn.Open();
                        SqlCommand cmd = new SqlCommand($"INSERT INTO [Rocket] (ModelRocket, Status, DateStartBuild, DateEndBuild) VALUES ('{Model}', N'{Status}', '{DateStart}', '{DateEnd}')", conn);
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
                string sql = "DELETE FROM Rocket WHERE ID_Rocket = @ID";

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
