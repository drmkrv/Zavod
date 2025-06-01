using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Zavod
{
    public partial class Test : Form
    {
        int InfoEmployee;
        public Test(int IDemployee)
        {
            InfoEmployee = IDemployee;
            InitializeComponent();
        }

        private void testBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.testBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.factoryDataSet);

        }

        private void Test_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "factoryDataSet.Test". При необходимости она может быть перемещена или удалена.
            this.testTableAdapter.Fill(this.factoryDataSet.Test);

        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            AddTest window = new AddTest(InfoEmployee);
            window.Show();
        }

        private void buttonDelete_Click(object sender, EventArgs e)
        {
            if (testDataGridView.SelectedRows.Count == 0)
            {
                MessageBox.Show("Выберите строку для удаления!", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            DataGridViewRow selectedRow = testDataGridView.SelectedRows[0];
            int id = Convert.ToInt32(selectedRow.Cells[0].Value);
            DialogResult result = MessageBox.Show("Удалить выбранную запись?", "Подтверждение", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            ClassLibrary.Transportation cl_Transportation = new ClassLibrary.Transportation();
            if (result == DialogResult.Yes)
            {
                try
                {
                    if (cl_Transportation.Delete(id))
                    {
                        testDataGridView.Rows.Remove(selectedRow);
                        MessageBox.Show("Запись успешно удалена!", "Успех", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Ошибка при удалении: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void buttonBack_Click(object sender, EventArgs e)
        {
            this.Hide();
            Menu window = new Menu(Convert.ToInt32(InfoEmployee));
            window.Show();
        }
    }
}
