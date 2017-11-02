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
    public partial class frmScholarshipEntry : Form
    {
        NpgsqlConnection conn = null;
        NpgsqlCommand cmd = null;
        
        
        public frmScholarshipEntry()
        {
            InitializeComponent();
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            textBox1.Text = "";
            textBox1.BackColor = Color.MidnightBlue;
            textBox2.Text = "";
            textBox2.BackColor = Color.MidnightBlue;
            textBox3.Text = "";
            textBox3.BackColor = Color.MidnightBlue;
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            conn = new NpgsqlConnection(SQLConn.DBcon);
            cmd = new NpgsqlCommand();
            cmd.Connection = conn;
            conn.Open();
            cmd.CommandText = "insert into Scholarship(ScholarshipName, Amount, Description) values (@d1,@d2,@d3)";
            SQLConn.cmd.Parameters.AddWithValue("@d1", textBox1.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d2", textBox2.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d3", textBox3.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
            MessageBox.Show("Scholarship Data Saved Successfully...!");
            textBox1.Text = "";
            textBox1.BackColor = Color.MidnightBlue;
            textBox2.Text = "";
            textBox2.BackColor = Color.MidnightBlue;
            textBox3.Text = "";
            textBox3.BackColor = Color.MidnightBlue;
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            conn = new NpgsqlConnection(SQLConn.DBcon);
            cmd = new NpgsqlCommand();
            cmd.Connection = conn;
            conn.Open();
            cmd.CommandText = "update Scholarship set ScholarshipName=@d1, Amount=@d2, Description=@d3";
            SQLConn.cmd.Parameters.AddWithValue("@d1", textBox1.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d2", textBox2.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d3", textBox3.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
            MessageBox.Show("Scholarship Data Updated Successfully...!");
            textBox1.Text = "";
            textBox1.BackColor = Color.MidnightBlue;
            textBox2.Text = "";
            textBox2.BackColor = Color.MidnightBlue;
            textBox3.Text = "";
            textBox3.BackColor = Color.MidnightBlue;
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            conn = new NpgsqlConnection(SQLConn.DBcon);
            conn.Open();
            string str = "select ScholarshipName,Amount,Description from Scholarship where ScholarshipName='" + textBox1.Text + "'";
            cmd = new NpgsqlCommand(str);
            cmd.Connection = conn;
            SQLConn.dr = cmd.ExecuteReader();
            if (SQLConn.dr.Read())
            {
                textBox1.Text = SQLConn.dr.GetString(0).Trim();
                textBox2.Text = SQLConn.dr.GetString(1).Trim();
                textBox3.Text = SQLConn.dr.GetString(2).Trim();
                btnSave.Enabled = false;
            }
            else {
                btnSave.Enabled = true;
            }
        }

        private void btnDel_Click(object sender, EventArgs e)
        {
            conn = new NpgsqlConnection(SQLConn.DBcon);
            cmd = new NpgsqlCommand();
            cmd.Connection = conn;
            conn.Open();
            cmd.CommandText = "delete from Scholarship where ScholarshipName=@d1";
            SQLConn.cmd.Parameters.AddWithValue("@d1", textBox1.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
            MessageBox.Show("Scholarship Data Deleted Successfully...!");
            textBox1.Text = "";
            textBox1.BackColor = Color.MidnightBlue;
            textBox2.Text = "";
            textBox2.BackColor = Color.MidnightBlue;
            textBox3.Text = "";
            textBox3.BackColor = Color.MidnightBlue;
        }
    }
}
