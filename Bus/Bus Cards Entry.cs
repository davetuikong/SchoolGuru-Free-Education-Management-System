using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using Npgsql;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SchoolGuru
{
    public partial class Bus_Cards_Entry : Form
    {
        NpgsqlConnection conn = null;
        NpgsqlCommand cmd = null;
        
        
        public Bus_Cards_Entry()
        {
            InitializeComponent();
        }
        private void AutoGenerateBusCardSerialNo()
        {
                txtSerialNo.Text=("A-")+GetBusCardSerialNo(6);
        }
        private static String GetBusCardSerialNo(int maxSize) {
            char[] chars = new char[6];
            chars = "654321".ToCharArray();
            byte[] data = new byte[1];
            RNGCryptoServiceProvider crypto = new RNGCryptoServiceProvider();
            crypto.GetNonZeroBytes(data);
            data = new byte[maxSize];
            crypto.GetNonZeroBytes(data);
            StringBuilder result = new StringBuilder(maxSize);
            foreach (byte b in data)
            {
                result.Append(chars[b % (chars.Length)]);
            }
            return result.ToString();
        }

        private void ResetAll() {
            txtSerialNo.Text = " ";
            cmbLocation.Text = " ";
            txtSection.Text = " ";
            txtClass.Text = " ";
            txtStudentName.Text = " ";
            txtStudentID.Text = " ";
            dateTimePicker1.Text = "";
        }

        private void button2_Click(object sender, EventArgs e)
        {

            if (txtStudentID.Text == "")
            {
                txtStudentID.BackColor = Color.Red;
                MessageBox.Show("Please Enter Admission No:", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtStudentID.BackColor = Color.MidnightBlue;
                txtStudentID.Focus();
                return;
            }

            if (txtStudentName.Text == "")
            {
                txtStudentName.BackColor = Color.Red;
                MessageBox.Show("Please Enter Student Name", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtStudentName.BackColor = Color.MidnightBlue;
                txtStudentName.Focus();
                return;
            }
            if (txtClass.Text == "")
            {
                txtClass.BackColor = Color.Red;
                MessageBox.Show("Please Enter Class", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtClass.BackColor = Color.MidnightBlue;
                txtClass.Focus();
                return;
            }
            try {
                conn = new NpgsqlConnection(SQLConn.DBcon);
                conn.Open();
                string cb = "Delete from StudentsBusCardHolder where StudentID =@FindRecords";
                cmd = new NpgsqlCommand(cb);
                cmd.Connection = conn;
                SQLConn.cmd.Parameters.AddWithValue("@FindRecords", txtStudentID.Text);
                SQLConn.dr = cmd.ExecuteReader();
                MessageBox.Show("Deleted Successful","Records Deleted",MessageBoxButtons.OK,MessageBoxIcon.Information);
            }
            catch(Exception ex){
                MessageBox.Show(ex.Message);
            }
        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void txtStudentID_TextChanged(object sender, EventArgs e)
        {
            try {
                conn = new NpgsqlConnection(SQLConn.DBcon);
                conn.Open();
                string cb = "Select FirstName, Surname, Class, Section from StudentsDetails where AdmissionNo = @findStudentID";
                cmd = new NpgsqlCommand(cb);
                cmd.Connection = conn;
                SQLConn.cmd.Parameters.AddWithValue("@findStudentID", txtStudentID.Text);
                SQLConn.dr = cmd.ExecuteReader();
                if (SQLConn.dr.Read()) {
                    txtStudentID.BackColor = Color.LightGray;
                    txtStudentName.Text = SQLConn.dr.GetValue(0).ToString().Trim() +" " +SQLConn.dr.GetValue(1).ToString().Trim();
                    txtStudentName.BackColor = Color.LightGray;
                    txtClass.Text = SQLConn.dr.GetValue(2).ToString().Trim();
                    txtClass.BackColor = Color.LightGray;
                    txtSection.Text = SQLConn.dr.GetValue(3).ToString().Trim();
                    txtSection.BackColor = Color.LightGray;

                    AutoGenerateBusCardSerialNo();
                }
                else
                {
                    txtStudentID.BackColor = Color.MidnightBlue;
                    txtStudentName.Text = "";
                    txtStudentName.BackColor = Color.MidnightBlue;
                    txtClass.BackColor = Color.MidnightBlue;
                    txtClass.Text = "";
                    txtSection.BackColor = Color.MidnightBlue;
                    txtSection.Text = "";
                }
            }
            catch (Exception ex) {
                MessageBox.Show(ex.Message);
            }
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void btnViewData_Click(object sender, EventArgs e)
        {
        }

        private void btnSave_Click(object sender, EventArgs e)
        {

            if (txtStudentID.Text == "")
            {
                txtStudentID.BackColor = Color.Red;
                MessageBox.Show("Please Enter Admission No:", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtStudentID.BackColor = Color.MidnightBlue;
                txtStudentID.Focus();
                return;
            }

            if (txtStudentName.Text == "")
            {
                txtStudentName.BackColor = Color.Red;
                MessageBox.Show("Please Enter Student Name", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtStudentName.BackColor = Color.MidnightBlue;
                txtStudentName.Focus();
                return;
           }
            if (txtClass.Text == "")
            {
                txtClass.BackColor = Color.Red;
                MessageBox.Show("Please Enter Class", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtClass.BackColor = Color.MidnightBlue;
                txtClass.Focus();
                return;
            }
            if (txtSection.Text == "")
            {
                txtSection.BackColor = Color.Red;
                MessageBox.Show("Please Enter Section", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtSection.BackColor = Color.MidnightBlue;
                txtSection.Focus();
                return;
            }
            if (cmbLocation.Text == "")
            {
                cmbLocation.BackColor = Color.Red;
                MessageBox.Show("Please Enter Location", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                cmbLocation.BackColor = Color.MidnightBlue;
                cmbLocation.Focus();
                return;
            }
            if (txtSerialNo.Text == "")
            {
                txtStudentName.BackColor = Color.Red;
                MessageBox.Show("Please Enter Bus Card Serial No", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtSerialNo.BackColor = Color.MidnightBlue;
                txtSerialNo.Focus();
                return;
            }

            try {
                    conn = new NpgsqlConnection(SQLConn.DBcon);
                    cmd = new NpgsqlCommand();
                    cmd.Connection = conn;
                    conn.Open();
                    cmd.CommandText = "delete from StudentsBusCardHolder where StudentID = '"+txtStudentID.Text+"'";
                    cmd.ExecuteNonQuery();

                    string cb2 = "insert into StudentsBusCardHolder(StudentID, StudentName, Class, Section, Location,BusCardSerialNo, StartingDate)values(@a1,@a2,@a3,@a4,@a5,@a6,@a7) ";
                    cmd = new NpgsqlCommand(cb2);
                    cmd.Connection = conn;
                    SQLConn.cmd.Parameters.AddWithValue("@a1", txtStudentID.Text);
                    SQLConn.cmd.Parameters.AddWithValue("@a2", txtStudentName.Text);
                    SQLConn.cmd.Parameters.AddWithValue("@a3", txtClass.Text);
                    SQLConn.cmd.Parameters.AddWithValue("@a4", txtSection.Text);
                    SQLConn.cmd.Parameters.AddWithValue("@a5", cmbLocation.Text);
                    SQLConn.cmd.Parameters.AddWithValue("@a6", txtSerialNo.Text);
                    SQLConn.cmd.Parameters.AddWithValue("@a7", dateTimePicker1.Text);
                    SQLConn.dr = cmd.ExecuteReader();
                    conn.Close();
                    MessageBox.Show(txtStudentName.Text + " " + "has been given a bus card with serial no :" + " " + txtSerialNo.Text);
                    ResetAll();
            }
            catch(Exception ex){
                MessageBox.Show(ex.Message);
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {

            if (txtStudentID.Text == "")
            {
                txtStudentID.BackColor = Color.Red;
                MessageBox.Show("Please Enter Admission No:", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtStudentID.BackColor = Color.MidnightBlue;
                txtStudentID.Focus();
                return;
            }

            if (txtStudentName.Text == "")
            {
                txtStudentName.BackColor = Color.Red;
                MessageBox.Show("Please Enter Student Name", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtStudentName.BackColor = Color.MidnightBlue;
                txtStudentName.Focus();
                return;
            }
            if (txtClass.Text == "")
            {
                txtClass.BackColor = Color.Red;
                MessageBox.Show("Please Enter Class", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtClass.BackColor = Color.MidnightBlue;
                txtClass.Focus();
                return;
            }
            if (txtSection.Text == "")
            {
                txtSection.BackColor = Color.Red;
                MessageBox.Show("Please Enter Section", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtSection.BackColor = Color.MidnightBlue;
                txtSection.Focus();
                return;
            }
            if (cmbLocation.Text == "")
            {
                cmbLocation.BackColor = Color.Red;
                MessageBox.Show("Please Enter Location", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                cmbLocation.BackColor = Color.MidnightBlue;
                cmbLocation.Focus();
                return;
            }
            if (txtSerialNo.Text == "")
            {
                txtStudentName.BackColor = Color.Red;
                MessageBox.Show("Please Enter Bus Card Serial No", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtSerialNo.BackColor = Color.MidnightBlue;
                txtSerialNo.Focus();
                return;
            }

            try
            {
                conn = new NpgsqlConnection(SQLConn.DBcon);
                cmd = new NpgsqlCommand();
                cmd.Connection = conn;
                conn.Open();
                cmd.CommandText = "delete from StudentsBusCardHolder where StudentID = '" + txtStudentID.Text + "'";
                cmd.ExecuteNonQuery();

                string cb2 = "update StudentsBusCardHolder set StudentID=@a1, StudentName=@a2, Class=@a3, Section=@a4, Location=@a5,BusCardSerialNo=@a6, StartingDate=@a7 ";
                cmd = new NpgsqlCommand(cb2);
                cmd.Connection = conn;
                SQLConn.cmd.Parameters.AddWithValue("@a1", txtStudentID.Text);
                SQLConn.cmd.Parameters.AddWithValue("@a2", txtStudentName.Text);
                SQLConn.cmd.Parameters.AddWithValue("@a3", txtClass.Text);
                SQLConn.cmd.Parameters.AddWithValue("@a4", txtSection.Text);
                SQLConn.cmd.Parameters.AddWithValue("@a5", cmbLocation.Text);
                SQLConn.cmd.Parameters.AddWithValue("@a6", txtSerialNo.Text);
                SQLConn.cmd.Parameters.AddWithValue("@a7", dateTimePicker1.Text);
                SQLConn.dr = cmd.ExecuteReader();
                conn.Close();
                MessageBox.Show(txtStudentName.Text + "'s" +" "+" Details "+ "has been Updated Successfully ");
                ResetAll();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void Bus_Cards_Entry_Load(object sender, EventArgs e)
        {

        }
    }
}
