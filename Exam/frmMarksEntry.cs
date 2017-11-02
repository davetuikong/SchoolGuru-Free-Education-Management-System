using System;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.Specialized;
using Npgsql;
using Microsoft.VisualBasic;
using System.Windows.Forms;
using System.Data;
using System.IO;
using System.Diagnostics;
using System.Text.RegularExpressions;
using Npgsql;
namespace SchoolGuru
{
    public partial class frmMarksEntry : Form
    {
        TimeManager TM = new TimeManager();
        School sch = new School();
        Academics Cls = new Academics();
        public frmMarksEntry()
        {
            InitializeComponent();
   
            this.cmbClass.SelectedIndexChanged -= new System.EventHandler(this.cmbClass_SelectedIndexChanged);
            DGVMarksEntry.AutoGenerateColumns = false;
            sch.FillComboClass(cmbClass);
            sch.FillComboSection(cmbSection);
            sch.FillComboTerm(cmbTerm);
            ResetCombos();

           this.cmbClass.SelectedIndexChanged += new System.EventHandler(this.cmbClass_SelectedIndexChanged);

            
        }




        public void ResetCombos()
        {
            var c = GetAll(this, typeof(ComboBox));
            foreach (ComboBox cb in c)
            {

                cb.SelectedValue = -1;

            }



        }
        public void ListStudentMarks()
        {


            DGVMarksEntry.DataSource = null;
            try
            {
                SQLConn.sqL = "  SELECT ";
                SQLConn.sqL += "exammarks.id,  ";

          SQLConn.sqL +=   " SELECT exammarks.id,  exam.examname,  examtype.examtypename, markobtained, ";
          SQLConn.sqL += "    concat(subject.subjectcode || '   ' || subjectname) as subject, totalmark,  exam.startdate, exam.enddate ";
         SQLConn.sqL +=  "   FROM   public.exammarks "; 
         SQLConn.sqL +=   "  LEFT JOIN   public.studentdetail  as sd on exammarks.admissionno = sd.admissionno   ";
       SQLConn.sqL +=     "   LEFT JOIN  public.exam on   exammarks.examid= exam.id ";
        SQLConn.sqL +=    "  LEFT JOIN  public.subject on   subject.subjectcode= exammarks.subjectcode";
        SQLConn.sqL += "   LEFT JOIN public.examtype   on    examtype.id = exam.examtype    order by startdate ASC";
                Debug.Write(SQLConn.sqL);

                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);
                DataTable dt = new DataTable();
                SQLConn.da.Fill(dt);
                DGVMarksEntry.DataSource = dt;
            
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }



        public IEnumerable<Control> GetAll(Control control, Type type)
        {
            var controls = control.Controls.Cast<Control>();

            return controls.SelectMany(ctrl => GetAll(ctrl, type))
                                      .Concat(controls)
                                      .Where(c => c.GetType() == type);
        }



