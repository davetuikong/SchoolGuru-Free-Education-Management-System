using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Npgsql;
using System.Security.Cryptography;

namespace SchoolGuru
{
    public partial class frmEmployeePayment : Form
    {
        
        DataTable dtable = new DataTable();
        NpgsqlConnection con = null;

        DataSet ds = new DataSet();
        NpgsqlCommand cmd = null;
        DataTable dt = new DataTable();
        
        clsFunc cf = new clsFunc();
        string st1;
        string st2;
        public frmEmployeePayment()
        {
            InitializeComponent();
        }

        public static string GetUniqueKey(int maxSize)
        {
            char[] chars = new char[62];
            chars =
            "123456789".ToCharArray();
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
        private void auto()
        {
            PaymentID.Text = "EP-" + GetUniqueKey(8);
        }
        private void AutocompleStaffID()
        {
            try
            {

                
                con.Open();


                string ct = "select distinct RTRIM(StaffID) from staff";

                cmd = new NpgsqlCommand(ct);
                cmd.Connection = con;

                SQLConn.dr = cmd.ExecuteReader();

                while (SQLConn.dr.Read())
                {
                    cmbstaffid.Items.Add(SQLConn.dr[0]);
                }
                con.Close();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void txtStaffID_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                

                con.Open();
                cmd = con.CreateCommand();

                cmd.CommandText = "SELECT StaffName,Designation,Department,BasicSalary FROM staffwhere StaffID = '" + cmbstaffid.Text + "'";
                SQLConn.dr = cmd.ExecuteReader();

                if (SQLConn.dr.Read())
                {
                    txtEmployeeName.Text = SQLConn.dr.GetString(0).Trim();
                    txtDesignation.Text = SQLConn.dr.GetString(1).Trim();
                    txtDepartment.Text = SQLConn.dr.GetString(2).Trim();
                    txtBasicSalary.Text = SQLConn.dr.GetInt32(3).ToString();
                }

               if ((SQLConn.dr != null))
                {
                    SQLConn.dr.Close();
                }
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void frmEmployeepayment_Load(object sender, EventArgs e)
        {
            AutocompleStaffID();
        }

        private void txtTotalPaid_TextChanged(object sender, EventArgs e)
        {
            int val1 = 0;
            int val2 = 0;
            int val3 = 0;
            int.TryParse(txtBasicSalary.Text, out val1);
            int.TryParse(txtDeduction.Text, out val2);
            int.TryParse(txtTotalPaid.Text, out val3);

            int I = (val1 - (val2 + val3));

            txtDuepayment.Text = I.ToString();
        }

        private void txtDeduction_TextChanged(object sender, EventArgs e)
        {
            int val1 = 0;
            int val2 = 0;
            int val3 = 0;
            int.TryParse(txtBasicSalary.Text, out val1);
            int.TryParse(txtDeduction.Text, out val2);
            int.TryParse(txtTotalPaid.Text, out val3);

            int I = (val1 - (val2 + val3));

            txtDuepayment.Text = I.ToString();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            try
            {

                if (cmbstaffid.Text == "")
                {
                    MessageBox.Show("Please select Staff ID", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    cmbstaffid.Focus();
                    return;
                }


                if (txtModeOfPayment.Text == "")
                {
                    MessageBox.Show("Please select mode of payment", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtModeOfPayment.Focus();
                    return;
                }
                if (txtTotalPaid.Text == "")
                {
                    MessageBox.Show("Please enter total paid", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtTotalPaid.Focus();
                    return;
                }
               

               auto();
                
                con.Open();

                string cb = "insert into staffpayment(EmppaymentID,StaffID,BasicSalary,PaymentDate,ModeOfPayment,PaymentModeDetails,TotalPaid,Deduction,DuePayment) VALUES (@d1,@d2,@d3,@d4,@d5,@d6,@d7,@d8,@d9)";

                cmd = new NpgsqlCommand(cb);

                cmd.Connection = con;
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d1",  "EmpPaymentID"));
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d2",  "StaffID"));
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d3", "BasicSalary"));
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d4",  "PaymentDate"));
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d5", "ModeOfPayment"));
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d6", "PaymentModeDetails"));
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d7",  "TotalPaid"));
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d8",  "Deduction"));
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d9",  "Duepayment"));
                SQLConn.cmd.Parameters["@d1"].Value = PaymentID.Text.Trim();
                SQLConn.cmd.Parameters["@d2"].Value = cmbstaffid.Text.Trim();
                SQLConn.cmd.Parameters["@d3"].Value = txtBasicSalary.Text.Trim();
                SQLConn.cmd.Parameters["@d4"].Value = (PaymentDate.Text);
                SQLConn.cmd.Parameters["@d5"].Value = (txtModeOfPayment.Text);
                SQLConn.cmd.Parameters["@d6"].Value = (txtPaymentModeDetails.Text);
                SQLConn.cmd.Parameters["@d7"].Value = Convert.ToInt32(txtTotalPaid.Text);
                if (txtDeduction.Text == "")
                {
                    SQLConn.cmd.Parameters["@d8"].Value = 0;
                }
                else
                {
                    SQLConn.cmd.Parameters["@d8"].Value = Convert.ToInt32(txtDeduction.Text);
                }

                SQLConn.cmd.Parameters["@d9"].Value = Convert.ToInt32(txtDuepayment.Text);
                cmd.ExecuteNonQuery();
                MessageBox.Show("Successfully saved", "staffPayment Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
                st1 = lblUser.Text;
                st2 = "Payment done of the the Employee'" + txtEmployeeName.Text + "' having StaffID='"+cmbstaffid.Text+"'";
                cf.LogFunc(st1, System.DateTime.Now, st2);
                btnSave.Enabled = false;
                Print.Enabled = true;

                con.Close();
               }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void Update_record_Click(object sender, EventArgs e)
        {
            try
            {
                
                con.Open();
                string cb = "update Employeepayment set StaffID=@d2,BasicSalary=@d3,PaymentDate=@d4,ModeOfPayment=@d5,PaymentModeDetails=@d6,TotalPaid=@d7,Deduction=@d8,Duepayment=@d9 where EmpPaymentID=@d1";
                cmd = new NpgsqlCommand(cb);

                cmd.Connection = con;
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d1",  "EmpPaymentID"));
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d2",  "StaffID"));
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d3", "BasicSalary"));
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d4",  "PaymentDate"));
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d5","ModeOfPayment"));
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d6",  "PaymentModeDetails"));
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d7",  "TotalPaid"));
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d8",  "Deduction"));
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d9", "Duepayment"));
                SQLConn.cmd.Parameters["@d1"].Value = PaymentID.Text.Trim();
                SQLConn.cmd.Parameters["@d2"].Value = cmbstaffid.Text.Trim();
                SQLConn.cmd.Parameters["@d3"].Value = txtBasicSalary.Text.Trim();
                SQLConn.cmd.Parameters["@d4"].Value = (PaymentDate.Text);
                SQLConn.cmd.Parameters["@d5"].Value = (txtModeOfPayment.Text);
                SQLConn.cmd.Parameters["@d6"].Value = (txtPaymentModeDetails.Text);
                SQLConn.cmd.Parameters["@d7"].Value = Convert.ToInt32(txtTotalPaid.Text);
                if (txtDeduction.Text == "")
                {
                    SQLConn.cmd.Parameters["@d8"].Value = 0;
                }
                else
                {
                    SQLConn.cmd.Parameters["@d8"].Value = Convert.ToInt32(txtDeduction.Text);
                }

                SQLConn.cmd.Parameters["@d9"].Value = Convert.ToInt32(txtDuepayment.Text);
                cmd.ExecuteNonQuery();
                MessageBox.Show("Successfully updated", "Fees Payment Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
                st1 = lblUser.Text;
                st2 = "Payment Updated of the the Employee'" + txtEmployeeName.Text + "' having StaffID='" + cmbstaffid.Text + "'";
                cf.LogFunc(st1, System.DateTime.Now, st2);
                Update_record.Enabled = false;
                con.Close();
            }

            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            frmEmployeePaymentRecord frm = new frmEmployeePaymentRecord();
           
            frm.Show();
        }
         
        private void txtTotalPaid_Validating(object sender, CancelEventArgs e)
        {
            int val1 = 0;
            int val2 = 0;
            int val3 = 0;
            int.TryParse(txtBasicSalary.Text, out val1);
            int.TryParse(txtDeduction.Text, out val2);
            int.TryParse(txtTotalPaid.Text, out val3);
            if (val3 > val1-val2)
            {
                MessageBox.Show("Total Paid can not be more than Basic Salary Fees - Deduction", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtTotalPaid.Focus();
            }
        }

        private void frmEmployeepayment_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Hide();
            frmMain frm = new frmMain();
           // frm.UserType.Text = lblUserType.Text;
            //frm.User.Text = lblUser.Text;
            frm.Show();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            Cursor = Cursors.Default;
            timer1.Enabled = false;
        }
        private void clear()
        {
            txtBasicSalary.Text = "";
            txtDepartment.Text = "";
            txtDesignation.Text = "";
            txtEmployeeName.Text = "";
            txtModeOfPayment.Text= "";
            txtDeduction.Text = "";
            txtPaymentModeDetails.Text = "";
            cmbstaffid.Text= "";
            txtTotalPaid.Text= "";
            txtDuepayment.Text = "";
            PaymentDate.Text = System.DateTime.Today.ToString();

            PaymentID.Text = "";
  
            btnSave.Enabled = true;
            Delete.Enabled = false;
            Update_record.Enabled = false;

        }
        private void Delete_Click(object sender, EventArgs e)
        {
            try
            {
                int RowsAffected = 0;

                

                con.Open();


                string cq = "delete from staffpayment where id=@DELETE1;";


                cmd = new NpgsqlCommand(cq);

                cmd.Connection = con;

                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@DELETE1",  "EmppaymentID"));


                SQLConn.cmd.Parameters["@DELETE1"].Value = PaymentID.Text;
                RowsAffected = cmd.ExecuteNonQuery();

                if (RowsAffected > 0)
                {
                    MessageBox.Show("Successfully deleted", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    st1 = lblUser.Text;
                    st2 = "Deleted the Employee's Payment having PaymentID=" +PaymentID.Text + "' and StaffID'"+cmbstaffid.Text+"'";
                    cf.LogFunc(st1, System.DateTime.Now, st2);
                    clear();
                }
                else
                {
                    MessageBox.Show("No Record found", "Sorry", MessageBoxButtons.OK, MessageBoxIcon.Information);
                   
                    clear();

                }

                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void Print_Click(object sender, EventArgs e)
        {
            try
            {
               // Cursor = Cursors.WaitCursor;
               // timer1.Enabled = true;
               //SalaryPaymentReceipt rpt = new SalaryPaymentReceipt(); //The report you created.
               // SqlConnection myConnection = default(SqlConnection);
               // SqlCommand MyCommand = new SqlCommand();
               // NpgsqlDataAdapter myDA = new NpgsqlDataAdapter();
               // ERPS_DBDataSet myDS = new ERPS_DBDataSet(); //The DataSet you created.
               // frmEmployeePaymentReceipt frm = new frmEmployeePaymentReceipt();
               // myConnection = new SqlConnection(SQLCONN.DBcon);
               // MyCommand.Connection = myConnection;
               // MyCommand.CommandText = "select * from EmployeePayment,staffwhere Employee.StaffID=EmployeePayment.StaffID and EmpPaymentID='" +PaymentID.Text + "'";
               // MyCommand.CommandType = CommandType.Text;
               // myDA.SelectCommand = MyCommand;
               // myDA.Fill(myDS, "EmployeePayment");
               // myDA.Fill(myDS, "Employee");
               // rpt.SetDataSource(myDS);
               // frm.crystalReportViewer1.ReportSource = rpt;
               // frm.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void NewRecord_Click(object sender, EventArgs e)
        {
            clear();
        }
    }
}
        
    

