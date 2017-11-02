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
    public partial class frmChangePassword : Form
    {
        NpgsqlConnection con = null;
        NpgsqlCommand cmd = null;
        

        public frmChangePassword()
        {
            InitializeComponent();
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void btn_changepass_Click(object sender, EventArgs e)
        {

            try
            {
                int RowsAffected = 0;
                if ((txtUserID.Text.Trim().Length == 0))
                {
                    MessageBox.Show("Please enter UserID", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtUserID.Focus();
                    return;
                }
                if ((txtOldPassword.Text.Trim().Length == 0))
                {
                    MessageBox.Show("Please enter old password", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtOldPassword.Focus();
                    return;
                }
                if ((txtNewPassword.Text.Trim().Length == 0))
                {
                    MessageBox.Show("Please enter new password", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtNewPassword.Focus();
                    return;
                }
                if ((txtConfirmPassword.Text.Trim().Length == 0))
                {
                    MessageBox.Show("Please confirm new password", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtConfirmPassword.Focus();
                    return;
                }
                if ((txtNewPassword.TextLength < 5))
                {
                    MessageBox.Show("The New Password Should be of Atleast 4 Characters", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtNewPassword.Text = "";
                    txtConfirmPassword.Text = "";
                    txtNewPassword.Focus();
                    return;
                }
                else if ((txtNewPassword.Text != txtConfirmPassword.Text))
                {
                    MessageBox.Show("Password do not match", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtNewPassword.Text = "";
                    txtOldPassword.Text = "";
                    txtConfirmPassword.Text = "";
                    txtOldPassword.Focus();
                    return;
                }
                else if ((txtOldPassword.Text == txtNewPassword.Text))
                {
                    MessageBox.Show("Password is same..Re-enter new password", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtNewPassword.Text = "";
                    txtConfirmPassword.Text = "";
                    txtNewPassword.Focus();
                    return;
                }

                
                con.Open();
               SQLConn.sqL = "Update user_registration set password = '" + txtNewPassword.Text + "'where userid='" + txtUserID.Text + "' and password = '" + txtOldPassword.Text + "'";

                SQLConn.ConnOpen();

                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);

                RowsAffected = SQLConn.cmd.ExecuteNonQuery();
                if ((RowsAffected > 0))
                {
                    MessageBox.Show("Successfully changed", "Password", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.Hide();
                    txtUserID.Text = "";
                    txtNewPassword.Text = "";
                    txtOldPassword.Text = "";
                    txtConfirmPassword.Text = "";
                    //frmLogin LoginForm1 = new frmLogin();
                    //LoginForm1.Show();
                    //LoginForm1.cmbUsertype.Text = "";
                    //LoginForm1.UserID.Text = "";
                    //LoginForm1.Password.Text = "";
                    //LoginForm1.ProgressBar1.Visible = false;
                    //LoginForm1.cmbUsertype.Focus();
                }
                else
                {
                    MessageBox.Show("invalid userID or password", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtUserID.Text = "";
                    txtNewPassword.Text = "";
                    txtOldPassword.Text = "";
                    txtConfirmPassword.Text = "";
                    txtUserID.Focus();
                }
                if ((con.State == ConnectionState.Open))
                {
                    con.Close();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }
    }
}