        private bool ValidEntry()
        {

            bool valid = true;
            //if (cmbExam.Text == "")
            //{
            //    MessageBox.Show("Please enter Exam name", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

            //    valid = false;


            //}
           if (cmbClass.SelectedValue.ToString() == "-1" ||  cmbTerm.SelectedValue.ToString() == "-1")
            {

                MessageBox.Show("Please enter Exam Type, Term and Class", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
             
                valid = false;
                return valid;


            }

            

            return valid;


        }
        private void  SaveMarks()
        {


            if (!ValidEntry()) return;
            try {

                SQLConn.sqL = "insert into exammarks(examid, admissionno , subjectcode, markobtained,  totalmark) VALUES ('" +  lblExamtitle.Tag + "','" + txtStudent.Text+ "', '"+lblSubject.Tag+"', '"+txtMark.Text+"', '"+txtTotal.Text +"' )";
                SQLConn.ConnOpen();
               SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
              SQLConn.cmd.ExecuteNonQuery();
                ListStudentMarks();
                Reset();  
        
               // cf.LogFunc(st1, System.DateTime.Now, st2);
                MessageBox.Show("Successfully saved", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);  

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            finally
            {

                SQLConn.ConnClose();
            }
        }

    

        private void NewRecord_Click(object sender, EventArgs e)
        {
         Reset();   
        }
         private void DeleteExam()
        {

            try
            {

                int RowsAffected = 0;
                SQLConn.ConnOpen();
                SQLConn.sqL = "delete from exam where id = ''";
               SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
  
              RowsAffected=  SQLConn.cmd.ExecuteNonQuery();
         

                if (RowsAffected > 0)
                {
                    MessageBox.Show("Successfully deleted", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
         
               //string      st2 = "Deleted Exam '" +cmbExam.SelectedValue+ "'";
                   // cf.LogFunc(st1, System.DateTime.Now, st2);
                    Reset();
                }
                else
                {
                    MessageBox.Show("No Record found", "Sorry", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Reset();
                }
             
                ListStudentMarks(); 
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {

                SQLConn.ConnClose();
            }
        }
        private void Reset()
        {

       

            cmbTerm.SelectedValue = -1;
            cmbClass.SelectedValue = -1;
  
            ResetCombos();
        }
        private void Update_record_Click(object sender, EventArgs e)
        {

            if (!ValidEntry()) return;


             try
            {


                SQLConn.ConnOpen();
                //SQLConn.sqL = "update exam set examname='" + cmbExam.SelectedValue + "', startdate='', class='" + cmbClass.SelectedValue + "'  , schoolterm='" + cmbTerm.SelectedValue + "'      , enddate=''    where  id='" + cmbExam.SelectedValue + "'";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.cmd.ExecuteNonQuery();
         
                MessageBox.Show("Successfully updated", "Exam Details", MessageBoxButtons.OK, MessageBoxIcon.Information);
            //    st1 = lblUser.Text;
              //  st2 = "Updated Exam'" +cmbExam.SelectedValue+ "'";
            //    cf.LogFunc(st1, System.DateTime.Now, st2);
       

               ListStudentMarks();
               Reset();


               SQLConn.ConnClose();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
        
        }

        private void Delete_Click(object sender, EventArgs e)
        {
          DeleteExam();
        }

        //private void DataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        //{
        //    try
        //    {
        //        DataGridViewRow dr = DataGridView1.SelectedRows[0];
        //        //cmbExam.SelectedValue = dr.Cells[0].Value.ToString();
        //        //cmbExam.SelectedValue = dr.Cells[1].Value.ToString();
            

           

        //        MessageBox.Show(dr.Cells["examtypename"].Value.ToString());
        
  
        //        cmbClass.Text = dr.Cells["classname"].Value.ToString();
        //        cmbTerm.Text = dr.Cells["termname"].Value.ToString();

        //                               //ye hide ho jaye kyu ki grid view se data laye he update k liye save ke lie nhi 
        //    }
        //    catch (Exception ex)
        //    {
        //        MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        //    }
        //}

        private void button1_Click(object sender, EventArgs e)
        {

        }

 
   

        private void btnFilter_Click(object sender, EventArgs e)
        {
           
          ShowExams();
        }

        private void cmbClass_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            cmbSubject.DataSource = null;
            cmbSubject.DataSource =Cls.GetClassSubjects(cmbClass.Text);
            cmbSubject.ValueMember = "subjectcode";
            cmbSubject.DisplayMember = "subjectname";
           

        }

        private void ShowExams()
        {

            if (!ValidEntry()) return;
           DataTable dt= Cls.GetExams(int.Parse( cmbClass.Text),   int.Parse( cmbTerm.SelectedValue.ToString()));
            int i=0;
            ListViewItem x = null;
            lstExams.Items.Clear();
                 for(i=0; i<dt.Rows.Count-1; i++){
              DataRow row = dt.Rows[i];
           x = new ListViewItem(row["id"].ToString());
           x.SubItems.Add(row["examname"].ToString());
           x.SubItems.Add(Convert.ToDateTime(row["startdate"].ToString()).ToString("dd-MMM-yyyy"));
           lstExams.Items.Add(x);
       }

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            frmExamEntry frm = new frmExamEntry();
            frm.ShowDialog();
        }



        private void lstExams_MouseClick(object sender, MouseEventArgs e)
        {
            if (lstExams.SelectedItems.Count == 0 || lstExams.SelectedItems[0].SubItems[0] == null)
                {
                    return;
                }
                string id= lstExams.SelectedItems[0].SubItems[0].Text;
              string title= lstExams.SelectedItems[0].SubItems[1].Text;
               lblExamtitle.Text=title;
               lblExamtitle.Tag = id;
               lblSubject.Text = cmbSubject.Text;
               lblSubject.Tag = cmbSubject.SelectedValue.ToString().ToUpper();
               ListStudentMarks();
            
        }

        private void cmbSubject_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            if(lblExamtitle.Tag !=null)
            {
                lblSubject.Text = (cmbSubject.Text  +"-"+  cmbSubject.SelectedValue.ToString()).ToUpper();
                lblSubject.Tag = cmbSubject.SelectedValue.ToString().ToUpper();

            }
        }


        private void DGVMarksEntry_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                if (lblSubject.Text == "Select Subject" ||  lblExamtitle.Tag == null)
                {
                    MessageBox.Show("Select Subject & Exam to Add Marks!");
                    DGVMarksEntry.BeginEdit(false);
                return;
                }
            }
            catch (Exception)
            {
            }
            finally
            {
                this.Refresh();
            }
        }

        private void EditingControl_KeyUp(object sender, DataGridViewEditingControlShowingEventArgs e)
        {

            MessageBox.Show("Keyup");

        }

        private void DGVMarksEntry_CellValidating(object sender, DataGridViewCellValidatingEventArgs e)
        {
            DataGridViewRow row = (DataGridViewRow)DGVMarksEntry.Rows[e.RowIndex];



       

 
            switch (DGVMarksEntry.Columns[e.ColumnIndex].Name)
            {

                case "StudentName":
                       lstStudents.Visible = true;
                 lstStudents.BringToFront();
                 lstStudents.Select();
                    sch.SuggestStudent(lstStudents, e.FormattedValue.ToString());
                    break;

                case "StudentId":
                       lstStudents.Visible = true;
                 lstStudents.BringToFront();
                 lstStudents.Select();

                 string txt = e.FormattedValue.ToString();
                 sch.SuggestStudent(lstStudents, e.FormattedValue.ToString());
                    break;

             

            }


        }


        private void txtSearch_TextChanged(object sender, EventArgs e)
        {

            txtStudent.ForeColor = System.Drawing.Color.Black;
            if (txtStudent.Text.Trim() == "")
            {
                lstStudents.Visible = false;


            }


            else
            {

                lstStudents.Visible = true;
                lstStudents.BringToFront();
                lstStudents.Select();
                sch.SuggestStudent(lstStudents, txtStudent.Text);


            }


        }

        private void lstStudents_MouseClick(object sender, MouseEventArgs e)
        {
            if (lstStudents.SelectedItems.Count == 0) return;
           string admno = lstStudents.SelectedItems[0].SubItems[0].Text;
           txtStudent.Tag = admno;
           txtStudent.Text = lstStudents.SelectedItems[0].SubItems[0].Text + "-" + lstStudents.SelectedItems[0].SubItems[1].Text;
           lstStudents.Visible = false;
           txtMark.Focus();
        
            
        }

        private void btnAddEdit_Click(object sender, System.EventArgs e)
        {
            SaveMarks();
        }

     

    }
    }

