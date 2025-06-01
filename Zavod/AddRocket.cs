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
    public partial class AddRocket : Form
    {
        int Model;
        string Status;
        string DateStart;
        string DateEnd;
        public AddRocket()
        {
            InitializeComponent();
        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            Model = (int)comboBoxModel.SelectedValue;
            Status = comboBoxStatus.Text;
            DateStart = dateStart.Value.ToString("dd.MM.yyyy");
            DateEnd = dateEnd.Value.ToString("dd.MM.yyyy");

            ClassLibrary.Rocket cl_addRocket = new ClassLibrary.Rocket();
            bool result = cl_addRocket.Add(Model, Status, DateStart, DateEnd);
            if (result == true)
            {
                MessageBox.Show("Ракета добавлена!", "Успех!", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Ракета не добавлена!", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void AddRocket_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "factoryDataSet.Model". При необходимости она может быть перемещена или удалена.
            this.modelTableAdapter.Fill(this.factoryDataSet.Model);

        }

    }
}
