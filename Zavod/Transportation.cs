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
    public partial class Transportation : Form
    {
        int InfoEmployee;
        public Transportation(int IDemployee)
        {
            InfoEmployee = IDemployee;
            InitializeComponent();
        }

        private void transportationBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.transportationBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.factoryDataSet);

        }

        private void Transportation_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "factoryDataSet.Transportation". При необходимости она может быть перемещена или удалена.
            this.transportationTableAdapter.Fill(this.factoryDataSet.Transportation);

        }

        private void buttonBack_Click(object sender, EventArgs e)
        {
            this.Hide();
            Menu window = new Menu(Convert.ToInt32(InfoEmployee));
            window.Show();
        }

        private void Transportation_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Hide();
            Menu window = new Menu(Convert.ToInt32(InfoEmployee));
            window.Show();
        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            AddTransportation window = new AddTransportation(Convert.ToInt32(InfoEmployee));
            window.Show();
        }

        private void buttonDelete_Click(object sender, EventArgs e)
        {
            if (transportationDataGridView.SelectedRows.Count == 0)
            {
                MessageBox.Show("Выберите строку для удаления!", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            DataGridViewRow selectedRow = transportationDataGridView.SelectedRows[0];
            int id = Convert.ToInt32(selectedRow.Cells[0].Value);
            DialogResult result = MessageBox.Show("Удалить выбранную запись?", "Подтверждение", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            ClassLibrary.Transportation cl_Transportation = new ClassLibrary.Transportation();
            if (result == DialogResult.Yes)
            {
                try
                {
                    if (cl_Transportation.Delete(id))
                    {
                        transportationDataGridView.Rows.Remove(selectedRow);
                        MessageBox.Show("Запись успешно удалена!", "Успех", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Ошибка при удалении: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }
    }
}
