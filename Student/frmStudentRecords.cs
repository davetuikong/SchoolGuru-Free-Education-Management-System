using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using Npgsql;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Collections.Specialized;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SchoolGuru
{
    public partial class frmStudentRecords : Form
    {
        School sch = new School();
        TimeManager Tm = new TimeManager();
        bool filterdate = false;
        bool sname;
         bool sschool;
        
        public frmStudentRecords()
        {
            InitializeComponent();
            SearchStudents(false, false, false);

           SchoolParameters();
        }

        private void frmStudentRecords_Load(object sender, EventArgs e)
        {

            
        }




        private void SchoolParameters()
        {

       
            sch.FillComboClass(cmbClass);
            sch.FillComboTerm(cmbTerm);
            sch.FillComboSection(cmbSection);
            sch.FillComboStudentCategory(cmbCategory);
            sch.FillComboStatus(cmbStatus);
            sch.ResetCombos(this);


        }
      

   private void SearchStudents(bool sname, bool sschool,  bool filterdate)
        {

        
            try
            {
                SQLConn.ConnOpen();
                SQLConn.sqL = "SELECT admissionno,CONCAT(firstname,  ' '  ,othername) as fullname,status , sclass,section,termname,admissiondate,gender,category from studentdetail LEFT JOIN schoolterm on  studentdetail.term=schoolterm.id WHERE 1=1";


                if (sschool)
                {
                    if (int.Parse(cmbCategory.SelectedValue.ToString()) > 0)
                    {

                        SQLConn.sqL += " AND category ='" + cmbCategory.Text + "'";
                    }

                    if (int.Parse(cmbTerm.SelectedValue.ToString()) > 0)
                    {

                        SQLConn.sqL += " AND term ='" + cmbTerm.SelectedValue.ToString() + "'";
                    }
                    if (int.Parse(cmbClass.SelectedValue.ToString()) > 0)
                    {

                        SQLConn.sqL += " AND sclass ='" + cmbClass.SelectedValue.ToString() + "'";
                    }

                    if (int.Parse(cmbSection.SelectedValue.ToString()) > 0)
                    {

                        SQLConn.sqL += " AND section ='" + cmbSection.SelectedValue.ToString() + "'";
                    }
                    if (int.Parse(cmbStatus.SelectedValue.ToString()) > 0)
                    {

                        SQLConn.sqL += " AND status ='" + cmbStatus.SelectedValue.ToString() + "'";
                    }
                }

                if (sname)
                {

                    if (txtAdmissionNo.Text.Trim() != "") SQLConn.sqL += " AND  admissionno ILike  '%" + txtAdmissionNo.Text.Trim() + "%' or othername ILIKE '%" + txtAdmissionNo.Text.Trim() + "%' or  firstname ILike  '%" + txtAdmissionNo.Text.Trim() + "%' ";

                }

                if (filterdate)
                {

                    SQLConn.sqL += " AND  admissiondate   Between  '" + Tm.AfterMidNight(dtpFrom.Value) + "' AND '" + Tm.BeforeMidNight(dtpTo.Value) + "' ";

                }

                DataGridView1.DataSource = null;



                SQLConn.sqL += "  order by admissionno";

               // MessageBox.Show(SQLConn.sqL);

                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);

                SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);
                DataTable dt = new DataTable();


                SQLConn.da.Fill(dt);
                DataGridView1.DataSource = dt;
                dtpFrom.Enabled = true;
                dtpTo.Enabled = true;

   
                SQLConn.ConnClose();

            }
            catch (NpgsqlException ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                SQLConn.cmd.Dispose();

            }
        }

       

     
        private void btnSearchDate_Click(object sender, EventArgs e)
        {
           sname = chkFilterClass.Checked? true: false;
           sschool = chkFilterName.Checked ? true : false;

        SearchStudents(sname, sschool, true);
          
        }


        private void linkLabel4_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            dtpFrom.Enabled = true;
        }

        private void linkLabel5_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            dtpTo.Enabled = true;
        }

        


        private void btnSearchName_Click(object sender, EventArgs e)
        {

            Button bt = sender as Button;
            SearchStudents(true, false, false);
        }

        private void btnSearchSchool_Click(object sender, EventArgs e)
        {

            filterdate = false;
            SearchStudents(false, true, filterdate);
        }


        private void DataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow dr = DataGridView1.SelectedRows[0];

                if (!dr.IsNewRow && dr.Cells["admissionno"].Value != null)
                {
                frmStudentEnrollment frm = new frmStudentEnrollment();
                string admmino = dr.Cells["admissionno"].Value.ToString();    
                frm.admno = admmino;
                frm.adding = false;
        
                frm.Show();

                    
            }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void txtAdmissionNo_TextChanged(object sender, EventArgs e)
        {

        }


    }
}