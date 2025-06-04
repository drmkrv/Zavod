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
    public partial class Employee : Form
    {
        int InfoEmployee;
        public Employee(int IDemployee)
        {
            InfoEmployee = IDemployee;
            InitializeComponent();
        }

        private void employeeBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.employeeBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.factoryDataSet);

        }

        private void Employee_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "factoryDataSet.Employee". При необходимости она может быть перемещена или удалена.
            this.employeeTableAdapter.Fill(this.factoryDataSet.Employee);

        }

        private void buttonBack_Click(object sender, EventArgs e)
        {
            this.Hide();
            Menu window = new Menu(Convert.ToInt32(InfoEmployee));
            window.Show();
        }

        private void Employee_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Hide();
            Menu window = new Menu(Convert.ToInt32(InfoEmployee));
            window.Show();
        }
    }
}
