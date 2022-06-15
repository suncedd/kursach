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
    public partial class Form1 : Form
    {
        SqlConnection sqlcon = new SqlConnection(@"Data Source=PK306NEW-7\SQLEXPRESS;Initial Catalog=sport;Integrated Security=True");
        public Form1()
        {
            InitializeComponent();
        }
        public string stat;
        public static int kod;
        private void button2_Click(object sender, EventArgs e)
        {
            sqlcon.Open();
            string log = textBox1.Text;
            string par = textBox2.Text;
            string l = "";


            SqlCommand commands = new SqlCommand("USE [sport] SELECT * FROM [DBO].Авторизация WHERE [DBO].Авторизация.[Логин] = '"+log+"' ", sqlcon);
            SqlDataReader read = commands.ExecuteReader();
            while (read.Read())
            {
                l = read.GetValue(1).ToString();
            }
                if (l == log)
                {
                    string p = "";
                  
                sqlcon.Close();
                sqlcon.Open();
                    commands = new SqlCommand("USE [sport] SELECT * FROM [DBO].Авторизация WHERE [DBO].Авторизация.[Пароль] = '"+par+"' and  [DBO].Авторизация.[Логин] = Логин", sqlcon);
                SqlDataReader read3 = commands.ExecuteReader();
                while (read3.Read())
                {
                    p = read3.GetValue(2).ToString();
                    kod = (int)read3.GetValue(3);
                }
                    if (p == par)
                    {
                        sqlcon.Close();

                        sqlcon.Open();
                        int dol = 0;
                        SqlCommand commandss = new SqlCommand("USE [sport] SELECT * FROM [DBO].Сотрудники WHERE [DBO].Сотрудники.[КодСотрудника]= "+kod+"  ", sqlcon);
                        SqlDataReader read2 = commandss.ExecuteReader();
                    while (read2.Read())
                    {
                        dol = (int)read2.GetValue(2);
                        stat = read2.GetValue(3).ToString();
                    }
                       if(stat == "Уволен")
                    {
                        MessageBox.Show("Вы уволены");
                    }
                    else
                    {
                        if (dol == 1)
                        {

                            ActiveForm.Hide();
                            Админ adm = new Админ();
                            adm.Show();
                        }
                        else if (dol == 2)
                        {
                            ActiveForm.Hide();
                            менеджер men = new менеджер();
                            men.Show();
                        }
                        else
                        {
                            MessageBox.Show("Проверьте правильность введенных данных");
                        }
                        sqlcon.Close();
                    }
                        
                      
                    }
                }
           
            sqlcon.Close();



        }
    }
}
