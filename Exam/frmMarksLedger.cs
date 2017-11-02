using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
namespace SchoolMaster
{
    public partial class frmMarksLedger : Form
    {
       
        clsFunc cf = new clsFunc();
        string st1;
        string st2;
        

        Connectionstring cs = new Connectionstring();
        public frmMarksLedger()
        {
            InitializeComponent();
        }

        public void AutocompleteEXAM()
        {
            //try
            //{
            //    con = new SqlConnection(cs.DBcon);
            //    con.Open();
            //    string ct = "select distinct RTRIM(Exams.ExamName) from Exams ";
            //    cmd = new SqlCommand(ct);
            //    cmd.Connection = con;
            //    rdr = cmd.ExecuteReader();
            //    while (rdr.Read())
            //    {
            //        cmbExamName.Items.Add(rdr[0]);
            //    }
            //    con.Close();

            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }
        private void frmMarksEntry_Load(object sender, EventArgs e)
        {
         
            AutocompleSession();
            AutocompleteEXAM();
            AutocompleAdmission();
            //Autocomplesuject();
        }
        public void AutocompleAdmission()
        {
            //try
            //{
            //    con = new SqlConnection(cs.DBcon);
            //    con.Open();
            //    string ct = "select distinct RTRIM(AdmissionNo) from Student ";
            //    cmd = new SqlCommand(ct);
            //    cmd.Connection = con;
            //    rdr = cmd.ExecuteReader();
            //    while (rdr.Read())
            //    {
            //        cmbAdmissionNumber.Items.Add(rdr[0]);
            //    }
            //    con.Close();

            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }
        private void cmbSession_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void cmbClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            //cmbSection.Items.Clear();
            //cmbSection.Text = "";
            //cmbSection.Enabled = true;

            //try
            //{

            //    con = new SqlConnection(cs.DBcon);
            //    con.Open();


            //    string ct = "select distinct RTRIM(Section) from Student where class = '" + cmbClass.Text + "' and AdmissionNo='" + cmbAdmissionNumber.Text+ "'";

            //    cmd = new SqlCommand(ct);
            //    cmd.Connection = con;

            //    rdr = cmd.ExecuteReader();

            //    while (rdr.Read())
            //    {
            //        cmbSection.Items.Add(rdr[0]);
            //    }
            //    con.Close();

            //    con = new SqlConnection(cs.DBcon);
            //    con.Open();

            //    cmbSubjectCode.Items.Clear();
            //    cmbSubjectCode.Text = "";
            //    cmbSubjectCode.Enabled = true;
            //    string ct1 = "select distinct RTRIM(Subjectcode) from Subject where ClassName = '" + cmbClass.Text + "'";

            //    cmd = new SqlCommand(ct1);
            //    cmd.Connection = con;

            //    rdr = cmd.ExecuteReader();

            //    while (rdr.Read())
            //    {
            //        cmbSubjectCode.Items.Add(rdr[0]);
            //    }
            //    con.Close();
            //}

            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }
        public void AutocompleSession()
        {
            //try
            //{
            //    con = new SqlConnection(cs.DBcon);
            //    con.Open();
            //    string ct = "select distinct RTRIM(session) from Student ";
            //    cmd = new SqlCommand(ct);
            //    cmd.Connection = con;
            //    rdr = cmd.ExecuteReader();
            //    while (rdr.Read())
            //    {
            //        cmbSession.Items.Add(rdr[0]);
            //    }
            //    con.Close();

            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }
      
        private void cmbSubjectCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            // try
            //{
            //    con = new SqlConnection(cs.DBcon);

            //    con.Open();
            //    cmd = con.CreateCommand();

            //    cmd.CommandText = "SELECT SubjectName FROM Subject WHERE SubjectCode = '" + cmbSubjectCode.Text + "'";
            //    rdr = cmd.ExecuteReader();

            //    if (rdr.Read())
            //    {

            //        txtSubjectName.Text = rdr.GetString(0).Trim();
            //    }

            //    if ((rdr != null))
            //    {
            //        rdr.Close();
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

