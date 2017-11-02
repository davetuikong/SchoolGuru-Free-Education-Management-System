using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Npgsql;

namespace SchoolGuru
{
    public partial class frmSubjectEntry : Form
    {
        School sch = new School();

        public bool adding = true;
        clsFunc cf = new clsFunc();
        string st1;
        string st2;
        public frmSubjectEntry()
        {
            InitializeComponent();
        }
        private void Reset()
        {

            txtSubjectCode.Text = "";
            txtSubjectName.Text = "";

            cmbClass.Text = "";
          
            btnSave.Enabled = true;
            Delete.Enabled = false;
            Update_record.Enabled = false;
            txtSubjectCode.Focus();
            sch.ResetCombos(this);
          
        }
       
        private void delete_records()
        {

            try
            {


                int RowsAffected = 0;

                SQLConn.ConnOpen();
                SQLConn.sqL = "select subjectcode from marksentry where subjectcode=@find";


                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);


                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@find",  txtSubjectCode.Text));

                SQLConn.dr = SQLConn.cmd.ExecuteReader();

                if (SQLConn.dr.Read())
                {
                    MessageBox.Show("Unable to delete..Already in use", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    Reset();
                    if ((SQLConn.dr != null))
                    {
                        SQLConn.dr.Close();
                    }
                    return;
                }



                SQLConn.sqL = "delete from subject where subjectcode=@DELETE1;";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                 SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@DELETE1", txtSubjectCode.Text));

                RowsAffected = SQLConn.cmd.ExecuteNonQuery();

                if (RowsAffected > 0)
                {
                    MessageBox.Show("Successfully deleted", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
                
                    st2 = "Deleted subject whose subjectCode is'" + txtSubjectCode.Text + "'";
                  //  cf.LogFunc(st1, System.DateTime.Now, st2);
                  
                }
                else
                {
                    MessageBox.Show("No Record found", "Sorry", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    Reset();
                }

                SQLConn.ConnClose();

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
        private void btnSave_Click(object sender, EventArgs e)
        {
            if (txtSubjectCode.Text == "")
            {
                MessageBox.Show("Please enter subject code", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtSubjectCode.Focus();
                return;
            }
            if (txtSubjectName.Text == "")
            {
                MessageBox.Show("Please enter subject name", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtSubjectName.Focus();
                return;
            }
            if (cmbClass.Text == "")
            {
                MessageBox.Show("Please select course name", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                cmbClass.Focus();
                return;
            }

            try
            {

                SQLConn.ConnOpen();
                SQLConn.sqL= "select subjectcode from subject where subjectcode=@find";

                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);

                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@find", txtSubjectCode.Text));
             
                SQLConn.dr = SQLConn.cmd.ExecuteReader();

                if (SQLConn.dr.Read())
                {
                    MessageBox.Show("Subject Code Already Exists", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtSubjectCode.Text = "";
                    txtSubjectCode.Focus();


                    if ((SQLConn.dr != null))
                    {
                        SQLConn.dr.Close();
                    }
                    return;
                }

              

                SQLConn.sqL = "insert into subject(subjectcode,subjectname,classname) VALUES (@d1,@d2,@d4)";

                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);

   
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d1", txtSubjectCode.Text.Trim()));

                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d2", txtSubjectName.Text.Trim()));


                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d4", cmbClass.Text));

               
                SQLConn.cmd.ExecuteNonQuery();
                MessageBox.Show("Successfully saved", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
            
                st2 = "Added New subject whose subjectCode is'" +txtSubjectCode.Text + "'";
                cf.LogFunc(st1, System.DateTime.Now, st2);
                btnSave.Enabled = false;

                if (System.Windows.Forms.Application.OpenForms["frmSubjectRecords"] != null)
                {
                    (System.Windows.Forms.Application.OpenForms["frmSubjectRecords"] as frmTeacherSubjectRecords).LoadSubjects();
                }
 
                SQLConn.ConnClose();


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

        private void frmSubectEntry_Load(object sender, EventArgs e)
        {
            sch.FillComboClass(cmbClass);
            if (!adding) sch.ResetCombos(this);
          
        
        }

        private void Delete_Click(object sender, EventArgs e)
        {
            if (txtSubjectCode.Text == "")
            {
                MessageBox.Show("Please enter subject code", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtSubjectCode.Focus();
                return;
            }
            if (MessageBox.Show("Do you really want to delete this record?", "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
            {
                delete_records();


            }
        }

        private void Update_record_Click(object sender, EventArgs e)
        {
             try{
                 SQLConn.ConnOpen();

                string cb = "update subject set subjectcode=@d1, subjectname=@d2,classname=@d4 where subjectcode='"+txtSubjectCode.Text+"'";

                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d1", txtSubjectCode.Text.Trim()));
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d2", txtSubjectName.Text.Trim()));
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@d4", cmbClass.Text));
               
               
                SQLConn.cmd.ExecuteNonQuery();
                MessageBox.Show("Successfully updated", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
              
                st2 = "Updated subject whose subjectCode is'" + txtSubjectCode.Text + "'";
                cf.LogFunc(st1, System.DateTime.Now, st2);
                Update_record.Enabled = false;
        



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

        private void NewRecord_Click(object sender, EventArgs e)
        {
            Reset();
            txtSubjectCode.Enabled = true;
        }

        private void ViewRecord_Click(object sender, EventArgs e)
        {
            this.Hide();
            frmSubjectRecords frm = new frmSubjectRecords();
       
           
            frm.Show();
        }

        private void lblUserType_Click(object sender, EventArgs e)
        {

        }

       

        private void Class_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}
