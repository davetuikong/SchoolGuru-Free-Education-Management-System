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
    public partial class frmEmployeePaymentRecord : Form
    {
     
        DataTable dtable = new DataTable();
        NpgsqlConnection con = null;
        NpgsqlDataAdapter adp;
        DataSet ds = new DataSet();
        NpgsqlCommand cmd = null;
        DataTable dt = new DataTable();
        
        public frmEmployeePaymentRecord()
        {
            InitializeComponent();
        }
        private void Autocomplete()
        {

            try
            {
               NpgsqlConnection CN = new NpgsqlConnection(SQLConn.DBcon);
              CN.Open();
                adp = new NpgsqlDataAdapter();
                adp.SelectCommand = new NpgsqlCommand("SELECT distinct RTRIM(Employeepayment.StaffID) FROM EmployeePayment,staffwhere EmployeePayment.StaffID=Employee.StaffID", CN);
                ds = new DataSet("ds");

                adp.Fill(ds);
                dtable = ds.Tables[0];
                cmbstaffid.Items.Clear();

                foreach (DataRow drow in dtable.Rows)
                {
                    cmbstaffid.Items.Add(drow[0].ToString());

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }
        private void AutocompleteEmployee()
        {

            try
            {


                NpgsqlConnection CN = new NpgsqlConnection(SQLConn.DBcon);

                CN.Open();
                adp = new NpgsqlDataAdapter();
                adp.SelectCommand = new NpgsqlCommand("SELECT distinct RTRIM(StaffName) FROM EmployeePayment,staffwhere EmployeePayment.StaffID=Employee.StaffID", CN);
                ds = new DataSet("ds");

                adp.Fill(ds);
                dtable = ds.Tables[0];
                txtEmployeeName.Items.Clear();

                foreach (DataRow drow in dtable.Rows)
                {
                    txtEmployeeName.Items.Add(drow[0].ToString());

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }
        private void frmEmployeePaymentRecord_Load(object sender, EventArgs e)
        {
            AutocompleteEmployee();
            Autocomplete();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtEmployeeName.Text == "")
                {
                    MessageBox.Show("Please select EmployeeName", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtEmployeeName.Focus();
                    return;
                }
               

                

                con.Open();
                cmd = new NpgsqlCommand("SELECT RTrim(Employee.StaffName) [Staff Name],RTrim (Employee.Designation)[Designation],RTrim(Employee.Department) [Department], RTrim(EmployeePayment.StaffID)[Staff ID], RTrim (EmployeePayment.EmpPaymentID) [Payment ID],RTrim(EmployeePayment.BasicSalary) [Basic Salary], RTrim(EmployeePayment.TotalPaid) [Total Paid], RTrim(EmployeePayment.Deduction) [Deduction],RTrim(EmployeePayment.DuePayment) [Due Payment], RTrim(EmployeePayment.PaymentDate) [Payment Date],RTrim(EmployeePayment.ModeOfpayment) [Payment Mode],RTrim(EmployeePayment.PaymentModeDetails) [Payment Mode Details] FROM  staffINNER JOIN EmployeePayment ON Employee.StaffID = EmployeePayment.StaffID and PaymentDate between @date1 and @date2 and Employee.StaffName= '" + txtEmployeeName.Text + "' order by PaymentDate", con);
                SQLConn.cmd.Parameters.Add("@date1",  "PaymentDate").Value = Date_from.Value.Date;
                SQLConn.cmd.Parameters.Add("@date2", "PaymentDate").Value = Date_to.Value.Date;

                NpgsqlDataAdapter myDA = new NpgsqlDataAdapter(cmd);

                DataSet myDataSet = new DataSet();

                myDA.Fill(myDataSet, "EmployeePayment");
                myDA.Fill(myDataSet, "Employee");
               
         
                dataGridView1.DataSource = myDataSet.Tables["EmployeePayment"].DefaultView;
                dataGridView1.DataSource = myDataSet.Tables["Employee"].DefaultView;
                con.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
             try
            {
                if (cmbstaffid.Text == "")
                {
                    MessageBox.Show("Please select StaffID", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtEmployeeName.Focus();
                    return;
                }
               

                

                con.Open();
                cmd = new NpgsqlCommand("SELECT RTrim(Employee.StaffName) [Staff Name],RTrim (Employee.Designation)[Designation],RTrim(Employee.Department) [Department], RTrim(EmployeePayment.StaffID)[Staff ID], RTrim (EmployeePayment.EmpPaymentID) [Payment ID],RTrim(EmployeePayment.BasicSalary) [Basic Salary], RTrim(EmployeePayment.TotalPaid) [Total Paid], RTrim(EmployeePayment.Deduction) [Deduction],RTrim(EmployeePayment.DuePayment) [Due Payment], RTrim(EmployeePayment.PaymentDate) [Payment Date],RTrim(EmployeePayment.ModeOfpayment) [Payment Mode],RTrim(EmployeePayment.PaymentModeDetails) [Payment Mode Details] FROM  staffINNER JOIN EmployeePayment ON Employee.StaffID = EmployeePayment.StaffID and Employee.StaffID= '" + cmbstaffid.Text + "' order by PaymentDate", con);
               // SQLConn.cmd.Parameters.Add("@date1", SqlDbType.DateTime, 30, "PaymentDate").Value = Date_from.Value.Date;
               // SQLConn.cmd.Parameters.Add("@date2", SqlDbType.DateTime, 30, "PaymentDate").Value = Date_to.Value.Date;

                NpgsqlDataAdapter myDA = new NpgsqlDataAdapter(cmd);

                DataSet myDataSet = new DataSet();

                myDA.Fill(myDataSet, "EmployeePayment");
                myDA.Fill(myDataSet, "Employee");
               
         
                dataGridView2.DataSource = myDataSet.Tables["EmployeePayment"].DefaultView;
                dataGridView2.DataSource = myDataSet.Tables["Employee"].DefaultView;
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
               cmd = new NpgsqlCommand("SELECT RTrim(Employee.StaffName) [Staff Name],RTrim (Employee.Designation)[Designation],RTrim(Employee.Department) [Department], RTrim(EmployeePayment.StaffID)[Staff ID], RTrim (EmployeePayment.EmpPaymentID) [Payment ID],RTrim(EmployeePayment.BasicSalary) [Basic Salary], RTrim(EmployeePayment.TotalPaid) [Total Paid], RTrim(EmployeePayment.Deduction) [Deduction],RTrim(EmployeePayment.DuePayment) [Due Payment], RTrim(EmployeePayment.PaymentDate) [Payment Date],RTrim(EmployeePayment.ModeOfpayment) [Payment Mode],RTrim(EmployeePayment.PaymentModeDetails) [Payment Mode Details] FROM  staffINNER JOIN EmployeePayment ON Employee.StaffID = EmployeePayment.StaffID and PaymentDate between @date1 and @date2 order by PaymentDate", con);
                SQLConn.cmd.Parameters.Add("@date1",  "PaymentDate").Value = PaymentDateFrom.Value.Date;
                SQLConn.cmd.Parameters.Add("@date2",  "PaymentDate").Value = PaymentDateTo.Value.Date;

                NpgsqlDataAdapter myDA = new NpgsqlDataAdapter(cmd);

                DataSet myDataSet = new DataSet();

                myDA.Fill(myDataSet, "EmployeePayment");
                myDA.Fill(myDataSet, "Employee");
               
         
                dataGridView3.DataSource = myDataSet.Tables["EmployeePayment"].DefaultView;
                dataGridView3.DataSource = myDataSet.Tables["Employee"].DefaultView;
                con.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void dataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow dr = dataGridView1.SelectedRows[0];
                this.Hide();
                frmEmployeePayment frm =new frmEmployeePayment();
                // or simply use column name instead of index
                //dr.Cells["id"].Value.ToString();
                frm.Show();

                frm.PaymentID.Text= dr.Cells[4].Value.ToString();
                frm.cmbstaffid.Text = dr.Cells[3].Value.ToString();
                frm.txtEmployeeName.Text = dr.Cells[0].Value.ToString();
                frm.txtDesignation.Text = dr.Cells[1].Value.ToString();
                frm.txtDepartment.Text = dr.Cells[2].Value.ToString();
                frm.txtBasicSalary.Text = dr.Cells[5].Value.ToString();
                frm.txtModeOfPayment.Text = dr.Cells[10].Value.ToString();
                frm.txtPaymentModeDetails.Text = dr.Cells[11].Value.ToString();
                frm.txtTotalPaid.Text= dr.Cells[6].Value.ToString();
                frm.txtDeduction.Text= dr.Cells[7].Value.ToString();
                frm.txtDuepayment.Text = dr.Cells[8].Value.ToString();
                frm.PaymentDate.Text = dr.Cells[9].Value.ToString();
          
                frm.Delete.Enabled = true;
                frm.Update_record.Enabled = true;
                frm.Print.Enabled = true;
                frm.btnSave.Enabled = false;


            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void dataGridView2_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {

            try
            {
                DataGridViewRow dr = dataGridView2.SelectedRows[0];
                this.Hide();
                frmEmployeePayment frm = new frmEmployeePayment();
                // or simply use column name instead of index
                //dr.Cells["id"].Value.ToString();
                frm.Show();

                frm.PaymentID.Text = dr.Cells[4].Value.ToString();
                frm.cmbstaffid.Text = dr.Cells[3].Value.ToString();
                frm.txtEmployeeName.Text = dr.Cells[0].Value.ToString();
                frm.txtDesignation.Text = dr.Cells[1].Value.ToString();
                frm.txtDepartment.Text = dr.Cells[2].Value.ToString();
                frm.txtBasicSalary.Text = dr.Cells[5].Value.ToString();
                frm.txtModeOfPayment.Text = dr.Cells[10].Value.ToString();
                frm.txtPaymentModeDetails.Text = dr.Cells[11].Value.ToString();
                frm.txtTotalPaid.Text = dr.Cells[6].Value.ToString();
                frm.txtDeduction.Text = dr.Cells[7].Value.ToString();
                frm.txtDuepayment.Text = dr.Cells[8].Value.ToString();
                frm.PaymentDate.Text = dr.Cells[9].Value.ToString();
            
                frm.Delete.Enabled = true;
                frm.Update_record.Enabled = true;
                frm.Print.Enabled = true;
                frm.btnSave.Enabled = false;


            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void dataGridView3_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {

            try
            {
                DataGridViewRow dr = dataGridView3.SelectedRows[0];
                this.Hide();
                frmEmployeePayment frm = new frmEmployeePayment();
                // or simply use column name instead of index
                //dr.Cells["id"].Value.ToString();
                frm.Show();

                frm.PaymentID.Text = dr.Cells[4].Value.ToString();
                frm.cmbstaffid.Text = dr.Cells[3].Value.ToString();
                frm.txtEmployeeName.Text = dr.Cells[0].Value.ToString();
                frm.txtDesignation.Text = dr.Cells[1].Value.ToString();
                frm.txtDepartment.Text = dr.Cells[2].Value.ToString();
                frm.txtBasicSalary.Text = dr.Cells[5].Value.ToString();
                frm.txtModeOfPayment.Text = dr.Cells[10].Value.ToString();
                frm.txtPaymentModeDetails.Text = dr.Cells[11].Value.ToString();
                frm.txtTotalPaid.Text = dr.Cells[6].Value.ToString();
                frm.txtDeduction.Text = dr.Cells[7].Value.ToString();
                frm.txtDuepayment.Text = dr.Cells[8].Value.ToString();
                frm.PaymentDate.Text = dr.Cells[9].Value.ToString();
     
                frm.Delete.Enabled = true;
                frm.Update_record.Enabled = true;
                frm.Print.Enabled = true;
                frm.btnSave.Enabled = false;


            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
            txtEmployeeName.Text= "";
            Date_from.Text = System.DateTime.Today.ToString();
            Date_to.Text = System.DateTime.Today.ToString();
            dataGridView1.DataSource = null;
        }

        private void button9_Click(object sender, EventArgs e)
        {
           cmbstaffid.Text = "";
         
            dataGridView2.DataSource = null;
        }

        private void button11_Click(object sender, EventArgs e)
        {
            PaymentDateFrom.Text = System.DateTime.Today.ToString();
            PaymentDateTo.Text = System.DateTime.Today.ToString();
            dataGridView3.DataSource = null;
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

        private void frmEmployeePaymentRecord_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Hide();
            frmEmployeePayment frm = new frmEmployeePayment();
           
            frm.Show();
        }
        }
        }
    