        private void cmbExamName_SelectedIndexChanged(object sender, EventArgs e)
       {
        //    try
        //    {
        //        cmbExamType.Items.Clear();
        //        cmbExamType.Text = "";
        //        cmbExamType.Enabled = true;
        //        con = new SqlConnection(cs.DBcon);

        //        con.Open();
        //        cmd = con.CreateCommand();

        //        cmd.CommandText = "SELECT ExamType,ID FROM Exams WHERE ExamName= '" + cmbExamName.Text + "'";
        //        rdr = cmd.ExecuteReader();

        //        if (rdr.Read())
        //        {

        //            cmbExamType.Text = rdr.GetString(0).Trim();
        //            //textBox2.Text = rdr.GetString(1).Trim();
        //            textBox2.Text = rdr.GetInt32(1).ToString();
        //        }

        //        if ((rdr != null))
        //        {
        //            rdr.Close();
        //        }
        //        if (con.State == ConnectionState.Open)
        //        {
        //            con.Close();
        //        }


        //    }
        //    catch (Exception ex)
        //    {
        //        MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        //    }
        }

        private void cmbAdmissionNumber_SelectedIndexChanged(object sender, EventArgs e)
        {
            // cmbSession.Items.Clear();
            //cmbSession.Text = "";
            //cmbSession.Enabled = true;

            //try
            //{

            //    con = new SqlConnection(cs.DBcon);
            //    con.Open();
            //    string ct = "select distinct RTRIM(Session) from Student where AdmissionNo = '" + cmbAdmissionNumber.Text+ "'";
            //    cmd = new SqlCommand(ct);
            //    cmd.Connection = con;

            //    rdr = cmd.ExecuteReader();

            //    while (rdr.Read())
            //    {
            //        cmbSession.Items.Add(rdr[0]);
            //    }
            //    con.Close();

            //}

            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }

