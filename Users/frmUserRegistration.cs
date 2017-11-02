using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Npgsql;

namespace SchoolGuru
{
    public partial class frmUserRegistration : Form
    {
   
     
     
        public frmUserRegistration()
        {
            InitializeComponent();
        }

        public void FillUsers()
        {
            try
            {
                SQLConn.ConnOpen();
                SQLConn.sqL = "select name,userid, usertype,phone,email, id from user_registration";
              


                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
         
                DGV.DataSource = null;
                DataTable dt = new DataTable();
                SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);
                SQLConn.da.Fill(dt);
                DGV.DataSource = dt;

                SQLConn.ConnClose();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
       
        private void UpdateUser()
        {
            try
            {
                SQLConn.ConnOpen();
                SQLConn.sqL = "update user_registration set usertype=@d1,UserID=@d2,password=@d3,name=@d4,phone=@d5,email=@d6 where id='"+txtUserId.Tag+"'";
               SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.cmd.Parameters.AddWithValue("@d1", cmbRole.Text);
                SQLConn.cmd.Parameters.AddWithValue("@d2", txtUserId.Text);
                SQLConn.cmd.Parameters.AddWithValue("@d3", txtPassword.Text);
                SQLConn.cmd.Parameters.AddWithValue("@d4", txtName.Text);
                SQLConn.cmd.Parameters.AddWithValue("@d5", txtPhone.Text);
                SQLConn.cmd.Parameters.AddWithValue("@d6", txtEmail.Text);
                SQLConn.cmd.ExecuteNonQuery();
                SQLConn.ConnClose();
                MessageBox.Show("Updated Successfully", "System Users Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception EX)
            {
                MessageBox.Show(EX.Message);
            }
        }
        private void LoadUser()
        {
            try {
                SQLConn.ConnOpen();
       SQLConn.sqL= "Select usertype,password,name,phone,email,id from user_registration where id='"+txtUserId.Tag+"'";
            SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
            SQLConn.dr = SQLConn.cmd.ExecuteReader();
            while(SQLConn.dr.Read()){
                     cmbRole.Text = SQLConn.dr["usertype"].ToString();
                  
                    txtPassword.Text = SQLConn.dr["usertype"].ToString();
                    txtName.Text = SQLConn.dr["name"].ToString();
                    txtPhone.Text = SQLConn.dr["phone"].ToString();
                    txtEmail.Text = SQLConn.dr["email"].ToString();
                btnReg.Enabled = false;
                btnNew.Enabled = false;
                SQLConn.ConnClose();
            }
            }
            catch(Exception ex){
               // MessageBox.Show(ex.Message);
            }
        }
        private void AddUser()
        {
            SQLConn.ConnOpen();
            SQLConn.sqL = "insert into user_registration (usertype,userid,password,name,phone,email) values(@d1,@d2,@d3,@d4,@d5,@d6)";
            SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
            SQLConn.cmd.Parameters.AddWithValue("@d1",cmbRole.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d2", txtUserId.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d3", txtPassword.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d4", txtName.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d5", txtPhone.Text);
            SQLConn.cmd.Parameters.AddWithValue("@d6", txtEmail.Text);
            SQLConn.cmd.ExecuteNonQuery();
            MessageBox.Show("Registered Successfully","System Users Info",MessageBoxButtons.OK,MessageBoxIcon.Information);
            SQLConn.ConnClose();
        }
        private void Clears(){
       
    
            txtUserId.Text = "";
   
            txtPassword.Text = null;
  
            txtName.Text = "";
      
            txtPhone.Text = "";
    
            txtEmail.Text = "";
       
            btnReg.Enabled = true;
            btnNew.Enabled = true;
            btnDel.Enabled = true;
            btnUpdate.Enabled = true;
    }

        private void frmRegistration_Load(object sender, EventArgs e)
        {
            FillUsers();
            btnDel.Enabled = false;
            btnUpdate.Enabled = false;
            btnReg.Enabled = true;

        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            Clears();
        }

     

       



        private void username_TextChanged(object sender, EventArgs e)
        {
            LoadUser();
        }


        private void password_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {

            ValidateEntry(); 
            UpdateUser();
            FillUsers();
       
        }

        private void btnDel_Click(object sender, EventArgs e)
        {
            DeleteUser();
            FillUsers();
        }

        private void DeleteUser()
        {
            try
            {
                SQLConn.ConnOpen();
                if (txtUserId.Tag.ToString() == "1")
                {
                    MessageBox.Show("Cannot Delete Super Admin");
                    return;

                }
                SQLConn.sqL = "delete from user_registration where id=@f1";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.cmd.Parameters.AddWithValue("@f1", txtUserId.Tag);
                SQLConn.cmd.ExecuteNonQuery();
                SQLConn.ConnClose();
                MessageBox.Show("Deleted Successfully");
                Clears();
            }

            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());

            }
        }

        private void btnReg_Click(object sender, EventArgs e)
        {

            ValidateEntry(); 
            
            AddUser();
            FillUsers();
        }

        private void ValidateEntry()
        {
            if (txtUserId.Text == "" || txtName.Text == "" || cmbRole.Text == "" || txtPassword.Text == "")
            {
                MessageBox.Show("You Must Enter Name, Username,Password and Role");
                return;
            }
            if (txtPassword.Text.Length < 4)
            {
                MessageBox.Show("Minimum 4 Password Characters");

            }
        }

        private void txtUserId_TextChanged(object sender, EventArgs e)
        {
            LoadUser();
        }

        private void DGV_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {

            DataGridViewRow row = DGV.SelectedRows[0];
            if (row.IsNewRow) return;
            txtUserId.Tag = row.Cells["id"].Value.ToString();
            txtUserId.Text = row.Cells["userid"].Value.ToString();
            btnUpdate.Enabled = true;
            btnDel.Enabled = true;
   

        }


   
      
    }
}
