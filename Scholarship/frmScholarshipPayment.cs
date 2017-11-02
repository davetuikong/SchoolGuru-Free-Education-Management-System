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
    public partial class frmScholarshipPayment : Form
    {
        NpgsqlConnection conn = null;
        
        NpgsqlCommand cmd = null;
        
        public frmScholarshipPayment()
        {
            InitializeComponent();
        }

        private void frmScholarshipPayment_Load(object sender, EventArgs e)
        {
            Sel();
            cmbMOP.Items.Add("By Cash");
            cmbMOP.Items.Add("Through M-pesa");
            cmbMOP.Items.Add("By Cheque");
            cmbMOP.Items.Add("By Goods or Services in Kind");
        }

        private void Sel() {
            try {
                conn = new NpgsqlConnection(SQLConn.DBcon);
                conn.Open();
                string ron2 = "select RTRIM(ScholarshipID) from  ScholarshipDetails";
                cmd = new NpgsqlCommand(ron2);
                cmd.Connection = conn;
                SQLConn.dr = cmd.ExecuteReader();
                if (SQLConn.dr.Read() == true)
                {
                    cmbScholarship.Items.Add(SQLConn.dr.GetString(0).Trim());
                }
            }
            catch(Exception ex){}
        }
        private void Clear()
        {
            cmbScholarship.Text = "";
            txtScholarshipName.Text = "";
            txtScholarshipName.BackColor = Color.MidnightBlue;
            txtAmt.Text = "";
            txtAmt.BackColor = Color.MidnightBlue;
            txtAdmissionNo.Text = "";
            txtStudName.Text = "";
            txtStudName.BackColor = Color.MidnightBlue;
            txtClass.Text = "";
            txtClass.BackColor = Color.MidnightBlue;
            txtSection.Text = "";
            txtSection.BackColor = Color.MidnightBlue;
            dateTimePicker1.Text = "";
            cmbMOP.Text = "";
            txtPMD.Text = "";
            txtPMD.BackColor = Color.MidnightBlue;
            txtTotalPaid.Text = "";
            txtTotalPaid.BackColor = Color.MidnightBlue;
            txtDuePay.Text = "";
            txtDuePay.BackColor = Color.MidnightBlue;
        }

        private void saveRecords()
        {
            conn = new NpgsqlConnection(SQLConn.DBcon);
            cmd = new NpgsqlCommand();
            cmd.Connection = conn;
            conn.Open();
            cmd.CommandText = "insert into ScholarshipDetails (ScholarshipID, ScholarshipName, Amount, AdmissionNo, StudentName, Class, Section, DateOfPayment, ModeOfPayment, Description, TotalPaid, DuePayment) values(@a,@b,@c,@d,@e,@f,@g,@h,@i,@j,@k,@l)";
            SQLConn.cmd.Parameters.AddWithValue("@a",cmbScholarship.Text);
            SQLConn.cmd.Parameters.AddWithValue("@b", txtScholarshipName.Text);
            SQLConn.cmd.Parameters.AddWithValue("@c", txtAmt.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d", txtAdmissionNo.Text);
            SQLConn.cmd.Parameters.AddWithValue("@e", txtStudName.Text);
            SQLConn.cmd.Parameters.AddWithValue("@f", txtClass.Text);
            SQLConn.cmd.Parameters.AddWithValue("@g", txtSection.Text);
            SQLConn.cmd.Parameters.AddWithValue("@h", dateTimePicker1.Text);
            SQLConn.cmd.Parameters.AddWithValue("@i", cmbMOP.Text);
            SQLConn.cmd.Parameters.AddWithValue("@j", txtPMD.Text);
            SQLConn.cmd.Parameters.AddWithValue("@k", txtTotalPaid.Text);
            SQLConn.cmd.Parameters.AddWithValue("@l", txtDuePay.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
            MessageBox.Show("Data was Saved successfully...");
            Clear();
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            Clear();
        }

        private void cmbAdmissionNo_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        private void txtAdmissionNo_TextChanged(object sender, EventArgs e)
        {

            try
            {
                conn = new NpgsqlConnection(SQLConn.DBcon);
                conn.Open();
                string cb10 = "select FirstName, Surname, Class, Section from StudentsDetails where AdmissionNo='" + txtAdmissionNo.Text + "'";
                cmd = new NpgsqlCommand(cb10);
                cmd.Connection = conn;
                SQLConn.dr = cmd.ExecuteReader();
                if (SQLConn.dr.Read())
                {
                    txtAdmissionNo.BackColor = Color.LightGray;
                    txtStudName.Text = SQLConn.dr.GetValue(0).ToString().Trim() + " " + SQLConn.dr.GetValue(1).ToString().Trim();
                    txtStudName.BackColor = Color.LightGray;
                    txtClass.Text = SQLConn.dr.GetValue(2).ToString().Trim();
                    txtClass.BackColor = Color.LightGray;
                    txtSection.Text = SQLConn.dr.GetValue(3).ToString().Trim();
                    txtSection.BackColor = Color.LightGray;
                    conn.Close();
                }

                else
                {
                    txtAdmissionNo.BackColor = Color.MidnightBlue;
                    txtStudName.Text = "";
                    txtStudName.BackColor = Color.MidnightBlue;
                    txtClass.Text = "";
                    txtClass.BackColor = Color.MidnightBlue;
                    txtSection.Text = "";
                    txtSection.BackColor = Color.MidnightBlue;
                }
            }

            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            saveRecords();
        }

        private void txtScholarshipName_TextChanged(object sender, EventArgs e)
        {
            txtScholarshipName.BackColor = Color.LightGray;
            conn = new NpgsqlConnection(SQLConn.DBcon);
            conn.Open();
            string cb = "select Amount from Scholarship where ScholarshipName='"+txtScholarshipName.Text+"'";
            cmd = new NpgsqlCommand(cb);
            cmd.Connection = conn;
            SQLConn.dr = cmd.ExecuteReader();
            if (SQLConn.dr.Read())
            {
                txtAmt.Text = SQLConn.dr.GetValue(0).ToString().Trim();
            }
        }

        private void cmbScholarship_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                conn = new NpgsqlConnection();
                conn.Open();
                string str = "select ScholarshipName, Amount, AdmissionNo, StudentName, Class, Section, DateOfPayment, ModeOfPayment, Description, TotalPaid, DuePayment from ScholarshipDetails where ScholarshipID='"+cmbScholarship+"'";
                cmd = new NpgsqlCommand(str);
                cmd.Connection = conn;
                SQLConn.dr = cmd.ExecuteReader();
                if (SQLConn.dr.Read() == true)
                {
                    txtScholarshipName.Text = SQLConn.dr.GetString(0).Trim();
                    txtAmt.Text = SQLConn.dr.GetString(1).Trim();
                    txtAdmissionNo.Text = SQLConn.dr.GetString(2).Trim();
                    txtStudName.Text = SQLConn.dr.GetString(3).Trim();
                    txtClass.Text = SQLConn.dr.GetString(4).Trim();
                    txtSection.Text = SQLConn.dr.GetString(5).Trim();
                    dateTimePicker1.Text = SQLConn.dr.GetString(6).Trim();
                    cmbMOP.Text = SQLConn.dr.GetString(7).Trim();
                    txtPMD.Text = SQLConn.dr.GetString(8).Trim();
                    txtTotalPaid.Text = SQLConn.dr.GetString(9).Trim();
                    txtDuePay.Text = SQLConn.dr.GetString(10).Trim();
                }
            }
            catch (Exception ex) { }
        }
    }
}
