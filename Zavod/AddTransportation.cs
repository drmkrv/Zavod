using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Zavod
{
    public partial class AddTransportation : Form
    {
        int IDemployee;
        int Rocket;
        string DateSend;
        string Status;
        public AddTransportation(int IDemployee)
        {
            InitializeComponent();
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Factory;Integrated Security=True";

            string query = @"SELECT 
                        r.ID_Rocket, 
                        m.NameModel AS ModelName,
                        CONCAT(r.ID_Rocket, ' - ', m.NameModel) AS DisplayText
                    FROM Rocket r
                    JOIN Model m ON r.ModelRocket = m.ID_Model";

            try
            {
                DataTable dt = new DataTable();
                using (SqlConnection conn = new SqlConnection(connectionString))
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    dt.Load(cmd.ExecuteReader());
                }

                if (dt.Rows.Count > 0)
                {
                    comboBoxRocket.DataSource = dt;
                    comboBoxRocket.DisplayMember = "DisplayText";
                    comboBoxRocket.ValueMember = "ID_Rocket";
                }
                else
                {
                    MessageBox.Show("Нет данных о ракетах", "Информация", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (SqlException ex)
            {
                MessageBox.Show($"Ошибка загрузки данных: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Неизвестная ошибка: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        
        private void AddTransportation_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Hide();
        }

        private void AddTransportation_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "factoryDataSet.Rocket". При необходимости она может быть перемещена или удалена.
            this.rocketTableAdapter.Fill(this.factoryDataSet.Rocket);
        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            Rocket = (int)comboBoxRocket.SelectedValue;
            Status = comboBoxStatus.Text;
            DateSend = dateStart.Value.ToString("dd.MM.yyyy");

            ClassLibrary.Transportation cl_addRocket = new ClassLibrary.Transportation();
            bool result = cl_addRocket.Add(Rocket, Status, DateSend);
            if (result == true)
            {
                MessageBox.Show("Транспортировка добавлена!", "Успех!", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Транспортировка не добавлена!", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
