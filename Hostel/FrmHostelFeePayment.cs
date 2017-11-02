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
using System.Threading.Tasks;


namespace SchoolGuru
{
    public partial class frmHostelFeePayment : Form
    {
       
        DataSet ds = new DataSet();
        NpgsqlCommand cmd = null;
        
        DataTable dt = new DataTable();
        
        clsFunc cf = new clsFunc();
        string st1;
        string st2;
        public frmHostelFeePayment()
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
            FeePaymentID.Text = "HF-" + GetUniqueKey(8);
        }
        private void Reset()
        {
            FeePaymentID.Text = "";
            cmbAdmissionNo.Text = "";
            StudentName.Text = "";
            txtclass.Text = "";
           txtsection.Text = "";

            txtHostelFees.Text = "";
            txtHostelName.Text = "";
            cmbModeOfPayment.Text = "";
            PaymentDate.Text = DateTime.Today.ToString();
            txtPaymentModeDetails.Text = "";
            txtfine.Text = "";
            txtTotalPaid.Text = "";
            txtDueFees.Text = "";
            btnSave.Enabled = true;
            Delete.Enabled = false;
            Update_record.Enabled = false;
            Print.Enabled = false;
            cmbAdmissionNo.Focus();
        }
        private void AutocompleAdmissionNo()
        {
            //try
            //{

            //    
            //    con.Open();


            //    string ct = "select distinct RTRIM(AdmissionNo) from Hosteler ";

            //    cmd = new NpgsqlCommand(ct);
            //    cmd.Connection = con;

            //    SQLCONN.rdr = cmd.ExecuteReader();

            //    while (SQLCONN.rdr.Read())
            //    {
            //        cmbAdmissionNo.Items.Add(SQLCONN.rdr[0]);
            //    }
            //    con.Close();

            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }

        private void frmHostelFeePayment_Load(object sender, EventArgs e)
        {
             
                 AutocompleAdmissionNo();
                
        }

