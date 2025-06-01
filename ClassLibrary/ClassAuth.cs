using System;
using System.Data.SqlClient;

namespace ClassLibrary
{
    public class Auth
    {
        public object LogInFunc(string login, string password)
        {
            object IDemployee;
            using (SqlConnection conn = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB; Initial Catalog = Factory; Integrated Security = True"))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand($"SELECT ID_Employee from [Employee] WHERE Login='{login}' AND Password='{password}'", conn);
                IDemployee = (object)cmd.ExecuteScalar();
            }
            return IDemployee;
        }

        public string GetFIO(int IDemployee)
        {
            string Employee = "";
            using (SqlConnection conn = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB; Initial Catalog = Factory; Integrated Security = True"))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand($"SELECT Surname, Name, LastName from [Employee] WHERE ID_Employee='{IDemployee}'", conn);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                     Employee = rdr[0].ToString() + ' ' + rdr[1].ToString() + ' ' + rdr[2].ToString();
                }
                rdr.Close();
                conn.Close();
            }
            return Employee;
        }

        public object GetPost(string IDemployee)
        {
            object PostEmployee;
            using (SqlConnection conn = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB; Initial Catalog = Factory; Integrated Security = True"))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand($"SELECT Post from [Employee] WHERE ID_Employee = {IDemployee}", conn);
                PostEmployee = (object)cmd.ExecuteScalar();
            }
            return PostEmployee;
        }
    }
}