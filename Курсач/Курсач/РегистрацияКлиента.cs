using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Курсач
{
    public partial class РегистрацияКлиента : Form
    {
        public int kod;
        public РегистрацияКлиента()
        {
            InitializeComponent();
        }
        SqlConnection sqlcon = new SqlConnection(@"Data Source=PK306NEW-7\SQLEXPRESS;Initial Catalog=sport;Integrated Security=True");
        private void РегистрацияКлиента_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "sportDataSet4.Клиент". При необходимости она может быть перемещена или удалена.
            this.клиентTableAdapter.Fill(this.sportDataSet4.Клиент);
            sqlcon.Open();
            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter("SELECT[КодКлиента], Статус.Статус,[ФИО],[ДатаРождения], Абонемент.Название FROM([sport].[dbo].[Клиент] left join Статус on Клиент.КодСтатуса = Статус.КодСтатуса) left join Абонемент on Клиент.КодАбонемента = Абонемент.КодАбонемента", sqlcon);
            adapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            sqlcon.Close();
            dataGridView1.Columns[0].Visible = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {

            string fio = textBox1.Text;
            int passport = int.Parse(textBox2.Text);
            string dat = dateTimePicker1.Text; 
            
            sqlcon.Open();
            DataSet dss = new DataSet();
            SqlDataAdapter command = new SqlDataAdapter("INSERT INTO[dbo].[Клиент] ([КодСотрудника],[КодСтатуса],[ФИО],[ДатаРождения],[Паспорт]) VALUES("+Form1.kod +",1,'"+fio+"','"+dat+"',"+passport+")", sqlcon);
            command.Fill(dss);
            sqlcon.Close();

            sqlcon.Open();
            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter("SELECT[КодКлиента], Статус.Статус,[ФИО],[ДатаРождения], Абонемент.Название FROM([sport].[dbo].[Клиент] left join Статус on Клиент.КодСтатуса = Статус.КодСтатуса) left join Абонемент on Клиент.КодАбонемента = Абонемент.КодАбонемента", sqlcon);
            adapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            sqlcon.Close();
            dataGridView1.Columns[0].Visible = false;
        }

        private void button2_Click(object sender, EventArgs e)
        {




            if (comboBox2.SelectedItem.ToString() == "")
            {
                MessageBox.Show("Выберите Статус");
                return;
            }




            int ind =Convert.ToInt32(comboBox2.SelectedIndex+1);


            sqlcon.Open();
            DataSet dss = new DataSet();
            SqlDataAdapter command = new SqlDataAdapter("Use [sport] update dbo.[Клиент] set  [КодСтатуса] = " + ind + " where dbo.Клиент.КодКлиента = " + Convert.ToInt32(comboBox1.SelectedValue) + "", sqlcon);
            command.Fill(dss);
            sqlcon.Close();

            sqlcon.Open();
            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter("SELECT[КодКлиента], Статус.Статус,[ФИО],[ДатаРождения], Абонемент.Название FROM([sport].[dbo].[Клиент] left join Статус on Клиент.КодСтатуса = Статус.КодСтатуса) left join Абонемент on Клиент.КодАбонемента = Абонемент.КодАбонемента", sqlcon);
            adapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            sqlcon.Close();
            dataGridView1.Columns[0].Visible = false;

        }
    }
}