        private void cmbAdmissionNo_SelectedIndexChanged(object sender, EventArgs e)
        {
            //try
            //{
            //    

            //    con.Open();
            //    cmd = con.CreateCommand();

            //    cmd.CommandText = "SELECT StudentName,Class,Section,Hosteler.Hostelname,HostelFees FROM student,Hosteler,Hostelinfo WHERE Student.AdmissionNo=Hosteler.AdmissionNo and Hosteler.Hostelname=Hostelinfo.HostelName and Student.AdmissionNo = '" + cmbAdmissionNo.Text + "'";
            //    SQLCONN.rdr = cmd.ExecuteReader();

            //    if (SQLCONN.rdr.Read())
            //    {


            //        StudentName.Text = SQLCONN.rdr.GetString(0).Trim();


            //        txtclass.Text = SQLCONN.rdr.GetString(1).Trim();

            //        txtsection.Text = SQLCONN.rdr.GetString(2).Trim();
            //        txtHostelName.Text = SQLCONN.rdr.GetString(3).Trim();
            //        txtHostelFees.Text = SQLCONN.rdr.GetInt32(4).ToString();
            //    }


            //    if ((SQLCONN.rdr != null))
            //    {
            //        SQLCONN.rdr.Close();
            //    }
            //    if (con.State == ConnectionState.Open)
            //    {
            //        con.Close();
            //    }
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}

        }

        private void txtTotalPaid_TextChanged(object sender, EventArgs e)
        {
            int val1 = 0;
            int val2 = 0;
            int val3 = 0;
            int.TryParse(txtHostelFees.Text, out val1);
            int.TryParse(txtfine.Text, out val2);
            int.TryParse(txtTotalPaid.Text, out val3);

            int I = ((val1 + val2) - val3);

            txtDueFees.Text = I.ToString();
        }

        private void txtTotalPaid_Validating(object sender, CancelEventArgs e)
        {
            int val1 = 0;
            int val2 = 0;
            int val3 = 0;
            int.TryParse(txtHostelFees.Text, out val1);
            int.TryParse(txtfine.Text, out val2);
            int.TryParse(txtTotalPaid.Text, out val3);
            if (val3 > val1 + val2)
            {
                MessageBox.Show("Total Paid can not be more than Hostel Fees + Fine", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtTotalPaid.Focus();
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    
            //    con.Open();
            //    string ct = "select AdmissionNo from HostelFeePayment where AdmissionNo= '" + cmbAdmissionNo.Text + "'";

            //    cmd = new NpgsqlCommand(ct);
            //    cmd.Connection = con;

            //    SQLCONN.rdr = cmd.ExecuteReader();

            //    if (SQLCONN.rdr.Read())
            //    {
            //        MessageBox.Show("Record Already Exists", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

            //        Reset();

            //        if ((SQLCONN.rdr != null))
            //        {
            //            SQLCONN.rdr.Close();
            //        }
            //        return;
            //    }
            //    if (cmbAdmissionNo.Text == "")
            //    {
            //        MessageBox.Show("Please select Scholar No.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //        cmbAdmissionNo.Focus();
            //        return;
            //    }


            //    if (cmbModeOfPayment.Text == "")
            //    {
            //        MessageBox.Show("Please select mode of payment", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //        cmbModeOfPayment.Focus();
            //        return;
            //    }
            //    if (txtTotalPaid.Text == "")
            //    {
            //        MessageBox.Show("Please enter total paid", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //        txtTotalPaid.Focus();
            //        return;
            //    }


            //    auto();

            //    
            //    con.Open();

            //    string cb = "insert into Hostelfeepayment(HFeePaymentID,AdmissionNo,HostelFees,DateOfPayment,ModeOfPayment,PaymentModeDetails,TotalPaid,Fine,DueFees) VALUES (@d1,@d2,@d3,@d4,@d5,@d6,@d7,@d8,@d9)";

            //    cmd = new NpgsqlCommand(cb);

            //    cmd.Connection = con;
            //    SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d1", System.Data.SqlDbType.NChar, 15, "HFeePaymentID"));

            //    SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d2", System.Data.SqlDbType.NChar, 15, "AdmissionNo"));

            //    SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d3", System.Data.SqlDbType.Int, 10, "HostelFees"));

            //    SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d4", System.Data.SqlDbType.NChar, 30, "DateOfPayment"));

            //    SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d5", System.Data.SqlDbType.NChar, 20, "ModeOfPayment"));
            //    SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d6", System.Data.SqlDbType.VarChar, 200, "PaymentModeDetails"));
            //    SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d7", System.Data.SqlDbType.Int, 10, "TotalPaid"));

            //    SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d8", System.Data.SqlDbType.Int, 10, "Fine"));
            //    SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d9", System.Data.SqlDbType.Int, 10, "DueFees"));
            //    SQLConn.cmd.Parameters["@d1"].Value = FeePaymentID.Text.Trim();
            //    SQLConn.cmd.Parameters["@d2"].Value = cmbAdmissionNo.Text.Trim();
            //    SQLConn.cmd.Parameters["@d3"].Value = Convert.ToInt32(txtHostelFees.Text);
            //    SQLConn.cmd.Parameters["@d4"].Value = (PaymentDate.Text);
            //    SQLConn.cmd.Parameters["@d5"].Value = (cmbModeOfPayment.Text);
            //    SQLConn.cmd.Parameters["@d6"].Value = (txtPaymentModeDetails.Text);
            //    SQLConn.cmd.Parameters["@d7"].Value = Convert.ToInt32(txtTotalPaid.Text);
            //    if (txtfine.Text == "")
            //    {
            //        SQLConn.cmd.Parameters["@d8"].Value = 0;
            //    }
            //    else
            //    {
            //        SQLConn.cmd.Parameters["@d8"].Value = Convert.ToInt32(txtfine.Text);
            //    }

            //    SQLConn.cmd.Parameters["@d9"].Value = Convert.ToInt32(txtDueFees.Text);
            //    cmd.ExecuteNonQuery();
            //    MessageBox.Show("Successfully saved", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
            //    st1 = lblUser.Text;
            //    st2 = "Hostel Payment Done of the Student '" + StudentName.Text + "'";
            //    cf.LogFunc(st1, System.DateTime.Now, st2);
            //    btnSave.Enabled = false;
            //    Print.Enabled = true;

            //    con.Close();


            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}

        }

        private void Update_record_Click(object sender, EventArgs e)
        {
            //try
            //{
            //
            //con.Open();

            //string cb = "update Hostelfeepayment set AdmissionNo=@d2,HostelFees=@d3,DateOfPayment=@d4,ModeOfPayment=@d5,PaymentModeDetails=@d6,TotalPaid=@d7,Fine=@d8,DueFees=@d9 where HFeePaymentID=@d1";

            //cmd = new NpgsqlCommand(cb);

            //cmd.Connection = con;
            //SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d1", System.Data.SqlDbType.NChar, 20, "HFeePaymentID"));

            //SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d2", System.Data.SqlDbType.NChar, 15, "AdmissionNo"));

            //SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d3", System.Data.SqlDbType.Int, 10, "HostelFees"));

            //SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d4", System.Data.SqlDbType.NChar, 30, "DateOfPayment"));

            //SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d5", System.Data.SqlDbType.NChar, 20, "ModeOfPayment"));
            //SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d6", System.Data.SqlDbType.VarChar, 200, "PaymentModeDetails"));
            //SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d7", System.Data.SqlDbType.Int, 10, "TotalPaid"));

            //SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d8", System.Data.SqlDbType.Int, 10, "Fine"));
            //SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d9", System.Data.SqlDbType.Int, 10, "DueFees"));
            //SQLConn.cmd.Parameters["@d1"].Value = FeePaymentID.Text.Trim();
            //SQLConn.cmd.Parameters["@d2"].Value = cmbAdmissionNo.Text.Trim();
            //SQLConn.cmd.Parameters["@d3"].Value = Convert.ToInt32(txtHostelFees.Text);
            //SQLConn.cmd.Parameters["@d4"].Value = (PaymentDate.Text);
            //SQLConn.cmd.Parameters["@d5"].Value = (cmbModeOfPayment.Text);
            //SQLConn.cmd.Parameters["@d6"].Value = (txtPaymentModeDetails.Text);
            //SQLConn.cmd.Parameters["@d7"].Value = Convert.ToInt32(txtTotalPaid.Text);
            //if (txtfine.Text == "")
            //{
            //    SQLConn.cmd.Parameters["@d8"].Value = 0;
            //}
            //else
            //{
            //    SQLConn.cmd.Parameters["@d8"].Value = Convert.ToInt32(txtfine.Text);
            //}
           
            //SQLConn.cmd.Parameters["@d9"].Value = Convert.ToInt32(txtDueFees.Text);
            //cmd.ExecuteNonQuery();
            //MessageBox.Show("Successfully updated", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
            //st1 = lblUser.Text;
            //st2 = "Hostel Payment Updated of the Student '" + StudentName.Text + "'";
            //cf.LogFunc(st1, System.DateTime.Now, st2);
            //Update_record.Enabled = false;
            //con.Close();
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }

        private void Delete_Click(object sender, EventArgs e)
        {
             
            //try
            //{


            //    int RowsAffected = 0;

            //    

            //    con.Open();


            //    string cq = "delete from HostelFeePayment where HFeePaymentID=@DELETE1;";


            //    cmd = new NpgsqlCommand(cq);

            //    cmd.Connection = con;

            //    SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@DELETE1", System.Data.SqlDbType.NChar, 20, "HFeepaymentID"));


            //    SQLConn.cmd.Parameters["@DELETE1"].Value = FeePaymentID.Text;
            //    RowsAffected = cmd.ExecuteNonQuery();

            //    if (RowsAffected > 0)
            //    {
            //        MessageBox.Show("Successfully deleted", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
            //        st1 = lblUser.Text;
            //        st2 = "Hostel Payment Deleted of the Student '" + StudentName.Text + "'";
            //        cf.LogFunc(st1, System.DateTime.Now, st2);
            //        Delete.Enabled = false;

            //        Reset();
            //    }
            //    else
            //    {
            //        MessageBox.Show("No Record found", "Sorry", MessageBoxButtons.OK, MessageBoxIcon.Information);


            //        Reset();
            //    }
            //        if (con.State == ConnectionState.Open)
            //        {
            //            con.Close();
            //        }

            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            frmHostelFeePayRecord frm = new frmHostelFeePayRecord();
            frm.lblUser.Text = lblUser.Text;
            frm.lblUserType.Text = lblUserType.Text;
            frm.Show();
        }

        private void NewRecord_Click(object sender, EventArgs e)
        {
            Reset();
        }

        private void txtfine_TextChanged(object sender, EventArgs e)
        {
            int val1 = 0;
            int val2 = 0;
            int val3 = 0;
            int.TryParse(txtHostelFees.Text, out val1);
            int.TryParse(txtfine.Text, out val2);
            int.TryParse(txtTotalPaid.Text, out val3);

            int I = ((val1 + val2) - val3);

            txtDueFees.Text = I.ToString();
        }

        private void frmHostelFeePayment_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Hide();
            frmMain frm = new frmMain();
            //frm.UserType.Text = lblUserType.Text;
            //frm.User.Text = lblUser.Text;
            frm.Show();
        }

        private void txtDueFees_TextChanged(object sender, EventArgs e)
        {

        }

        private void Print_Click(object sender, EventArgs e)
        {
            try
            {
                Cursor = Cursors.WaitCursor;
                timer1.Enabled = true;
                frmHostelFeeReceipt frm = new frmHostelFeeReceipt();

                rptHostelerFeePayment rpt = new rptHostelerFeePayment();
                //The report you created.
                NpgsqlConnection myConnection = default(NpgsqlConnection);
                NpgsqlCommand MyCommand = new NpgsqlCommand();
                NpgsqlDataAdapter myDA = new NpgsqlDataAdapter();
              //  ERPS_DBDataSet myDS = new ERPS_DBDataSet();
                //The DataSet you created.


                //myConnection = new NpgsqlConnection(SQLCONN.DBcon);
                //MyCommand.Connection = myConnection;
                //MyCommand.CommandText = "select *  from HostelFeePayment,Student,Hostelinfo,Hosteler where Student.AdmissionNo=Hosteler.AdmissionNo and HostelFeePayment.AdmissionNo=Student.AdmissionNo and Hostelinfo.HostelName=Hosteler.Hostelname and HFeePaymentID= '" + FeePaymentID.Text + "'";

                //MyCommand.CommandType = CommandType.Text;
                //myDA.SelectCommand = MyCommand;
                //myDA.Fill(myDS, "HostelFeePayment");
                //myDA.Fill(myDS, "Hostelinfo");
                //myDA.Fill(myDS, "Hosteler");
                //myDA.Fill(myDS, "Student");
                //rpt.SetDataSource(myDS);
                //frm.crystalReportViewer1.ReportSource = rpt;
                //frm.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {

            Cursor = Cursors.Default;
            timer1.Enabled = false;
        }
        }
        }
    

