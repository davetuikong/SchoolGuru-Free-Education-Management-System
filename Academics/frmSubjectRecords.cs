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

namespace SchoolGuru
{
    public partial class frmSubjectRecords : Form 
    {
      
        public frmSubjectRecords()
        {
            InitializeComponent();
        }
        private void LoadClassCombo(ComboBox cb)
        {

            try
            {


                SQLConn.ConnOpen();
                SQLConn.da = new NpgsqlDataAdapter("SELECT id, classname  FROM sclass order by classname", SQLConn.conn);
            
              DataTable dt= new DataTable();
              SQLConn.da.Fill(dt);

             dt.Rows.Add(-1, "All Classes");
                 

           cb.DataSource = dt;
               
               
                cb.DisplayMember = "classname";
                cb.ValueMember = "id";
             

                SQLConn.ConnClose();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error is", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                SQLConn.cmd.Dispose();
                SQLConn.ConnClose();
            }

        }
        private void frmSubjectRecords_Load(object sender, EventArgs e)
        {
            LoadClassCombo(cmbClass);
            cmbClass.SelectedValue = -1;
            LoadSubjects();
          
        }
        public void LoadSubjects()
        {

          
            try
            {
                SQLConn.ConnOpen();
              SQLConn.sqL="select id ,subjectcode, subjectname,classname  from subject   where 1=1 ";

              if (int.Parse(cmbClass.SelectedValue.ToString())>0) SQLConn.sqL += " AND classname= '" + cmbClass.Text + "' ";
                
               SQLConn.sqL +=" order by classname,subjectcode";
            
             
            SQLConn.da= new NpgsqlDataAdapter(SQLConn.sqL,SQLConn.conn );
            
            dataGridView1.DataSource = null;
                DataTable dt= new DataTable();
              

                    SQLConn.da.Fill(dt);
                    dataGridView1.DataSource = dt;
                
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                SQLConn.cmd.Dispose();
                SQLConn.ConnClose();
            }
        }
        private void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (cmbClass.Text == "")
                {
                    MessageBox.Show("Please select class", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    cmbClass.SelectedValue = -1;
                    cmbClass.Focus();
                    return;
                }

                LoadSubjects();
              
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
                if ( string.IsNullOrEmpty(dr.Cells[0].Value.ToString())) return;
               
                frmSubjectEntry frm = new frmSubjectEntry();
                // or simply use column name instead of index
                //dr.Cells["id"].Value.ToString();
                frm.Show();
                frm.txtSubjectCode.Text = dr.Cells[1].Value.ToString();
                frm.txtSubjectName.Text = dr.Cells[2].Value.ToString();
                frm.cmbClass.Text = dr.Cells[3].Value.ToString();
               // frm.txtClassID.Text = dr.Cells[3].Value.ToString();
                frm.adding = false;
                frm.txtSubjectCode.Enabled = true;
                frm.Delete.Enabled = true;
                frm.Update_record.Enabled = true;
                frm.btnSave.Enabled = false;

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

      



        private void btnAddNew_Click(object sender, EventArgs e)
        {
            frmSubjectEntry frm = new frmSubjectEntry();
            frm.Show();
        }

       
    }
}