        private void groupBox4_Enter(object sender, EventArgs e)
        {
        
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    if (cmbSession.Text == "")
            //    {
            //        MessageBox.Show("Please select session", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //        cmbSession.Focus();
            //        return;
            //    }
            //    if (cmbClass.Text == "")
            //    {
            //        MessageBox.Show("Please select class", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //        cmbClass.Focus();
            //        return;
            //    }
            //    if (cmbSection.Text == "")
            //    {
            //        MessageBox.Show("Please select Section", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //        cmbSection.Focus();
            //        return;
            //    }
            //    if (cmbStatus.Text == "")
            //    {
            //        MessageBox.Show("Please select status", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //        cmbStatus.Focus();
            //        return;
            //    }

            //    if (cmbExamType.Text == "")
            //    {
            //        MessageBox.Show("Please select ExamType", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //        cmbSection.Focus();
            //        return;
            //    }
            //    if (cmbSubjectCode.Text == "")
            //    {
            //        MessageBox.Show("Please select subject code", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //        cmbSubjectCode.Focus();
            //        return;
            //    }
            //    if (cmbExamName.Text == "")
            //    {
            //        MessageBox.Show("Please select exam name", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //        cmbExamName.Focus();
            //        return;
            //    }
            //    if (txtMaxMarks.Text == "")
            //    {
            //        MessageBox.Show("Please enter max. marks", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //        txtMaxMarks.Focus();
            //        return;
            //    }
            //    if (txtMinMarks.Text == "")
            //    {
            //        MessageBox.Show("Please enter min. marks", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //        txtMinMarks.Focus();
            //        return;
            //    }
            //    if (txtObtainedMarks.Text == "")
            //    {
            //        MessageBox.Show("Please enter obtained marks", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //        txtMinMarks.Focus();
            //        return;
            //    }
            //    con = new SqlConnection(cs.DBcon);
            //    con.Open();
            //    string cb = "insert into MarksEntry(SubjectCode,ExamDate,MaxMarks,MinMarks,AdmissionNo,MarksObtained,Statuss,ExamID) VALUES (@d4,@d7,@d9,@d10,@d11,@d12,@d13,@d14)";

            //    cmd = new SqlCommand(cb);

            //    cmd.Connection = con;
            //    // Add Parameters to Command Parameters collection
            //   // cmd.Parameters.Add(new SqlParameter("@d1", System.Data.SqlDbType.NChar, 30, "Session"));
            //   // cmd.Parameters.Add(new SqlParameter("@d2", System.Data.SqlDbType.NChar, 30, "Class"));
               
             
            // //   cmd.Parameters.Add(new SqlParameter("@d3", System.Data.SqlDbType.NChar, 10, "Section"));
            //    cmd.Parameters.Add(new SqlParameter("@d4", System.Data.SqlDbType.NChar, 20, "SubjectCode"));
            //   // cmd.Parameters.Add(new SqlParameter("@d5", System.Data.SqlDbType.VarChar, 250, "SubjectName"));
            //  //  cmd.Parameters.Add(new SqlParameter("@d6", System.Data.SqlDbType.NChar, 30, "ExamName"));
            //    cmd.Parameters.Add(new SqlParameter("@d7", System.Data.SqlDbType.NChar, 30, "ExamDate"));
            //   // cmd.Parameters.Add(new SqlParameter("@d8", System.Data.SqlDbType.NChar, 30, "ExamType"));
            //    cmd.Parameters.Add(new SqlParameter("@d9", System.Data.SqlDbType.Int, 10, "Maxmarks"));
            //    cmd.Parameters.Add(new SqlParameter("@d10", System.Data.SqlDbType.Int, 10, "MinMarks"));
            //    cmd.Parameters.Add(new SqlParameter("@d11", System.Data.SqlDbType.NChar, 15, "AdmissionNo"));
            //    cmd.Parameters.Add(new SqlParameter("@d12", System.Data.SqlDbType.Int, 10, "MarksObtained"));
            //              cmd.Parameters.Add(new SqlParameter("@d13", System.Data.SqlDbType.NChar, 10, "Statuss"));
            //              cmd.Parameters.Add(new SqlParameter("@d14", System.Data.SqlDbType.NChar, 10, "ExamID"));
                
            //           // cmd.Parameters["@d1"].Value = cmbSession.Text;
            //           // cmd.Parameters["@d2"].Value = cmbClass.Text;
           
        
            //           // cmd.Parameters["@d3"].Value = cmbSection.Text;
            //            cmd.Parameters["@d4"].Value = cmbSubjectCode.Text;
            //           // cmd.Parameters["@d5"].Value = txtSubjectName.Text;
            //            //cmd.Parameters["@d6"].Value = cmbExamName.Text;
                    
            //            cmd.Parameters["@d7"].Value = dtpExamDate.Text;
            //           // cmd.Parameters["@d8"].Value = cmbExamType.Text;
         
            //            cmd.Parameters["@d9"].Value = txtMaxMarks.Text;
            //           cmd.Parameters["@d10"].Value = txtMinMarks.Text;
            //           cmd.Parameters["@d11"].Value =cmbAdmissionNumber.Text;
            //            cmd.Parameters["@d12"].Value = txtObtainedMarks.Text;
            //            cmd.Parameters["@d13"].Value = cmbStatus.Text;
            //            cmd.Parameters["@d14"].Value = textBox2.Text;
                       
            //            cmd.ExecuteNonQuery();
                
            //         con.Close();
            //    MessageBox.Show("Successfully saved", "Entry", MessageBoxButtons.OK, MessageBoxIcon.Information);
            //    st1 = lblUser.Text;
            //    st2 = "Added New Marks Entry of AdmissionNo'" +cmbAdmissionNumber.Text+ "'";
            //    cf.LogFunc(st1, System.DateTime.Now, st2);

            //    btnSave.Enabled = false;
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        
        }

