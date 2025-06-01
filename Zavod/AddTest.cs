using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ClassLibrary;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ProgressBar;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Zavod
{
    public partial class AddTest : Form
    {
        int Rocket;
        string Type;
        string Result;
        string Date;
        int InfoEmployee;

        public AddTest(int IDemployee)
        {
            InfoEmployee = IDemployee;
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

            comboBoxTest.Items.AddRange(new object[] {
                "1. Статические (огневые) испытания двигателей",
                "2. Вибрационные и ударные испытания",
                "3. Термовакуумные тесты",
                "4. Испытания на электромагнитную совместимость (ЭМС)",
                "5. Функциональные проверки бортовых систем",
                "6. Испытания на герметичность",
                "7. Лётные испытания (суборбитальные)",
                "8. Лётные испытания (орбитальные)",
                "9. Криогенные испытания",
                "10. Тесты системы аварийного спасения",
                "11. Испытания системы разделения ступеней",
                "12. Акустические тесты (шумовые нагрузки)",
                "13. Климатические испытания",
                "14. Тесты программного обеспечения",
                "15. Комплексные предпусковые проверки"
            });
            comboBoxResult.Items.AddRange(new object[] {
                "Успешно пройдено",
                "Частично пройдено",
                "Не пройдено (критическая ошибка)",
                "Требуется доработка",
                "Тест отменён",
                "Результат: в пределах допуска",
                "Результат: превышение параметров",
                "Требуется повторное тестирование"
            });
        }

        private void AddTest_Load(object sender, EventArgs e)
        {
            this.rocketTableAdapter.Fill(this.factoryDataSet.Rocket);
        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            Rocket = (int)comboBoxRocket.SelectedValue;
            Type = comboBoxTest.Text;
            Result = comboBoxResult.Text;
            Date = dateTest.Value.ToString("dd.MM.yyyy");

            ClassLibrary.Test cl_addTest = new ClassLibrary.Test();
            bool result = cl_addTest.Add(Rocket, Type, Result, Date, InfoEmployee);
            if (result == true)
            {
                MessageBox.Show("Тестирование добавлено!", "Успех!", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Тестирование не добавлено!", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                MessageBox.Show($"{Rocket}, {Type}, {Result}, {Date}", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);

            }
        }
    }
}
