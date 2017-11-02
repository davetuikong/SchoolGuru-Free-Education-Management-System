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
    public partial class frmLogin : Form
    {
      

        public frmLogin()
        {
            InitializeComponent();

            this.BringToFront();
            
        }

       
        private void Form1_Load(object sender, EventArgs e)
        {



       
            if (!SQLConn.IsServerConnected())
            {

               MessageBox.Show("You database is not yet configured  or is not configured correctly \n You will be redirected to Database configuration form ", "Database Configuration");
               frmDatabaseConfig frm = new frmDatabaseConfig();
                frm.ShowDialog();
              this.Close();

            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            DialogResult x;
            x = MessageBox.Show("Are you sure you want to Close?", "Confirmation Box", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (x == DialogResult.Yes)
            {
                Application.Exit();
            }

            else {
                MessageBox.Show("Save any data befoe you exit");
            }
        }

        protected override bool ProcessCmdKey(ref Message msg, Keys keyData)
        {
            bool bHandled = false;
            // switch case is the easy way, a hash or map would be better, 
            // but more work to get set up.
            switch (keyData)
            {
                case Keys.F5:
                   
                frmDatabaseConfig frm = new frmDatabaseConfig();
                frm.ShowDialog();
                    bHandled = true;
                    break;
            }
            return bHandled;
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            //this.Hide();
            frmChangePassword frm = new frmChangePassword();
            frm.Show();
        }

        private void btn_ok_Click(object sender, EventArgs e)
        {
          
            if (UserID.Text == "")
            {
                MessageBox.Show("Please enter user ID", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                UserID.Focus();
                return;
            }
            if (Password.Text == "")
            {
                MessageBox.Show("Please enter password", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                Password.Focus();
                return;
            }
            try
            {

                SQLConn.ConnOpen();
               
                

               SQLConn.cmd= SQLConn.conn.CreateCommand();
               SQLConn.cmd.CommandText = "SELECT userid,password,name, usertype  FROM user_registration where userid = @d1 and password=@d2";
               SQLConn.cmd.Parameters.AddWithValue("@d1", UserID.Text);
               SQLConn.cmd.Parameters.AddWithValue("@d2", Password.Text);
               SQLConn.dr = SQLConn.cmd.ExecuteReader();
                if (SQLConn.dr.Read())
                {
                  
                 
                    SQLConn.USERNAME=SQLConn.dr["name"].ToString();
                    SQLConn.USERID = SQLConn.dr["userid"].ToString();
                    SQLConn.USERTYPE = SQLConn.dr["usertype"].ToString();
    
                 
                    if ((SQLConn.dr != null))
                    {
                        SQLConn.dr.Close();
                    }
                    SQLConn.ConnClose();

 

                    switch(SQLConn.USERTYPE) {
                        case "Librarian":   
                      
                        Librarian_Window frm = new Librarian_Window();
                 
                        frm.UserType.Text = SQLConn.USERTYPE;
                        frm.Show();

                        //    }
                        //    if (cmbUsertype.Text == "Account Officer")
                        //    {
                        //        this.Hide();
                        //        Account_Officer_Window frm = new Account_Officer_Window();
                        //        frm.User.Text = UserID.Text;
                        //        frm.UserType.Text = cmbUsertype.Text;
                        //        frm.Show();

                        //        ProgressBar1.Visible = true;
                        //        ProgressBar1.Maximum = 5000;
                        //        ProgressBar1.Minimum = 0;
                        //        ProgressBar1.Value = 4;
                        //        ProgressBar1.Step = 1;
                        //        for (int i = 0; i <= 5000; i++)
                        //        {
                        //            ProgressBar1.PerformStep();
                        //        }
                        //        /*st1 = UserID.Text;
                        //        st2 = "Successfully logged in";
                        //        cf.LogFunc(st1, System.DateTime.Now, st2);
                        //        this.Hide();
                        //        frm.Show();*/

                        //    }

                  break ;

                        case "Admin":
                        
                            this.Hide();
                            frmMain frmadmin  = new frmMain();
                             frmadmin.Show();

                            ////        //frm.User.Text = txtUserName.Text;
                            ////        frm.User.Text = UserID.Text;
                            ////        frm.UserType.Text = cmbUsertype.Text;
                            ////        frm.Show();
                            ////        // frm.registrationToolStripMenuItem2.Enabled = true;
                            ////        frm.studentDetailsToolStripMenuItem.Enabled = true;

                            ////        frm.hostelersToolStripMenuItem.Enabled = true;
                            ////        frm.busHoldersToolStripMenuItem.Enabled = true;


                            ////        frm.Master_entryMenu.Enabled = true;
                            ////        frm.usersToolStripMenuItem.Enabled = true;
                            ////        frm.studentToolStripMenuItem.Enabled = true;
                            ////        frm.employeeToolStripMenuItem.Enabled = true;
                            ////        frm.transactionToolStripMenuItem.Enabled = true;
                            ////        frm.searchToolStripMenuItem.Enabled = true;
                            ////        frm.reportToolStripMenuItem.Enabled = true;


                            ////        frm.busFeePaymentToolStripMenuItem2.Enabled = true;
                            ////        frm.feePaymentToolStripMenuItem.Enabled = true;
                            ////        frm.employeeSalaryToolStripMenuItem.Enabled = true;
                            ////        frm.hostelFeesPaymentToolStripMenuItem.Enabled = true;
                            ////        frm.scholarshipPaymentToolStripMenuItem.Enabled = true;

                            ////        st1 = UserID.Text;
                            ////        st2 = "Successfully logged in";
                            ////        //  cf.LogFunc(st1, System.DateTime.Now, st2);
                         
                     break;
                                    
                    
                    }
                }
                else
                {

                    MessageBox.Show("Login Failed...Try again !", "Login Denied", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    UserID.Clear();
                    UserID.BackColor = Color.MidnightBlue;
                    Password.Clear();
                    Password.BackColor = Color.MidnightBlue;
                    UserID.Focus();
                  


                }

            }
            catch (NpgsqlException ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            finally
            {
                SQLConn.cmd.Dispose();
                SQLConn.ConnClose();

            }
        }

        private void Password_TextChanged(object sender, EventArgs e)
        {
            Password.BackColor = Color.LightGray;
        }

        private void cmbUsertype_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void UserID_TextChanged(object sender, EventArgs e)
        {
            UserID.BackColor = Color.LightGray;
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            this.Close();
        }

        private void cmdClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
