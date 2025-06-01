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
    public partial class Auth : Form
    {
        static public string login;
        static public string password;
        static public string post;
        public Auth()
        {
            InitializeComponent();
        }

        private void buttonLog_Click(object sender, EventArgs e)
        {
            login = loginTextBox.Text;
            password = passwordTextBox.Text;

            if (login == "" || password == "")
            {
                MessageBox.Show("Пожалуйста, введите логин и/или пароль!", "Внимание!", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                ClassLibrary.Auth cl_auth = new ClassLibrary.Auth();
                object IDemployee = cl_auth.LogInFunc(login, password);


                if (IDemployee != null)
                {
                    Menu window = new Menu(Convert.ToInt32(IDemployee));
                    this.Hide();
                    window.Show();
                }
                else
                {
                    MessageBox.Show("Неверный логин или пароль!", "Внимание!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void buttonExit_Click(object sender, EventArgs e)
        {
            Application.ExitThread();
        }
    }
}
