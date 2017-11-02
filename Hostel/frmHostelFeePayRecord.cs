using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Npgsql;
using Excel = Microsoft.Office.Interop.Excel;
namespace SchoolGuru
{
    public partial class frmHostelFeePayRecord : Form
    {
        
        DataTable dtable = new DataTable();
        NpgsqlConnection con = null;
        NpgsqlDataAdapter adp;
        DataSet ds = new DataSet();
        NpgsqlCommand cmd = null;
        DataTable dt = new DataTable();
        
        public frmHostelFeePayRecord()
        {
            InitializeComponent();
        }


        private void AutocompleteCAdmissionno()
        {

            try
            {


                NpgsqlConnection CN = new NpgsqlConnection(SQLConn.DBcon);

                CN.Open();
                adp = new NpgsqlDataAdapter();
                adp.SelectCommand = new NpgsqlCommand("SELECT distinct RTRIM(AdmissionNo) FROM HostelFeePayment", CN);
                ds = new DataSet("ds");

                adp.Fill(ds);
                dtable = ds.Tables[0];
           

                foreach (DataRow drow in dtable.Rows)
                {
                    cmbAdmissionNo.Items.Add(drow[0].ToString());

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }
        private void AutocompleteClass()
        {

            try
            {


                NpgsqlConnection CN = new NpgsqlConnection(SQLConn.DBcon);

                CN.Open();
                adp = new NpgsqlDataAdapter();
                adp.SelectCommand = new NpgsqlCommand("SELECT distinct RTRIM(student.class) FROM HostelFeePayment,Student,Hosteler where HostelFeePayment.AdmissionNo=Student.AdmissionNo and Hosteler.AdmissionNo=Student.AdmissionNo", CN);
                ds = new DataSet("ds");

                adp.Fill(ds);
                dtable = ds.Tables[0];
                cmbclass.Items.Clear();

                foreach (DataRow drow in dtable.Rows)
                {
                    cmbclass.Items.Add(drow[0].ToString());

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }
        private void frmhostelfeepayRecord_Load(object sender, EventArgs e)
        {
            AutocompleteClass();
            AutocompleteCAdmissionno();
        }

        private void cmbclass_SelectedIndexChanged(object sender, EventArgs e)
        {

            cmbsection.Items.Clear();
            cmbsection.Text = "";
            cmbsection.Enabled = true;

            try
            {

                
                con.Open();


                string ct = "select distinct RTRIM(Section) from HostelFeePayment,Hosteler,Student where HostelFeePayment.AdmissionNo=Student.AdmissionNo and Hosteler.AdmissionNo=Student.AdmissionNo and Student.class= '" + cmbclass.Text + "'";

                cmd = new NpgsqlCommand(ct);
                cmd.Connection = con;

                SQLConn.dr = cmd.ExecuteReader();

                while (SQLConn.dr.Read())
                {
                    cmbsection.Items.Add(SQLConn.dr[0]);
                }
                con.Close();

            }

            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            try
            {
                if (cmbclass.Text == "")
                {
                    MessageBox.Show("Please select class", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    cmbclass.Focus();
                    return;
                }
                if (cmbsection.Text == "")
                {
                    MessageBox.Show("Please select Section", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    cmbsection.Focus();
                    return;
                }

                

                con.Open();
              
                cmd = new NpgsqlCommand("SELECT RTRIM(HostelFeePayment.HFeePaymentID)[Fee ID], RTRIM(HostelFeePayment.AdmissionNo) [AdmissionNo], RTRIM(Student.StudentName) [Student Name], Rtrim(Student.Class) [Class],rtrim(student.section) [Section],rtrim(Hosteler.HostelName) [Hostel Name],rtrim(hostelfeepayment.hostelfees) [Hostel Fee],RTRIM(HostelFeePayment.TotalPaid) [Total Paid],RTRIM(HostelFeePayment.ModeOfPayment) [Mode of Payment],RTRIM(HostelFeePayment.PaymentModeDetails) [Payment Mode Detail],RTRIM(HostelFeePayment.Fine) [Fine],RTRIM(HostelFeePayment.DueFees) [Due Fees],RTRIM(HostelFeePayment.Dateofpayment) [Payment Date] FROM   Student INNER JOIN Hosteler ON Student.AdmissionNo = Hosteler.AdmissionNo INNER JOIN HostelFeePayment ON Student.AdmissionNo = HostelFeePayment.AdmissionNo and DateOfPayment between @date1 and @date2 and Class= '" + cmbclass.Text+ "'and Section='" + cmbsection.Text+ "'",con);
                SQLConn.cmd.Parameters.Add("@date1", "DateOfPayment").Value = Date_from.Value.Date;
                SQLConn.cmd.Parameters.Add("@date2","DateOfPayment").Value = Date_to.Value.Date;

                NpgsqlDataAdapter myDA = new NpgsqlDataAdapter(cmd);

                DataSet myDataSet = new DataSet();

                myDA.Fill(myDataSet, "HostelFeePayment");
                myDA.Fill(myDataSet, "Hostelinfo");
                myDA.Fill(myDataSet, "Student");
                myDA.Fill(myDataSet, "Hosteler");
                dataGridView1.DataSource = myDataSet.Tables["HostelFeePayment"].DefaultView;
                dataGridView1.DataSource = myDataSet.Tables["Hostelinfo"].DefaultView;
                dataGridView1.DataSource = myDataSet.Tables["Student"].DefaultView;
                dataGridView1.DataSource = myDataSet.Tables["Hosteler"].DefaultView;
                con.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void dataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            DataGridViewRow dr = dataGridView1.SelectedRows[0];
            this.Hide();
            frmHostelFeePayment frm = new  frmHostelFeePayment();
            // or simply use column name instead of index
            //dr.Cells["id"].Value.ToString();
            frm.Show();
            frm.FeePaymentID.Text = dr.Cells[0].Value.ToString();
            frm.cmbAdmissionNo.Text = dr.Cells[1].Value.ToString();
            frm.StudentName.Text = dr.Cells[2].Value.ToString();
            frm.txtclass.Text = dr.Cells[3].Value.ToString();
            frm.txtsection.Text = dr.Cells[4].Value.ToString();
            frm.txtHostelName.Text = dr.Cells[5].Value.ToString();
            frm.txtHostelFees.Text = dr.Cells[6].Value.ToString();
            frm.PaymentDate.Text = dr.Cells[7].Value.ToString();
            frm.cmbModeOfPayment.Text = dr.Cells[8].Value.ToString();
            frm.txtPaymentModeDetails.Text = dr.Cells[9].Value.ToString();
            frm.txtfine.Text = dr.Cells[11].Value.ToString();
            frm.txtTotalPaid.Text = dr.Cells[10].Value.ToString();
            frm.txtDueFees.Text = dr.Cells[12].Value.ToString();

            frm.lblUser.Text = lblUser.Text;
            frm.lblUserType.Text = lblUserType.Text;
             frm.Delete.Enabled = true;
                frm.Update_record.Enabled = true;
              
                frm.btnSave.Enabled = false;
                frm.Print.Enabled = true;
            
           
            }

        private void frmhostelfeepayRecord_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Hide();
           frmHostelFeePayment frm = new frmHostelFeePayment();
            frm.lblUserType.Text = lblUserType.Text;
            frm.lblUser.Text = lblUser.Text;
            frm.Show();
        }

        private void button14_Click(object sender, EventArgs e)
        {
            try
            {
                

                con.Open();
                cmd = new NpgsqlCommand("SELECT RTRIM(HostelFeePayment.HFeePaymentID)[Fee ID], RTRIM(HostelFeePayment.AdmissionNo) [AdmissionNo], RTRIM(Student.StudentName) [Student Name], Rtrim(Student.Class) [Class],rtrim(student.section) [Section],rtrim(Hosteler.HostelName) [Hostel Name],rtrim(hostelfeepayment.hostelfees) [Hostel Fee],RTRIM(HostelFeePayment.TotalPaid) [Total Paid],RTRIM(HostelFeePayment.ModeOfPayment) [Mode of Payment],RTRIM(HostelFeePayment.PaymentModeDetails) [Payment Mode Detail],RTRIM(HostelFeePayment.Fine) [Fine],RTRIM(HostelFeePayment.DueFees) [Due Fees],RTRIM(HostelFeePayment.Dateofpayment) [Payment Date] FROM   Student INNER JOIN Hosteler ON Student.AdmissionNo = Hosteler.AdmissionNo INNER JOIN HostelFeePayment ON Student.AdmissionNo = HostelFeePayment.AdmissionNo and DateOfPayment between @date1 and @date2 and fine>0 order by fine", con);
                SQLConn.cmd.Parameters.Add("@date1","DateOfPayment").Value = dateTimePicker1.Value.Date;
                SQLConn.cmd.Parameters.Add("@date2",  "DateOfPayment").Value = dateTimePicker2.Value.Date;

                NpgsqlDataAdapter myDA = new NpgsqlDataAdapter(cmd);

                DataSet myDataSet = new DataSet();

                myDA.Fill(myDataSet, "HostelFeePayment");
                myDA.Fill(myDataSet, "Hostelinfo");
                myDA.Fill(myDataSet, "Student");
                myDA.Fill(myDataSet, "Hosteler");
                dataGridView5.DataSource = myDataSet.Tables["HostelFeePayment"].DefaultView;
                dataGridView5.DataSource = myDataSet.Tables["Hostelinfo"].DefaultView;
                dataGridView5.DataSource = myDataSet.Tables["Student"].DefaultView;
                dataGridView5.DataSource = myDataSet.Tables["Hosteler"].DefaultView;
                con.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void cmbAdmissionNo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                

                con.Open();
                cmd = new NpgsqlCommand("SELECT RTRIM(HostelFeePayment.HFeePaymentID)[Fee ID], RTRIM(HostelFeePayment.AdmissionNo) [AdmissionNo], RTRIM(Student.StudentName) [Student Name], Rtrim(Student.Class) [Class],rtrim(student.section) [Section],rtrim(Hosteler.HostelName) [Hostel Name],rtrim(hostelfeepayment.hostelfees) [Hostel Fee],RTRIM(HostelFeePayment.TotalPaid) [Total Paid],RTRIM(HostelFeePayment.ModeOfPayment) [Mode of Payment],RTRIM(HostelFeePayment.PaymentModeDetails) [Payment Mode Detail],RTRIM(HostelFeePayment.Fine) [Fine],RTRIM(HostelFeePayment.DueFees) [Due Fees],RTRIM(HostelFeePayment.Dateofpayment) [Payment Date] FROM   Student INNER JOIN Hosteler ON Student.AdmissionNo = Hosteler.AdmissionNo INNER JOIN HostelFeePayment ON Student.AdmissionNo = HostelFeePayment.AdmissionNo and Student.AdmissionNo = '" + cmbAdmissionNo.Text + "' order by DateOfPayment", con);

                NpgsqlDataAdapter myDA = new NpgsqlDataAdapter(cmd);

                DataSet myDataSet = new DataSet();

                myDA.Fill(myDataSet, "HostelFeePayment");
                myDA.Fill(myDataSet, "Hostelinfo");
                myDA.Fill(myDataSet, "Student");
                myDA.Fill(myDataSet, "Hosteler");
                dataGridView2.DataSource = myDataSet.Tables["HostelFeePayment"].DefaultView;
                dataGridView2.DataSource = myDataSet.Tables["Hostelinfo"].DefaultView;
                dataGridView2.DataSource = myDataSet.Tables["Student"].DefaultView;
                dataGridView2.DataSource = myDataSet.Tables["Hosteler"].DefaultView;
                con.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        private void button10_Click(object sender, EventArgs e)
        {
            try
            {
                

                con.Open();
                cmd = new NpgsqlCommand("SELECT RTRIM(HostelFeePayment.HFeePaymentID)[Fee ID], RTRIM(HostelFeePayment.AdmissionNo) [AdmissionNo], RTRIM(Student.StudentName) [Student Name], Rtrim(Student.Class) [Class],rtrim(student.section) [Section],rtrim(Hosteler.HostelName) [Hostel Name],rtrim(hostelfeepayment.hostelfees) [Hostel Fee],RTRIM(HostelFeePayment.TotalPaid) [Total Paid],RTRIM(HostelFeePayment.ModeOfPayment) [Mode of Payment],RTRIM(HostelFeePayment.PaymentModeDetails) [Payment Mode Detail],RTRIM(HostelFeePayment.Fine) [Fine],RTRIM(HostelFeePayment.DueFees) [Due Fees],RTRIM(HostelFeePayment.Dateofpayment) [Payment Date] FROM   Student INNER JOIN Hosteler ON Student.AdmissionNo = Hosteler.AdmissionNo INNER JOIN HostelFeePayment ON Student.AdmissionNo = HostelFeePayment.AdmissionNo and DateOfPayment between @date1 and @date2  order by DateOfPayment", con);
                SQLConn.cmd.Parameters.Add("@date1",  "DateOfPayment").Value = PaymentDateFrom.Value.Date;
                SQLConn.cmd.Parameters.Add("@date2",  "DateOfPayment").Value = PaymentDateTo.Value.Date;

                NpgsqlDataAdapter myDA = new NpgsqlDataAdapter(cmd);

                DataSet myDataSet = new DataSet();

                myDA.Fill(myDataSet, "HostelFeePayment");
                myDA.Fill(myDataSet, "Hostelinfo");
                myDA.Fill(myDataSet, "Student");
                myDA.Fill(myDataSet, "Hosteler");
                dataGridView3.DataSource = myDataSet.Tables["HostelFeePayment"].DefaultView;
                dataGridView3.DataSource = myDataSet.Tables["Hostelinfo"].DefaultView;
                dataGridView3.DataSource = myDataSet.Tables["Student"].DefaultView;
                dataGridView3.DataSource = myDataSet.Tables["Hosteler"].DefaultView;
                con.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button12_Click(object sender, EventArgs e)
        {
            try
            {
                

                con.Open();
                cmd = new NpgsqlCommand("SELECT RTRIM(HostelFeePayment.HFeePaymentID)[Fee ID], RTRIM(HostelFeePayment.AdmissionNo) [AdmissionNo], RTRIM(Student.StudentName) [Student Name], Rtrim(Student.Class) [Class],rtrim(student.section) [Section],rtrim(Hosteler.HostelName) [Hostel Name],rtrim(hostelfeepayment.hostelfees) [Hostel Fee],RTRIM(HostelFeePayment.TotalPaid) [Total Paid],RTRIM(HostelFeePayment.ModeOfPayment) [Mode of Payment],RTRIM(HostelFeePayment.PaymentModeDetails) [Payment Mode Detail],RTRIM(HostelFeePayment.Fine) [Fine],RTRIM(HostelFeePayment.DueFees) [Due Fees],RTRIM(HostelFeePayment.Dateofpayment) [Payment Date] FROM   Student INNER JOIN Hosteler ON Student.AdmissionNo = Hosteler.AdmissionNo INNER JOIN HostelFeePayment ON Student.AdmissionNo = HostelFeePayment.AdmissionNo and DateOfPayment between @date1 and @date2 and DueFees>0 order by DateOfPayment", con);
                SQLConn.cmd.Parameters.Add("@date1",  "DateOfPayment").Value = DateFrom.Value.Date;
                SQLConn.cmd.Parameters.Add("@date2", "DateOfPayment").Value = DateTo.Value.Date;

                NpgsqlDataAdapter myDA = new NpgsqlDataAdapter(cmd);

                DataSet myDataSet = new DataSet();

                myDA.Fill(myDataSet, "HostelFeePayment");
                myDA.Fill(myDataSet, "Hostelinfo");
                myDA.Fill(myDataSet, "Student");
                myDA.Fill(myDataSet, "Hosteler");
                dataGridView4.DataSource = myDataSet.Tables["HostelFeePayment"].DefaultView;
                dataGridView4.DataSource = myDataSet.Tables["Hostelinfo"].DefaultView;
                dataGridView4.DataSource = myDataSet.Tables["Student"].DefaultView;
                dataGridView4.DataSource = myDataSet.Tables["Hosteler"].DefaultView;
                con.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView2_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
             DataGridViewRow dr = dataGridView2.SelectedRows[0];
            this.Hide();
            frmHostelFeePayment frm = new  frmHostelFeePayment();
            // or simply use column name instead of index
            //dr.Cells["id"].Value.ToString();
            frm.Show();
            frm.FeePaymentID.Text = dr.Cells[0].Value.ToString();
            frm.cmbAdmissionNo.Text = dr.Cells[1].Value.ToString();
            frm.StudentName.Text = dr.Cells[2].Value.ToString();
            frm.txtclass.Text = dr.Cells[3].Value.ToString();
            frm.txtsection.Text = dr.Cells[4].Value.ToString();
            frm.txtHostelName.Text = dr.Cells[5].Value.ToString();
            frm.txtHostelFees.Text = dr.Cells[6].Value.ToString();
            frm.PaymentDate.Text = dr.Cells[7].Value.ToString();
            frm.cmbModeOfPayment.Text = dr.Cells[8].Value.ToString();
            frm.txtPaymentModeDetails.Text = dr.Cells[9].Value.ToString();
            frm.txtfine.Text = dr.Cells[11].Value.ToString();
            frm.txtTotalPaid.Text = dr.Cells[10].Value.ToString();
            frm.txtDueFees.Text = dr.Cells[12].Value.ToString();
            frm.lblUser.Text = lblUser.Text;
            frm.lblUserType.Text = lblUserType.Text;
            
             frm.Delete.Enabled = true;
                frm.Update_record.Enabled = true;
              
                frm.btnSave.Enabled = false;
                frm.Print.Enabled = true;
            
           
            }

        private void dataGridView3_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
         DataGridViewRow dr = dataGridView3.SelectedRows[0];
            this.Hide();
            frmHostelFeePayment frm = new frmHostelFeePayment();
            // or simply use column name instead of index
            //dr.Cells["id"].Value.ToString();
            frm.Show();
            frm.FeePaymentID.Text = dr.Cells[0].Value.ToString();
            frm.cmbAdmissionNo.Text = dr.Cells[1].Value.ToString();
            frm.StudentName.Text = dr.Cells[2].Value.ToString();
            frm.txtclass.Text = dr.Cells[3].Value.ToString();
            frm.txtsection.Text = dr.Cells[4].Value.ToString();
            frm.txtHostelName.Text = dr.Cells[5].Value.ToString();
            frm.txtHostelFees.Text = dr.Cells[6].Value.ToString();
            frm.PaymentDate.Text = dr.Cells[7].Value.ToString();
            frm.cmbModeOfPayment.Text = dr.Cells[8].Value.ToString();
            frm.txtPaymentModeDetails.Text = dr.Cells[9].Value.ToString();
            frm.txtfine.Text = dr.Cells[11].Value.ToString();
            frm.txtTotalPaid.Text = dr.Cells[10].Value.ToString();
            frm.txtDueFees.Text = dr.Cells[12].Value.ToString();
            frm.lblUser.Text = lblUser.Text;
            frm.lblUserType.Text = lblUserType.Text;
            
             frm.Delete.Enabled = true;
                frm.Update_record.Enabled = true;
              
                frm.btnSave.Enabled = false;
                frm.Print.Enabled = true;
            
           
            }

        private void dataGridView4_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
             DataGridViewRow dr = dataGridView4.SelectedRows[0];
            this.Hide();
            frmHostelFeePayment frm = new  frmHostelFeePayment();
            // or simply use column name instead of index
            //dr.Cells["id"].Value.ToString();
            frm.Show();
            frm.FeePaymentID.Text = dr.Cells[0].Value.ToString();
            frm.cmbAdmissionNo.Text = dr.Cells[1].Value.ToString();
            frm.StudentName.Text = dr.Cells[2].Value.ToString();
            frm.txtclass.Text = dr.Cells[3].Value.ToString();
            frm.txtsection.Text = dr.Cells[4].Value.ToString();
            frm.txtHostelName.Text = dr.Cells[5].Value.ToString();
            frm.txtHostelFees.Text = dr.Cells[6].Value.ToString();
            frm.PaymentDate.Text = dr.Cells[7].Value.ToString();
            frm.cmbModeOfPayment.Text = dr.Cells[8].Value.ToString();
            frm.txtPaymentModeDetails.Text = dr.Cells[9].Value.ToString();
            frm.txtfine.Text = dr.Cells[11].Value.ToString();
            frm.txtTotalPaid.Text = dr.Cells[10].Value.ToString();
            frm.txtDueFees.Text = dr.Cells[12].Value.ToString();

            frm.lblUser.Text = lblUser.Text;
            frm.lblUserType.Text = lblUserType.Text;
             frm.Delete.Enabled = true;
                frm.Update_record.Enabled = true;
              
                frm.btnSave.Enabled = false;
                frm.Print.Enabled = true;
            
           
            }

        private void dataGridView5_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
             DataGridViewRow dr = dataGridView5.SelectedRows[0];
            this.Hide();
            frmHostelFeePayment frm = new  frmHostelFeePayment();
            // or simply use column name instead of index
            //dr.Cells["id"].Value.ToString();
            frm.Show();
            frm.FeePaymentID.Text = dr.Cells[0].Value.ToString();
            frm.cmbAdmissionNo.Text = dr.Cells[1].Value.ToString();
            frm.StudentName.Text = dr.Cells[2].Value.ToString();
            frm.txtclass.Text = dr.Cells[3].Value.ToString();
            frm.txtsection.Text = dr.Cells[4].Value.ToString();
            frm.txtHostelName.Text = dr.Cells[5].Value.ToString();
            frm.txtHostelFees.Text = dr.Cells[6].Value.ToString();
            frm.PaymentDate.Text = dr.Cells[7].Value.ToString();
            frm.cmbModeOfPayment.Text = dr.Cells[8].Value.ToString();
            frm.txtPaymentModeDetails.Text = dr.Cells[9].Value.ToString();
            frm.txtfine.Text = dr.Cells[11].Value.ToString();
            frm.txtTotalPaid.Text = dr.Cells[10].Value.ToString();
            frm.txtDueFees.Text = dr.Cells[12].Value.ToString();
            frm.lblUser.Text = lblUser.Text;
            frm.lblUserType.Text = lblUserType.Text;
            
             frm.Delete.Enabled = true;
                frm.Update_record.Enabled = true;
              
                frm.btnSave.Enabled = false;
                frm.Print.Enabled = true;
            
           
            }

        private void dataGridView5_RowMinimumHeightChanged(object sender, DataGridViewRowEventArgs e)
        {

        }

        private void dataGridView5_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            {
                string strRowNumber = (e.RowIndex + 1).ToString();
                SizeF size = e.Graphics.MeasureString(strRowNumber, this.Font);
                if (dataGridView5.RowHeadersWidth < Convert.ToInt32((size.Width + 20)))
                {
                    dataGridView5.RowHeadersWidth = Convert.ToInt32((size.Width + 20));
                }
                Brush b = SystemBrushes.ControlText;
                e.Graphics.DrawString(strRowNumber, this.Font, b, e.RowBounds.Location.X + 15, e.RowBounds.Location.Y + ((e.RowBounds.Height - size.Height) / 2));
            }
        }

        private void dataGridView4_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            {
                string strRowNumber = (e.RowIndex + 1).ToString();
                SizeF size = e.Graphics.MeasureString(strRowNumber, this.Font);
                if (dataGridView4.RowHeadersWidth < Convert.ToInt32((size.Width + 20)))
                {
                    dataGridView4.RowHeadersWidth = Convert.ToInt32((size.Width + 20));
                }
                Brush b = SystemBrushes.ControlText;
                e.Graphics.DrawString(strRowNumber, this.Font, b, e.RowBounds.Location.X + 15, e.RowBounds.Location.Y + ((e.RowBounds.Height - size.Height) / 2));
            }
        }

        private void dataGridView3_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            {
                string strRowNumber = (e.RowIndex + 1).ToString();
                SizeF size = e.Graphics.MeasureString(strRowNumber, this.Font);
                if (dataGridView3.RowHeadersWidth < Convert.ToInt32((size.Width + 20)))
                {
                    dataGridView3.RowHeadersWidth = Convert.ToInt32((size.Width + 20));
                }
                Brush b = SystemBrushes.ControlText;
                e.Graphics.DrawString(strRowNumber, this.Font, b, e.RowBounds.Location.X + 15, e.RowBounds.Location.Y + ((e.RowBounds.Height - size.Height) / 2));
            }
        }

        private void dataGridView2_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            {
                string strRowNumber = (e.RowIndex + 1).ToString();
                SizeF size = e.Graphics.MeasureString(strRowNumber, this.Font);
                if (dataGridView2.RowHeadersWidth < Convert.ToInt32((size.Width + 20)))
                {
                    dataGridView2.RowHeadersWidth = Convert.ToInt32((size.Width + 20));
                }
                Brush b = SystemBrushes.ControlText;
                e.Graphics.DrawString(strRowNumber, this.Font, b, e.RowBounds.Location.X + 15, e.RowBounds.Location.Y + ((e.RowBounds.Height - size.Height) / 2));
            }
        }

        private void dataGridView1_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            {
                string strRowNumber = (e.RowIndex + 1).ToString();
                SizeF size = e.Graphics.MeasureString(strRowNumber, this.Font);
                if (dataGridView1.RowHeadersWidth < Convert.ToInt32((size.Width + 20)))
                {
                    dataGridView1.RowHeadersWidth = Convert.ToInt32((size.Width + 20));
                }
                Brush b = SystemBrushes.ControlText;
                e.Graphics.DrawString(strRowNumber, this.Font, b, e.RowBounds.Location.X + 15, e.RowBounds.Location.Y + ((e.RowBounds.Height - size.Height) / 2));
            }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Date_from.Text = System.DateTime.Today.ToString();
            Date_to.Text = System.DateTime.Today.ToString();
            dataGridView1.DataSource = null;
            cmbclass.Text = "";
            cmbsection.Text = "";
        }

        private void button9_Click(object sender, EventArgs e)
        {
            cmbAdmissionNo.Text = "";
            dataGridView2.DataSource = null;
        }

        private void button11_Click(object sender, EventArgs e)
        {
            PaymentDateFrom.Text = System.DateTime.Today.ToString();
            PaymentDateTo.Text = System.DateTime.Today.ToString();
            dataGridView3.DataSource = null;
        }

        private void button13_Click(object sender, EventArgs e)
        {
            DateFrom.Text = System.DateTime.Today.ToString();
            DateTo.Text = System.DateTime.Today.ToString();
            dataGridView4.DataSource = null;
        }

        private void button15_Click(object sender, EventArgs e)
        {
            dateTimePicker1.Text = System.DateTime.Today.ToString();
            dateTimePicker2.Text = System.DateTime.Today.ToString();
            dataGridView5.DataSource = null;
        }

        private void ExportExcel_Click(object sender, EventArgs e)
        {
            if (dataGridView1.DataSource == null)
            {
                MessageBox.Show("Sorry nothing to export into excel sheet..", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            int rowsTotal = 0;
            int colsTotal = 0;
            int I = 0;
            int j = 0;
            int iC = 0;
            System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.WaitCursor;
            Excel.Application xlApp = new Excel.Application();

            try
            {
                Excel.Workbook excelBook = xlApp.Workbooks.Add();
                Excel.Worksheet excelWorksheet = (Excel.Worksheet)excelBook.Worksheets[1];
                xlApp.Visible = true;

                rowsTotal = dataGridView1.RowCount - 1;
                colsTotal = dataGridView1.Columns.Count - 1;
                var _with1 = excelWorksheet;
                _with1.Cells.Select();
                _with1.Cells.Delete();
                for (iC = 0; iC <= colsTotal; iC++)
                {
                    _with1.Cells[1, iC + 1].Value = dataGridView1.Columns[iC].HeaderText;
                }
                for (I = 0; I <= rowsTotal - 1; I++)
                {
                    for (j = 0; j <= colsTotal; j++)
                    {
                        _with1.Cells[I + 2, j + 1].value = dataGridView1.Rows[I].Cells[j].Value;
                    }
                }
                _with1.Rows["1:1"].Font.FontStyle = "Bold";
                _with1.Rows["1:1"].Font.Size = 12;

                _with1.Cells.Columns.AutoFit();
                _with1.Cells.Select();
                _with1.Cells.EntireColumn.AutoFit();
                _with1.Cells[1, 1].Select();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                //RELEASE ALLOACTED RESOURCES
                System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default;
                xlApp = null;
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            if (dataGridView2.DataSource == null)
            {
                MessageBox.Show("Sorry nothing to export into excel sheet..", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            int rowsTotal = 0;
            int colsTotal = 0;
            int I = 0;
            int j = 0;
            int iC = 0;
            System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.WaitCursor;
            Excel.Application xlApp = new Excel.Application();

            try
            {
                Excel.Workbook excelBook = xlApp.Workbooks.Add();
                Excel.Worksheet excelWorksheet = (Excel.Worksheet)excelBook.Worksheets[1];
                xlApp.Visible = true;

                rowsTotal = dataGridView2.RowCount - 1;
                colsTotal = dataGridView2.Columns.Count - 1;
                var _with1 = excelWorksheet;
                _with1.Cells.Select();
                _with1.Cells.Delete();
                for (iC = 0; iC <= colsTotal; iC++)
                {
                    _with1.Cells[1, iC + 1].Value = dataGridView2.Columns[iC].HeaderText;
                }
                for (I = 0; I <= rowsTotal - 1; I++)
                {
                    for (j = 0; j <= colsTotal; j++)
                    {
                        _with1.Cells[I + 2, j + 1].value = dataGridView2.Rows[I].Cells[j].Value;
                    }
                }
                _with1.Rows["1:1"].Font.FontStyle = "Bold";
                _with1.Rows["1:1"].Font.Size = 12;

                _with1.Cells.Columns.AutoFit();
                _with1.Cells.Select();
                _with1.Cells.EntireColumn.AutoFit();
                _with1.Cells[1, 1].Select();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                //RELEASE ALLOACTED RESOURCES
                System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default;
                xlApp = null;
            }
        }

        private void button8_Click(object sender, EventArgs e)
        {
            if (dataGridView3.DataSource == null)
            {
                MessageBox.Show("Sorry nothing to export into excel sheet..", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            int rowsTotal = 0;
            int colsTotal = 0;
            int I = 0;
            int j = 0;
            int iC = 0;
            System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.WaitCursor;
            Excel.Application xlApp = new Excel.Application();

            try
            {
                Excel.Workbook excelBook = xlApp.Workbooks.Add();
                Excel.Worksheet excelWorksheet = (Excel.Worksheet)excelBook.Worksheets[1];
                xlApp.Visible = true;

                rowsTotal = dataGridView3.RowCount - 1;
                colsTotal = dataGridView3.Columns.Count - 1;
                var _with1 = excelWorksheet;
                _with1.Cells.Select();
                _with1.Cells.Delete();
                for (iC = 0; iC <= colsTotal; iC++)
                {
                    _with1.Cells[1, iC + 1].Value = dataGridView3.Columns[iC].HeaderText;
                }
                for (I = 0; I <= rowsTotal - 1; I++)
                {
                    for (j = 0; j <= colsTotal; j++)
                    {
                        _with1.Cells[I + 2, j + 1].value = dataGridView3.Rows[I].Cells[j].Value;
                    }
                }
                _with1.Rows["1:1"].Font.FontStyle = "Bold";
                _with1.Rows["1:1"].Font.Size = 12;

                _with1.Cells.Columns.AutoFit();
                _with1.Cells.Select();
                _with1.Cells.EntireColumn.AutoFit();
                _with1.Cells[1, 1].Select();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                //RELEASE ALLOACTED RESOURCES
                System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default;
                xlApp = null;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (dataGridView4.DataSource == null)
            {
                MessageBox.Show("Sorry nothing to export into excel sheet..", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            int rowsTotal = 0;
            int colsTotal = 0;
            int I = 0;
            int j = 0;
            int iC = 0;
            System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.WaitCursor;
            Excel.Application xlApp = new Excel.Application();

            try
            {
                Excel.Workbook excelBook = xlApp.Workbooks.Add();
                Excel.Worksheet excelWorksheet = (Excel.Worksheet)excelBook.Worksheets[1];
                xlApp.Visible = true;

                rowsTotal = dataGridView4.RowCount - 1;
                colsTotal = dataGridView4.Columns.Count - 1;
                var _with1 = excelWorksheet;
                _with1.Cells.Select();
                _with1.Cells.Delete();
                for (iC = 0; iC <= colsTotal; iC++)
                {
                    _with1.Cells[1, iC + 1].Value = dataGridView4.Columns[iC].HeaderText;
                }
                for (I = 0; I <= rowsTotal - 1; I++)
                {
                    for (j = 0; j <= colsTotal; j++)
                    {
                        _with1.Cells[I + 2, j + 1].value = dataGridView4.Rows[I].Cells[j].Value;
                    }
                }
                _with1.Rows["1:1"].Font.FontStyle = "Bold";
                _with1.Rows["1:1"].Font.Size = 12;

                _with1.Cells.Columns.AutoFit();
                _with1.Cells.Select();
                _with1.Cells.EntireColumn.AutoFit();
                _with1.Cells[1, 1].Select();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                //RELEASE ALLOACTED RESOURCES
                System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default;
                xlApp = null;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (dataGridView5.DataSource == null)
            {
                MessageBox.Show("Sorry nothing to export into excel sheet..", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            int rowsTotal = 0;
            int colsTotal = 0;
            int I = 0;
            int j = 0;
            int iC = 0;
            System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.WaitCursor;
            Excel.Application xlApp = new Excel.Application();

            try
            {
                Excel.Workbook excelBook = xlApp.Workbooks.Add();
                Excel.Worksheet excelWorksheet = (Excel.Worksheet)excelBook.Worksheets[1];
                xlApp.Visible = true;

                rowsTotal = dataGridView5.RowCount - 1;
                colsTotal = dataGridView5.Columns.Count - 1;
                var _with1 = excelWorksheet;
                _with1.Cells.Select();
                _with1.Cells.Delete();
                for (iC = 0; iC <= colsTotal; iC++)
                {
                    _with1.Cells[1, iC + 1].Value = dataGridView5.Columns[iC].HeaderText;
                }
                for (I = 0; I <= rowsTotal - 1; I++)
                {
                    for (j = 0; j <= colsTotal; j++)
                    {
                        _with1.Cells[I + 2, j + 1].value = dataGridView5.Rows[I].Cells[j].Value;
                    }
                }
                _with1.Rows["1:1"].Font.FontStyle = "Bold";
                _with1.Rows["1:1"].Font.Size = 12;

                _with1.Cells.Columns.AutoFit();
                _with1.Cells.Select();
                _with1.Cells.EntireColumn.AutoFit();
                _with1.Cells[1, 1].Select();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                //RELEASE ALLOACTED RESOURCES
                System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default;
                xlApp = null;
            }
        }

        }

        }

      

