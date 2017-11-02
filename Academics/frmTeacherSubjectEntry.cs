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
    public partial class frmTeacherSubjectEntry : Form
    {


        public bool adding = true;
        clsFunc cf = new clsFunc();
        School sch = new School();

        string st2;
        public frmTeacherSubjectEntry()
        {
            InitializeComponent();
        }
        private void Reset()
        {


            cmbClass.Text = "";

        
            btnDelete.Enabled = false;



        }
     

          
       
        private void DeleteTeacherSubject()
        {

            try
            {


              
                int t= int.Parse(cmbStaff.SelectedValue.ToString());
                string s=cmbSubject.SelectedValue.ToString();

                SQLConn.sqL = "delete from staffsubject  where id="+int.Parse(btnDelete.Tag.ToString())+"";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                Console.WriteLine(SQLConn.sqL);

                st2 = "Deleted '" + groupBox1.Tag + "'";
                    MessageBox.Show(st2, "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
                
             
                  //  cf.LogFunc(st1, System.DateTime.Now, st2);
                    Reset();
          
      

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
        private void AddSubjectTeacher()
        {
            
          
            try
            {

                SQLConn.ConnOpen();

                int st = int.Parse(cmbStaff.SelectedValue.ToString());
                string s = cmbSubject.SelectedValue.ToString();
                SQLConn.sqL = "select subjectcode from staffsubject where staffid=" + st + "  AND  subjectcode= '" + s + "'";
                Console.WriteLine(SQLConn.sqL);
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);

         
                SQLConn.dr = SQLConn.cmd.ExecuteReader();

                if (SQLConn.dr.Read())
                {
                    MessageBox.Show("Teacher Already Added for this subject Already Exists", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
              


                    if ((SQLConn.dr != null))
                    {
                        SQLConn.dr.Close();
                    }
                    return;
                }

              

                SQLConn.sqL = "insert into staffsubject(staffid,subjectcode) VALUES ('"+cmbStaff.SelectedValue.ToString()+"','"+cmbSubject.SelectedValue.ToString()+"')";

                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);

                Console.WriteLine(SQLConn.sqL);

               
                SQLConn.cmd.ExecuteNonQuery();
                st2 = "Added New Teacher for   is '" + cmbSubject.Text + "'";
                MessageBox.Show(st2, "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
            

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

        private void frmTeacherSubjectEntry_Load(object sender, EventArgs e)
        {
            sch.FillComboClass(cmbClass);
            sch.FillComboSubject(cmbSubject,"");
            sch.FillComboStaff(cmbStaff);
            if (adding)
            {
                sch.ResetCombos(this);
                btnDelete.Enabled = false;
                btnAdd.Enabled = true;
            }
            else
            {
                btnDelete.Enabled = true;
                btnAdd.Enabled = false;

            }
        }

        private void Delete_Click(object sender, EventArgs e)
        {
            

            if (MessageBox.Show("Do you really want to delete this record?", "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
            {
                DeleteTeacherSubject();
                this.Close();
                if (System.Windows.Forms.Application.OpenForms["frmTeacherSubjectRecords"] != null)
                {
                    (System.Windows.Forms.Application.OpenForms["frmTeacherSubjectRecords"] as frmTeacherSubjectRecords).LoadSubjects();
                }


            }
        }

        private bool ValidateEntry()
        {

            bool valid = true;
            string msg="";
            if (cmbSubject.SelectedValue.ToString() == "-1")
            {
                msg += "Please enter subject name";
                valid = false;
            }
               
            if (int.Parse(cmbStaff.SelectedValue.ToString()) == -1)
            {

                msg += "Please enter Teacher name";
                 valid= false;
            }

            if (!valid) MessageBox.Show(msg, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return valid;



        }

        

        private void NewRecord_Click(object sender, EventArgs e)
        {
            Reset();
           
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

        private void button1_Click(object sender, EventArgs e)
        {

            string clas;
            if (cmbClass.Text == "Select Class") clas = "";
            else clas = cmbClass.Text;
            sch.FillComboSubject(cmbSubject, clas);
           
        }

        

        private void NewRecord_Click_1(object sender, EventArgs e)
        {
            if (!ValidateEntry()) return; 
            AddSubjectTeacher();
            sch.ResetCombos(this);
            if (System.Windows.Forms.Application.OpenForms["frmTeacherSubjectRecords"] != null)
            {
                (System.Windows.Forms.Application.OpenForms["frmTeacherSubjectRecords"] as frmTeacherSubjectRecords).LoadSubjects();
            }

        }

    }
}
