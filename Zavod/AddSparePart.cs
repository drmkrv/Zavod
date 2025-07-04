﻿using System;
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
    public partial class AddSparePart : Form
    {
        int InfoEmployee;
        string NameSP;
        int CountSP;
        public AddSparePart(int IDEmployee)
        {
            InitializeComponent();
            InfoEmployee = IDEmployee;
        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            Warehouse window = new Warehouse(InfoEmployee);
            NameSP = textBoxName.Text;
            CountSP = (int)numericUpDownCount.Value;

            ClassLibrary.SP cl_addSP = new ClassLibrary.SP();
            bool result = cl_addSP.Add(NameSP, CountSP);
            if (result == true)
            {
                MessageBox.Show("Деталь добавлена!", "Успех!", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Деталь не добавлена!", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
