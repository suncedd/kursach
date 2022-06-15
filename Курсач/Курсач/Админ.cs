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
    public partial class Админ : Form
    {
        public int kod; 
        public Админ()
        {
            InitializeComponent();
        }
        SqlConnection sqlcon = new SqlConnection(@"Data Source=PK306NEW-7\SQLEXPRESS;Initial Catalog=sport;Integrated Security=True");
        private void Админ_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "sportDataSet3.Сотрудники". При необходимости она может быть перемещена или удалена.
            this.сотрудникиTableAdapter1.Fill(this.sportDataSet3.Сотрудники);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "sportDataSet2.Должности". При необходимости она может быть перемещена или удалена.
            this.должностиTableAdapter1.Fill(this.sportDataSet2.Должности);

            sqlcon.Open();
            DataSet ds = new DataSet();
            
            SqlDataAdapter adapter = new SqlDataAdapter("Use [sport] select ФИО,Должность,Логин,Пароль,Статус from dbo.[Сотрудники], dbo.[Должности], dbo.[Авторизация]  ", sqlcon);
            adapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            sqlcon.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int dl = Convert.ToInt32(comboBox1.SelectedValue);
            string fio = textBox1.Text;
            string log =textBox2.Text;
            string par = textBox3.Text;

            sqlcon.Open();
            DataSet dss = new DataSet();
            SqlDataAdapter command = new SqlDataAdapter("Use [sport] insert into dbo.[Сотрудники] ([ФИО],[КодДолжность],[Статус]) values('"+ fio +"',"+ dl +", 'Штатный') ",sqlcon);
            command.Fill(dss);
            sqlcon.Close();

            sqlcon.Open();
            SqlCommand command1 = new SqlCommand("Use sport select * from dbo.Сотрудники where dbo.Сотрудники.КодСотрудника = (SELECT MAX(КодСотрудника) FROM dbo.Сотрудники) ", sqlcon);
            SqlDataReader read = command1.ExecuteReader();
            while (read.Read())
            {
                 kod = (int)read.GetValue(0);
            }
            sqlcon.Close();


            sqlcon.Open();
            command = new SqlDataAdapter("Use [sport] insert into dbo.[Авторизация] ([Логин],[Пароль],[КодРаботника]) values('" + log + "','" + par + "',"+kod+")", sqlcon);
             command.Fill(dss);
            sqlcon.Close();

            sqlcon.Open();
            SqlDataAdapter adapter = new SqlDataAdapter("Use [sport] select ФИО,Должность,Логин,Пароль,Статус from dbo.[Сотрудники], dbo.[Должности], dbo.[Авторизация] where dbo.[сотрудники].КодДолжность = dbo.Должности.КодДолжности and dbo.[сотрудники].КодСотрудника = dbo.Авторизация.КодРаботника ", sqlcon);
            adapter.Fill(dss);
            dataGridView1.DataSource = dss.Tables[0];          
            sqlcon.Close ();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if(comboBox2.SelectedItem.ToString() == "")
            {
                MessageBox.Show("Выберите Статус");
                return;
            }

           





            sqlcon.Open();
            DataSet dss = new DataSet();
            SqlDataAdapter command = new SqlDataAdapter("Use [sport] update dbo.[Сотрудники] set  [Статус] = '"+comboBox2.SelectedItem.ToString()+"' where dbo.сотрудники.КодСотрудника = "+Convert.ToInt32(comboBox3.SelectedValue)+"", sqlcon);
            command.Fill(dss);
            sqlcon.Close();


            sqlcon.Open();
            SqlDataAdapter adapter = new SqlDataAdapter("Use [sport] select ФИО,Должность,Логин,Пароль,Статус from dbo.[Сотрудники], dbo.[Должности], dbo.[Авторизация] where dbo.[сотрудники].КодДолжность = dbo.Должности.КодДолжности and dbo.[сотрудники].КодСотрудника = dbo.Авторизация.КодРаботника ", sqlcon);
            adapter.Fill(dss);
            dataGridView1.DataSource = dss.Tables[0];
            sqlcon.Close();
        }
    }
}
