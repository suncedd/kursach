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
    public partial class Абонемент : Form
    {
        SqlConnection sqlcon = new SqlConnection(@"Data Source=PK312-7;Initial Catalog=sport;Integrated Security=True");
        public static int adi;
        public Абонемент()
        {
            InitializeComponent();
        }

        private void Абонемент_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "sportDataSet5.Абонемент". При необходимости она может быть перемещена или удалена.
            this.абонементTableAdapter.Fill(this.sportDataSet5.Абонемент);

            sqlcon.Open();
            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter("SELECT[КодКлиента],[ФИО] FROM [sport].[dbo].[Клиент] where dbo.Клиент.КодСтатуса = 1", sqlcon);
            adapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            sqlcon.Close();
            dataGridView1.Columns[0].Visible = false;

            sqlcon.Open();
             ds = new DataSet();

            adapter = new SqlDataAdapter("SELECT[КодАбонемента],[Название],[Длительность],[Цена] FROM [sport].[dbo].[Абонемент] where dbo.Абонемент.КодАбонемента = КодАбонемента", sqlcon);
            adapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
            sqlcon.Close();
            dataGridView2.Columns[0].Visible = false;

        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                int abon = (int)comboBox1.SelectedValue;
                sqlcon.Open();
                DataSet dss = new DataSet();
                SqlDataAdapter command = new SqlDataAdapter("use sport update dbo.Клиент set КодАбонемента = " + abon + " where dbo.Клиент.КодКлиента = " + adi + "  ", sqlcon);
                command.Fill(dss);
                sqlcon.Close();
            }
            catch
            {
                MessageBox.Show("Вы не выбрали клиента!");
            }
           

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int row = Convert.ToInt32(dataGridView1.CurrentRow.Index);
            adi = (int)dataGridView1.Rows[row].Cells[0].Value;
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
           
                sqlcon.Open();
                DataSet ds = new DataSet();

                SqlDataAdapter adapter = new SqlDataAdapter("SELECT[КодКлиента],[ФИО] FROM [sport].[dbo].[Клиент] where dbo.Клиент.КодСтатуса = 1 and [ФИО] Like'" + textBox1.Text + "%'", sqlcon);
                adapter.Fill(ds);
                dataGridView1.DataSource = ds.Tables[0];
                sqlcon.Close();
              
              


           

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            string nazv = textBox2.Text;
            int leng = Convert.ToInt32(textBox3.Text);
            int cen = Convert.ToInt32(textBox4.Text);

            sqlcon.Open();
            DataSet dss = new DataSet();
            SqlDataAdapter command = new SqlDataAdapter("INSERT INTO[dbo].[Абонемент] ([Название],[Длительность],[Цена]) VALUES('" + nazv + "'," + leng + "," + cen + ")", sqlcon);
            command.Fill(dss);
            sqlcon.Close();


            sqlcon.Open();
            dss = new DataSet();

            command = new SqlDataAdapter("SELECT[КодАбонемента],[Название],[Длительность],[Цена] FROM [sport].[dbo].[Абонемент] where dbo.Абонемент.КодАбонемента = КодАбонемента", sqlcon);
            command.Fill(dss);
            dataGridView2.DataSource = dss.Tables[0];
            sqlcon.Close();
            dataGridView2.Columns[0].Visible = false;


            this.абонементTableAdapter.Fill(this.sportDataSet5.Абонемент);
            comboBox1.Refresh();
        }

       
    }
}