        private void Update_record_Click(object sender, EventArgs e)
        {
        //    try
        //    {

        //        con = new SqlConnection(cs.DBcon);
        //        con.Open();
        //        string cb = "update MarksEntry set  Statuss=@d2,ExamDate=@d7,MaxMarks=@d8,MinMarks=@d9,MarksObtained=@d10,SubjectCode=@d12 , AdmissionNo=@d13,ExamID =@d14 where ID = '"+textBox1.Text+"'";

        //        cmd = new SqlCommand(cb);

        //        cmd.Connection = con;
        //        // Add Parameters to Command Parameters collection
        //       // cmd.Parameters.Add(new SqlParameter("@d3", System.Data.SqlDbType.NChar, 30, "Session"));
        //       // cmd.Parameters.Add(new SqlParameter("@d4", System.Data.SqlDbType.NChar, 30, "Class"));
        //     //   cmd.Parameters.Add(new SqlParameter("@d1", System.Data.SqlDbType.NChar, 30, "ExamType"));
        //        cmd.Parameters.Add(new SqlParameter("@d2", System.Data.SqlDbType.NChar, 10, "Statuss"));
        //       // cmd.Parameters.Add(new SqlParameter("@d5", System.Data.SqlDbType.NChar, 10, "Section"));
        //        cmd.Parameters.Add(new SqlParameter("@d12", System.Data.SqlDbType.NChar, 20, "SubjectCode"));
        //      //  cmd.Parameters.Add(new SqlParameter("@d6", System.Data.SqlDbType.VarChar, 250, "SubjectName"));
        //        //cmd.Parameters.Add(new SqlParameter("@d11", System.Data.SqlDbType.NChar, 20, "ExamName"));
        //        cmd.Parameters.Add(new SqlParameter("@d7", System.Data.SqlDbType.NChar, 30, "ExamDate"));
        //        cmd.Parameters.Add(new SqlParameter("@d9", System.Data.SqlDbType.Int, 10, "MinMarks"));
        //        cmd.Parameters.Add(new SqlParameter("@d8", System.Data.SqlDbType.Int, 10, "MaxMarks"));
        //        cmd.Parameters.Add(new SqlParameter("@d13", System.Data.SqlDbType.NChar, 15, "AdmissionNo"));
        //        cmd.Parameters.Add(new SqlParameter("@d10", System.Data.SqlDbType.Int, 10, "MarksObtained"));
        //        cmd.Parameters.Add(new SqlParameter("@d14", System.Data.SqlDbType.Int, 10, "ExamID"));

        //               // cmd.Parameters["@d3"].Value = cmbSession.Text;
        //               // cmd.Parameters["@d4"].Value = cmbClass.Text;
        //                //cmd.Parameters["@d1"].Value = cmbExamType.Text;
        //                cmd.Parameters["@d2"].Value = cmbStatus.Text;
        //               // cmd.Parameters["@d5"].Value = cmbSection.Text;
                 
        //               // cmd.Parameters["@d6"].Value = txtSubjectName.Text;
        //                //cmd.Parameters["@d11"].Value = cmbExamName.Text;
        //                cmd.Parameters["@d7"].Value = dtpExamDate.Text;
        //                cmd.Parameters["@d8"].Value = txtMaxMarks.Text;
        //                cmd.Parameters["@d9"].Value = txtMinMarks.Text;
        //                cmd.Parameters["@d13"].Value = cmbAdmissionNumber.Text;
        //                cmd.Parameters["@d10"].Value = txtObtainedMarks.Text;
        //                cmd.Parameters["@d12"].Value = cmbSubjectCode.Text;
        //                cmd.Parameters["@d14"].Value = textBox2.Text;
        //                cmd.ExecuteNonQuery();
                  
        //        con.Close();
        //        MessageBox.Show("Successfully updated", "Entry", MessageBoxButtons.OK, MessageBoxIcon.Information);
        //        st1 = lblUser.Text;
        //        st2 = "Updated Marks of Student'" + cmbAdmissionNumber.Text+ "'";
        //        cf.LogFunc(st1, System.DateTime.Now, st2);

        //       // Update_record.Enabled = false;
        //    }
        //    catch (Exception ex)
        //    {
        //        MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        //    }
        }

