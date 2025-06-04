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
    public partial class Supply : Form
    {
        int InfoEmployee;
        public Supply(int IDemployee)
        {
            InfoEmployee = IDemployee;
            InitializeComponent();
        }

        private void supplyBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.supplyBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.factoryDataSet);

        }

        private void Supply_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "factoryDataSet.Supply". При необходимости она может быть перемещена или удалена.
            this.supplyTableAdapter.Fill(this.factoryDataSet.Supply);

        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            AddSupply window = new AddSupply();
            window.ShowDialog();
        }

        private void buttonDelete_Click(object sender, EventArgs e)
        {
            if (supplyDataGridView.SelectedRows.Count == 0)
            {
                MessageBox.Show("Выберите строку для удаления!", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            DataGridViewRow selectedRow = supplyDataGridView.SelectedRows[0];
            int id = Convert.ToInt32(selectedRow.Cells[0].Value);
            DialogResult result = MessageBox.Show("Удалить выбранную запись?", "Подтверждение", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            ClassLibrary.Transportation cl_Transportation = new ClassLibrary.Transportation();
            if (result == DialogResult.Yes)
            {
                try
                {
                    if (cl_Transportation.Delete(id))
                    {
                        supplyDataGridView.Rows.Remove(selectedRow);
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

        private void Supply_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Hide();
            Menu window = new Menu(Convert.ToInt32(InfoEmployee));
            window.Show();
        }
    }
}
