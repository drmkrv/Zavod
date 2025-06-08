using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ClassLibrary;

namespace Zavod
{
    public partial class Warehouse : Form
    {
        int InfoEmployee;
        public Warehouse(int IDemployee)
        {
            InfoEmployee = IDemployee;
            InitializeComponent();
        }

        private void sparePartBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.sparePartBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.factoryDataSet);

        }

        private void Warehouse_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "factoryDataSet.Rocket". При необходимости она может быть перемещена или удалена.
            this.rocketTableAdapter.Fill(this.factoryDataSet.Rocket);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "factoryDataSet.SparePart". При необходимости она может быть перемещена или удалена.
            this.sparePartTableAdapter.Fill(this.factoryDataSet.SparePart);
        }

        private void toolStripButton8_Click(object sender, EventArgs e)
        {
            AddSparePart window = new AddSparePart(InfoEmployee);
            window.Show();
        }

        private void Warehouse_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Hide();
            Menu window = new Menu(Convert.ToInt32(InfoEmployee));
            window.Show();
        }

        private void buttonAddSP_Click(object sender, EventArgs e)
        {
            AddSparePart window = new AddSparePart(InfoEmployee);
            window.ShowDialog();
        }

        private void buttonDeleteSP_Click(object sender, EventArgs e)
        {
            if (sparePartDataGridView.SelectedRows.Count == 0)
            {
                MessageBox.Show("Выберите строку для удаления!", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            DataGridViewRow selectedRow = sparePartDataGridView.SelectedRows[0];
            int id = Convert.ToInt32(selectedRow.Cells[0].Value);
            DialogResult result = MessageBox.Show("Удалить выбранную запись?", "Подтверждение", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            ClassLibrary.SP cl_SP = new ClassLibrary.SP();
            if (result == DialogResult.Yes)
            {
                try
                {
                    if (cl_SP.Delete(id))
                    {
                        sparePartDataGridView.Rows.Remove(selectedRow);
                        MessageBox.Show("Запись успешно удалена!", "Успех", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Ошибка при удалении: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void buttonAddRocket_Click(object sender, EventArgs e)
        {
            AddRocket window = new AddRocket();
            window.ShowDialog();
        }

        private void buttonDeleteRocket_Click(object sender, EventArgs e)
        {
            if (rocketDataGridView.SelectedRows.Count == 0)
            {
                MessageBox.Show("Выберите строку для удаления!", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            DataGridViewRow selectedRow = rocketDataGridView.SelectedRows[0];
            int id = Convert.ToInt32(selectedRow.Cells[0].Value);
            DialogResult result = MessageBox.Show("Удалить выбранную запись?", "Подтверждение", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            ClassLibrary.Rocket cl_rocket = new ClassLibrary.Rocket();
            if (result == DialogResult.Yes)
            {
                try
                {
                    if (cl_rocket.Delete(id))
                    {
                        rocketDataGridView.Rows.Remove(selectedRow);
                        MessageBox.Show("Запись успешно удалена!", "Успех", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Ошибка при удалении: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void buttonBack2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Menu window = new Menu(Convert.ToInt32(InfoEmployee));
            window.Show();
        }

        private void buttonBack1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Menu window = new Menu(Convert.ToInt32(InfoEmployee));
            window.Show();
        }
    }
}
