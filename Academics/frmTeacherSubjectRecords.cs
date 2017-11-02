using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using Npgsql;
using Excel = Microsoft.Office.Interop.Excel;
using System.Windows.Forms;
using System.IO;

namespace SchoolGuru
{
    public partial class frmTeacherSubjectRecords : Form 
    {

        School sch = new School();
        

        public frmTeacherSubjectRecords()
        {
            InitializeComponent();
        }
      
        private void frmSubjectRecords_Load(object sender, EventArgs e)
        {

            sch.FillComboClass(cmbClass);
            sch.FillComboSubject(cmbSubject,"");
            sch.FillComboStaff(cmbStaff);
            sch.ResetCombos(this);

            LoadSubjects();

          
        }
        public void LoadSubjects()
        {

          
            try
            {
                SQLConn.ConnOpen();
                SQLConn.sqL = "select staffsubject.id ,staffsubject.subjectcode, subject.subjectname, staffname, classname,  staffsubject.staffid from staffsubject, staff, subject WHERE  subject.subjectcode=staffsubject.subjectcode   AND staff.id=staffsubject.staffid ";

                if (int.Parse(cmbStaff.SelectedValue.ToString()) > 0) SQLConn.sqL += " AND staffid = " + int.Parse( cmbStaff.SelectedValue.ToString()) + " ";
              if (cmbSubject.SelectedValue.ToString() != "-1") SQLConn.sqL += " AND subject.subjectcode= '" + cmbSubject.SelectedValue+ "' ";
              if (int.Parse(cmbClass.SelectedValue.ToString()) > 0) SQLConn.sqL += " AND subject.classname= '" + cmbClass.Text + "' ";

              SQLConn.sqL += " order by classname,subjectcode";
            
             
            SQLConn.da= new NpgsqlDataAdapter(SQLConn.sqL,SQLConn.conn );
            
            DGV.DataSource = null;
                DataTable dt= new DataTable();
              

                    SQLConn.da.Fill(dt);
                    DGV.DataSource = dt;
                
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void Button1_Click(object sender, EventArgs e)
        {
            try
            {
               
                LoadSubjects();
              
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void DGV_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        { 
            try
            {
                DataGridViewRow dr = DGV.SelectedRows[0];
                if (dr.IsNewRow || string.IsNullOrEmpty(dr.Cells[0].Value.ToString())) return;

                frmTeacherSubjectEntry frm = new frmTeacherSubjectEntry();
                frm.adding = false;
                frm.Show();
                frm.cmbClass.Text = dr.Cells["classname"].Value.ToString();
                frm.cmbSubject.Text = dr.Cells["subjectname"].Value.ToString();
                frm.cmbStaff.Text = dr.Cells["staffname"].Value.ToString();
                frm.btnDelete.Tag = dr.Cells["id"].Value.ToString();
                GroupBox1.Tag = "Teacher: " +  dr.Cells["staffname"].Value.ToString() +"  Subject : " +  dr.Cells["subjectname"].Value.ToString()+" ";
            
            
       
       

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }


       

        private void btnAddNew_Click(object sender, EventArgs e)
        {
            frmTeacherSubjectEntry frm = new frmTeacherSubjectEntry();
            frm.Show();
        }

        private void DGV_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            sch.ResetCombos(this);
            LoadSubjects();

        }

        private void button3_Click(object sender, EventArgs e)
        {
            SaveFileDialog sfd = new SaveFileDialog();
            sfd.Filter = "Excel Documents (*.xls)|*.xls";
            sfd.FileName = this.Name;
            if (sfd.ShowDialog() == DialogResult.OK)
            {
                //ToCsV(dataGridView1, @"c:\export.xls");
                sch.ToCsV(DGV, sfd.FileName); // Here dataGridview1 is your grid view name
               
            }
        }

       
    }
}
