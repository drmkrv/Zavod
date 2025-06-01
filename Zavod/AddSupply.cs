using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using System.Windows.Forms.VisualStyles;
using ClassLibrary;

namespace Zavod
{
    public partial class AddSupply : Form
    {
        int SP;
        int Provider;
        int Count;
        
        public AddSupply()
        {
            InitializeComponent();
        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            SP = (int)comboBoxSP.SelectedValue;
            Provider = (int)comboBoxProvider.SelectedValue;
            Count = (int)numericUpDownCount.Value;

            ClassLibrary.Supply cl_addSupply = new ClassLibrary.Supply();
            bool result = cl_addSupply.Add(SP, Provider, Count);
            if (result == true)
            {
                MessageBox.Show("Поставка добавлена!", "Успех!", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Поставка не добавлена!", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                MessageBox.Show($"{SP}, {Provider}, {Count}", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);

            }
        }

        private void AddSupply_Load(object sender, EventArgs e)
        {
            this.providerTableAdapter.Fill(this.factoryDataSet.Provider);
            this.sparePartTableAdapter.Fill(this.factoryDataSet.SparePart);
        }
    }
}
