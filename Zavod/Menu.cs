using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Zavod
{
    public partial class Menu : Form
    {
        int InfoEmployee;
        public Menu(int IDemployee)
        {
            InfoEmployee = IDemployee;
            InitializeComponent();
            ClassLibrary.Auth cl_auth = new ClassLibrary.Auth();
            object Employee = cl_auth.GetFIO(IDemployee);
            label1.Text = "Добро пожаловать, " + Employee + "!";

            object PostEmployee = cl_auth.GetPost(IDemployee.ToString());
            if ((int)PostEmployee == 1)
            {
                this.buttonEmployee.Enabled = false;
                this.buttonTest.Enabled = false;
            }
            else if ((int)PostEmployee == 3)
            {
                this.buttonSupply.Enabled = false;
                this.buttonWarehouse.Enabled = false;
                this.buttonEmployee.Enabled = false;
                this.buttonTransportation.Enabled = false;
            }
        }

        private void buttonWarehouse_Click(object sender, EventArgs e)
        {
            this.Hide();
            Warehouse window = new Warehouse(Convert.ToInt32(InfoEmployee));
            window.Show();
        }

        private void buttonTransportation_Click(object sender, EventArgs e)
        {
            this.Hide();
            Transportation window = new Transportation(Convert.ToInt32(InfoEmployee));
            window.Show();
        }

        private void buttonSupply_Click(object sender, EventArgs e)
        {
            this.Hide();
            Supply window = new Supply(Convert.ToInt32(InfoEmployee));
            window.Show();
        }

        private void buttonTest_Click(object sender, EventArgs e)
        {
            this.Hide();
            Test window = new Test(Convert.ToInt32(InfoEmployee));
            window.Show();
        }

        private void buttonEmployee_Click(object sender, EventArgs e)
        {
            this.Hide();
            Employee window = new Employee(Convert.ToInt32(InfoEmployee));
            window.Show();
        }

        private void Menu_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Hide();
            Auth window = new Auth();
            window.Show();
        }

        private void buttonExit_Click(object sender, EventArgs e)
        {
            this.Hide();
            Auth window = new Auth();
            window.Show();
        }
    }
}
