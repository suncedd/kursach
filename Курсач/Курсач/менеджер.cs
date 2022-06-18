using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Курсач
{
    public partial class менеджер : Form
    {
        public менеджер()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ActiveForm.Hide();
            РегистрацияКлиента kli = new РегистрацияКлиента();
            kli.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            ActiveForm.Hide();
            Абонемент ab = new Абонемент();
            ab.Show();

        }
    }
}