        private void cmbSession_SelectedIndexChanged_1(object sender, EventArgs e)
        {

           
            //cmbClass.Items.Clear();
            //cmbClass.Text = "";
            //cmbClass.Enabled = true;

            //try
            //{

            //    con = new SqlConnection(cs.DBcon);
            //    con.Open();
            //    string ct = "select distinct RTRIM(class) from Student where AdmissionNo= '" + cmbAdmissionNumber.Text + "' and session = '" + cmbSession.Text + "'";
            //    cmd = new SqlCommand(ct);
            //    cmd.Connection = con;

            //    rdr = cmd.ExecuteReader();

            //    while (rdr.Read())
            //    {
            //        cmbClass.Items.Add(rdr[0]);
            //    }
            //    con.Close();

            //}

            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }
         private void Reset()
        {
          //  cmbAdmissionNumber.Text="";
          //  cmbClass.Text = "";
          //  cmbSection.Text = "";
          //  cmbSession.Text = "";
          //  txtObtainedMarks.Text = "";
          //  cmbExamType.Text= "";
          //  cmbStatus.Text = "";
           
          //  cmbSubjectCode.Text = "";
          //  txtSubjectName.Text = "";
          //  cmbExamName.Text = "";
          //  dtpExamDate.Text = System.DateTime.Today.ToString();
          //  txtMaxMarks.Text = "";
          //  txtMinMarks.Text = "";
            
          //  cmbSubjectCode.Enabled = false;
          //  cmbSection.Enabled = false;
      
          //  btnSave.Enabled = true;
          //  Delete.Enabled = false;
          ////  Update_record.Enabled = false;
          //  cmbSession.Focus();
        }
         private void delete_records()
         {

             try
             {
             //    int RowsAffected = 0;
             //    con = new SqlConnection(cs.DBcon);
             //    con.Open();
             //   // string cq = "delete from MarksEntry where ID='" +textBox1.Text+ "'";
             //    cmd = new SqlCommand(cq);
             //    cmd.Connection = con;
             //    RowsAffected = cmd.ExecuteNonQuery();

             //    if (RowsAffected > 0)
             //    {
             //        MessageBox.Show("Successfully deleted", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
             //        st1 = lblUser.Text;
             //        st2 = "Deleted Marks of student " +cmbAdmissionNumber.Text+ "'";
             //        cf.LogFunc(st1, System.DateTime.Now, st2);

             //        Delete.Enabled = false;
             //        Reset();
             //    }
             //    else
             //    {
             //        MessageBox.Show("No Record found", "Sorry", MessageBoxButtons.OK, MessageBoxIcon.Information);
             //        Delete.Enabled = false;
             //        Reset();

             //    }

             //    if (con.State == ConnectionState.Open)
             //    {
             //        con.Close();
             //    }

             }
            catch (Exception ex)
          {
               MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
             //
             }
         }
        private void Delete_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Do you really want to delete the records?", "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
            {
                delete_records();
            }
        }

        private void NewRecord_Click(object sender, EventArgs e)
        {
            Reset();
            //cmbSubjectCode.Enabled = true;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //this.Hide();

            //frmMarksRecord2 frm = new frmMarksRecord2();
            //frm.lblUser.Text = lblUser.Text;
            //frm.lblUserType.Text = lblUserType.Text;
            //frm.Set.Text = "Marks Entry";
            //frm.Show();
            ///*this.Hide();
            //frmScorecard frm = new frmScorecard();
            //frm.Show();*/
        }

        private void cmbSubjectCode_SelectedIndexChanged_1(object sender, EventArgs e)
        {
            //try
            //{
            //    con = new SqlConnection(cs.DBcon);

            //    con.Open();
            //    cmd = con.CreateCommand();

            //    cmd.CommandText = "SELECT SubjectName FROM Subject WHERE SubjectCode = '" + cmbSubjectCode.Text + "'";
            //    rdr = cmd.ExecuteReader();

            //    if (rdr.Read())
            //    {

            //        txtSubjectName.Text = rdr.GetString(0).Trim();
            //    }

            //    if ((rdr != null))
            //    {
            //        rdr.Close();
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

        private void frmMarksEntry_FormClosing(object sender, FormClosingEventArgs e)
        {
            //this.Hide();
            //frm_Main_Menu frm = new frm_Main_Menu();
            //frm.UserType.Text = lblUserType.Text;
            //frm.User.Text = lblUser.Text;
            //frm.Show();

        }

        private void txtObtainedMarks_Validated(object sender, EventArgs e)
        {
            //int val1 = 0;
            //int val2 = 0;
        
            //int.TryParse(txtMaxMarks.Text, out val1);
            //int.TryParse(txtObtainedMarks.Text, out val2);
         
            //if (val2 > val1)
            //{
            //    MessageBox.Show("Obtained Marks can not be Greater than to Maximum Marks", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //    txtObtainedMarks.Focus();
            //}
        }
        }
    }

