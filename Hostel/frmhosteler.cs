using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using Npgsql;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SchoolGuru
{
    public partial class Frmhosteler : Form
    {
        NpgsqlConnection conn = null;
        NpgsqlCommand cmd = null;
        
        
        public Frmhosteler()
        {
            InitializeComponent();
        }

        private void Clear()
        {
            textBox1.Text = "";
            textBox1.BackColor = Color.MidnightBlue;
            textBox2.Text = "";
            comboBox1.Text = "";
            comboBox2.Text = "";
            comboBox3.Text = "";
            dateTimePicker1.Text = "";
        }

        private void Save()
        {
            if (textBox1.Text == "")
            {
                textBox1.BackColor = Color.Red;
                MessageBox.Show("Please Enter Admission Number", "Warning!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                textBox1.BackColor = Color.MidnightBlue;
                textBox1.Focus();
            }
           else if (textBox2.Text == "")
            {
                textBox1.BackColor = Color.Red;
                MessageBox.Show("Please Enter Correct Admission Number", "Warning!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                textBox1.BackColor = Color.MidnightBlue;
                textBox1.Focus();
            }
            else
            {
                try
                {
                    btn_save.Enabled = true;
                    btn_Update.Enabled = false;
                    btn_Del.Enabled = false;

                    conn = new NpgsqlConnection(SQLConn.DBcon);
                    conn.Open();
                    string insert = "insert into Hostelers (StudentID,StudentName,Class,Section,HostelName,ReportingDate) values (@d1,@d2,@d3,@d4,@d5,@d6)";
                    cmd = new NpgsqlCommand(insert);
                    cmd.Connection = conn;
                    SQLConn.cmd.Parameters.AddWithValue("@d1", textBox1.Text);
                    SQLConn.cmd.Parameters.AddWithValue("@d2", textBox2.Text);
                    SQLConn.cmd.Parameters.AddWithValue("@d3", comboBox1.Text);
                    SQLConn.cmd.Parameters.AddWithValue("@d4", comboBox2.Text);
                    SQLConn.cmd.Parameters.AddWithValue("@d5", comboBox3.Text);
                    SQLConn.cmd.Parameters.AddWithValue("@d6", dateTimePicker1.Text);
                    cmd.ExecuteReader();
                    conn.Close();
                    MessageBox.Show("Data Saved Successfully", "Hosteler's Report", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Clear();
                }
                catch (Exception ex) {
                    MessageBox.Show(textBox1.Text +" "+ "Already Exist in Hostelers Records","Error",MessageBoxButtons.OK,MessageBoxIcon.Error);
                }
            }
        }

        private void btn_Cancel_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            textBox1.BackColor = Color.LightGray;
            conn = new NpgsqlConnection(SQLConn.DBcon);
            cmd = new NpgsqlCommand();
            cmd.Connection = conn;
            conn.Open();
            cmd.CommandText = "select FirstName, Surname,EnrolmentDate,Class,Section from StudentsDetails where AdmissionNo = '" + textBox1.Text + "'";
            SQLConn.dr = cmd.ExecuteReader();
            if (SQLConn.dr.Read())
            {
                textBox2.Text = SQLConn.dr.GetString(0).Trim() + " " + SQLConn.dr.GetString(1).Trim();
                dateTimePicker1.Text = SQLConn.dr.GetString(2).Trim();
                comboBox1.Text = SQLConn.dr.GetString(3).Trim();
                comboBox2.Text = SQLConn.dr.GetString(4).Trim();
                dateTimePicker1.Enabled = false;
                comboBox1.Enabled = false;
                comboBox2.Enabled = false;
                btn_Del.Enabled = false;
                btn_Update.Enabled = false;
            }
            if (SQLConn.dr != null)
            {
                conn = new NpgsqlConnection(SQLConn.DBcon);
                cmd = new NpgsqlCommand();
                cmd.Connection = conn;
                conn.Open();
                cmd.CommandText = "select HostelName from Hostel where AdmissionNo = '" + textBox1.Text + "'";
                SQLConn.dr = cmd.ExecuteReader();
                if (SQLConn.dr.Read())
                {
                    comboBox3.Text = SQLConn.dr.GetString(0).Trim();
                    comboBox3.Enabled = false;
                    btn_Del.Enabled = false;
                    btn_Update.Enabled = false;
                    conn.Close();
                }
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
        }

        private void Frmhosteler_Load(object sender, EventArgs e)
        {

        }

        private void btn_save_Click(object sender, EventArgs e)
        {
            Save();
        }

        private void btn_Update_Click(object sender, EventArgs e)
        {

        }
    }
}
