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
    public partial class frmHostelEntry : Form
    {
        NpgsqlConnection conn = null;
        NpgsqlDataReader reader = null;
        NpgsqlCommand cmd = null;
        
        public frmHostelEntry()
        {
            InitializeComponent();

        }

        private void NewEntry() {

            cmbHostelName.Text = "";
            txtRoomID.Text = "";
            txtRoomID.BackColor = Color.MidnightBlue;
            cmbHostelName.Text = "";
            cmbHostelName.BackColor = Color.MidnightBlue;
            txtManagedBy.Text = "";
            txtManagedBy.BackColor = Color.MidnightBlue;
            txtEmptyRooms.Text = "";
            txtEmptyRooms.BackColor = Color.MidnightBlue;
            cmbHostelFee.Text = "";
            txtStudentID.Text = "";
            txtStudentID.BackColor = Color.MidnightBlue;
            txtFname.Text = "";
            txtSname.Text = "";
            txtGender.Text = "";
            txtEmailID.Text = "";
            btn_Del.Enabled = false;
            btn_Update.Enabled = false;
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void btn_New_Click(object sender, EventArgs e)
        {
            NewEntry();
        }

        private void cmbHostelName_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void txtManaged_TextChanged(object sender, EventArgs e)
        {
            txtRoomID.BackColor = Color.LightGray;

            try {
                conn = new NpgsqlConnection(SQLConn.DBcon);
                conn.Open();
                cmd = new NpgsqlCommand();
                cmd.CommandText = "select HostelName,HostelManager,EmptyRooms,HostelFee,AdmissionNo,FirstName,Surname,Gender,EmailAddress from Hostel where RoomID='"+txtRoomID.Text+"'";
                cmd.Connection = conn;
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    btn_Del.Enabled = true;
                    btn_Update.Enabled = true;
                    btn_Save.Enabled = false;
                    btn_New.Enabled = false;
                    txtStudentID.BackColor = Color.LightGray;
                    txtStudentID.Enabled = false;
                    cmbHostelName.Text = reader.GetString(0).Trim();
                    txtManagedBy.Text = reader.GetString(1).Trim();
                    txtEmptyRooms.Text = reader.GetString(2).Trim();
                    cmbHostelFee.Text = reader.GetString(3).Trim();
                    txtStudentID.Text = reader.GetString(4).Trim();
                    txtFname.Text = reader.GetString(5).Trim();
                    txtSname.Text = reader.GetString(6).Trim();
                    txtGender.Text = reader.GetString(7).Trim();
                    txtEmailID.Text = reader.GetString(8).Trim();
                    conn.Close();
                }

                else {
                    cmbHostelName.Text = "";
                    txtManagedBy.Text = "";
                    txtEmptyRooms.Text = "";
                    cmbHostelFee.Text = "";
                    txtStudentID.Text = "";
                    txtStudentID.Enabled = true;
                    txtStudentID.BackColor = Color.MidnightBlue;
                    txtFname.Text = "";
                    txtSname.Text = "";
                    txtGender.Text = "";
                    txtEmailID.Text = "";
                    btn_Del.Enabled = false;
                    btn_Update.Enabled = false;
                    btn_Save.Enabled = true;
                    btn_New.Enabled = true;
                }

            }
            catch (Exception ex)
            {
              //  MessageBox.Show(ex.Message);
            }
        }

        private void txtMobileNo_TextChanged(object sender, EventArgs e)
        {
          //  txtMobileNo.BackColor = Color.LightGray;
        }

        private void txtEmptyBeds_TextChanged(object sender, EventArgs e)
        {
            txtEmptyRooms.BackColor = Color.LightGray;
        }

        private void InsertRecords()
        {
            if (txtRoomID.Text == "")
            {
                MessageBox.Show("Please Enter Room Number", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtRoomID.Focus();
                return;
            }
            if (cmbHostelName.Text == "")
            {
                MessageBox.Show("Please Enter or Select Hostel Name ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                cmbHostelName.Focus();
                return;
            }

            if (txtManagedBy.Text == "")
            {
                MessageBox.Show("Please Enter Manager's Name", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtManagedBy.Focus();
                return;
            }

            if (txtEmptyRooms.Text == "")
            {
                MessageBox.Show("Please Specify the number of Empty Rooms", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtEmptyRooms.Focus();
                return;
            }

            if (cmbHostelFee.Text == "")
            {
                MessageBox.Show("Please Enter Hostel's Payment", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                cmbHostelFee.Focus();
                return;
            }
            conn = new NpgsqlConnection(SQLConn.DBcon);
            conn.Open();
            string str = "insert into Hostel (RoomID,HostelName,Hostelmanager,EmptyRooms,HostelFee,AdmissionNo,FirstName,Surname,Gender,EmailAddress) values(@d1,@d2,@d3,@d4,@d5,@d6,@d7,@d8,@d9,@d10)";
            cmd = new NpgsqlCommand(str);
            cmd.Connection = conn;
            SQLConn.cmd.Parameters.AddWithValue("@d1",txtRoomID.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d2", cmbHostelName.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d3", txtManagedBy.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d4", txtEmptyRooms.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d5", cmbHostelFee.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d6", txtStudentID.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d7", txtFname.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d8", txtSname.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d9", txtGender.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d10", txtEmailID.Text);

            cmd.ExecuteReader();
            conn.Close();
            MessageBox.Show(cmbHostelName.Text + txtRoomID.Text + " " + "Allocated to" + " " + txtFname.Text + txtSname.Text, "Hostel Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
            txtStudentID.Enabled = true;

        }
        private void updateRecords()
        {
            conn = new NpgsqlConnection(SQLConn.DBcon);
            conn.Open();
            string str = "Update Hostel Set HostelName=@d2,Hostelmanager=@d3,EmptyRooms=@d4,HostelFee=@d5,AdmissionNo=@d6,FirstName=@d7,Surname=@d8,Gender=@d9,EmailAddress=@d10 Where RoomID=@d1 ";
            cmd = new NpgsqlCommand(str);
            cmd.Connection = conn;
            SQLConn.cmd.Parameters.AddWithValue("@d1", txtRoomID.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d2", cmbHostelName.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d3", txtManagedBy.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d4", txtEmptyRooms.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d5", cmbHostelFee.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d6", txtStudentID.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d7", txtFname.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d8", txtSname.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d9", txtGender.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d10", txtEmailID.Text);

            cmd.ExecuteReader();
            conn.Close();
            MessageBox.Show(cmbHostelName.Text+txtRoomID.Text +" " +"Allocated to" + " " + txtFname.Text + txtSname.Text, "Hostel Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
            txtStudentID.Enabled = true;


        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void Hostel_Entry_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'eRPDataSet7.Hostel' table. You can move, or remove it, as needed.
        //    this.hostelTableAdapter.Fill(this.eRPDataSet7.Hostel);
            txtFname.BackColor = Color.Lavender;
            txtFname.Enabled = false;
            txtSname.BackColor = Color.Lavender;
            txtSname.Enabled = false;
            txtGender.BackColor = Color.Lavender;
            txtGender.Enabled = false;
            txtEmailID.BackColor = Color.Lavender;
            txtEmailID.Enabled = false;

        }

        private void txtManagedBy_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void btn_Save_Click(object sender, EventArgs e)
        {
            InsertRecords();
            NewEntry();
        }

        private void txtStudentID_TextChanged(object sender, EventArgs e)
        {
            try {
                conn = new NpgsqlConnection(SQLConn.DBcon);
                conn.Open();
                cmd = new NpgsqlCommand();
                cmd.CommandText = "select RoomID,HostelName,HostelManager,EmptyRooms,HostelFee,FirstName,Surname,Gender,EmailAddress from Hostel where AdmissionNo=@findAdm";
                SQLConn.cmd.Parameters.AddWithValue("@findAdm", txtStudentID.Text);
                cmd.Connection = conn;
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    btn_Del.Enabled = true;
                    btn_Update.Enabled = true;
                    btn_Save.Enabled = false;
                    btn_New.Enabled = false;
                    txtStudentID.BackColor = Color.LightGray;
                    txtStudentID.Enabled = false;
                    txtRoomID.Text = reader.GetString(0).Trim();
                    cmbHostelName.Text = reader.GetString(1).Trim();
                    txtManagedBy.Text = reader.GetString(2).Trim();
                    txtEmptyRooms.Text = reader.GetString(3).Trim();
                    cmbHostelFee.Text = reader.GetString(4).Trim();
                    txtFname.Text = reader.GetString(5).Trim();
                    txtSname.Text = reader.GetString(6).Trim();
                    txtGender.Text = reader.GetString(7).Trim();
                    txtEmailID.Text = reader.GetString(8).Trim();
                }

            }

            catch (Exception ex) {
               // MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btn_Update_Click(object sender, EventArgs e)
        {
            updateRecords();
            NewEntry();
        }
        private void del()
        {
            try { 
                if (txtRoomID!=null&&txtStudentID!=null){
                    conn = new NpgsqlConnection(SQLConn.DBcon);
                    cmd = new NpgsqlCommand();
                    conn.Open();
                    cmd.CommandText = "delete from Hostel where RoomID = '" + txtRoomID.Text + "'";
                    cmd.Connection = conn;
                    SQLConn.cmd.Parameters.AddWithValue("@d1", txtRoomID.Text);
                    reader = cmd.ExecuteReader();

                    if (reader!=null){
                    conn.Close();
                    MessageBox.Show(txtFname.Text+txtSname.Text +" " +"has been removed from " +cmbHostelName.Text+" " +txtRoomID.Text );

                  }
                }
            }
            catch (Exception exception) {
                MessageBox.Show(exception.Message);
            }
        }

        private void btn_Del_Click(object sender, EventArgs e)
        {
            del();
            NewEntry();
        }

        private void btn_ViewData_Click(object sender, EventArgs e)
        {
            GetData();
        }
        public void GetData()
        {
            try
            {
                conn = new NpgsqlConnection(SQLConn.DBcon);
                conn.Open();
                cmd = new NpgsqlCommand("SELECT RTRIM(RoomID),RTRIM(HostelName),RTRIM(HostelManager),RTRIM(EmptyRooms),RTRIM(HostelFee),RTRIM(AdmissionNo),RTRIM(FirstName),RTRIM(Surname),RTRIM(Gender),RTRIM(EmailAddress) from Hostel", conn);
                reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                dataGridView1.Rows.Clear();
                while (reader.Read() == true)
                {
                    dataGridView1.Rows.Add(reader[0], reader[1], reader[2], reader[3], reader[4], reader[5], reader[6], reader[7], reader[8], reader[9]);
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void reportDocument1_InitReport(object sender, EventArgs e)
        {

        }
    }
}
