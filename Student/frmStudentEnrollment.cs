using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using Npgsql;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SchoolGuru
{
    public partial class frmStudentEnrollment : Form
    {
        School sch = new School();
        TimeManager TM = new TimeManager();
        public bool adding;
         public  string admno;
       
        public frmStudentEnrollment()
           
        {
            InitializeComponent();

             SchoolParameters();
          
    
     
        
           

        }

        public void enableAdd()
        {
            grpSchoolDetail.Enabled = false;
            btnUpdate.Enabled = false;
            btnSaveSchool.Enabled = false;
            btnSaveDetails.Enabled = true;

        }
        public void enableUpdate()
        {

            grpSchoolDetail.Enabled = true;
            btnSaveSchool.Enabled = true;
            btnUpdate.Enabled = true;
            btnSaveDetails.Enabled = false;

        }

        private void frmStudentEnrollment_Load(object sender, EventArgs e)
        {
            if (adding) enableAdd();
          if (admno != "" && adding == false)
            {
                txtAdmNo.Text = admno;
                enableUpdate();


            }
    
     


        }

        private void SchoolParameters()
        {


            sch.FillComboClass(cmbClass);
            sch.FillComboTerm(cmbTerm);
            sch.FillComboSection(cmbSection);
            sch.FillComboStatus(cmbStatus);
           sch.FillComboStudentCategory(cmbCategory);
            sch.FillComboSchool(cmbSchool);
            sch.ResetCombos(this);

        }
               
        private void txtPhone_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsDigit(e.KeyChar) || char.IsControl(e.KeyChar))
            {
                e.Handled = false;
            }
            else
            {
                e.Handled = true;
            }
        }
     

  

        private void btn_Update_Click(object sender, EventArgs e)
        {
            UpdateDetails();
            GetStudentDetails(txtAdmNo.Text);
        }

    



        private void ResetAll() {
            adding = true;

            cmbSchool.SelectedValue = -1;
         
            txtAdmNo.Text = "";
     
            fname.Text = "";
     
            sname.Text = "";
   
            gendCombo.Text = "";
       
            reCombo.Text = "";
            txtFather.Text = "";
  
            txtMother.Text = "";
  
            txtGuardian.Text = "";
      
            txtOrganization.Text = "";

      
            txtAddress.Text="";
     
            txtPhone.Text = "";
      
            cmbClass.Text = "";
            cmbSection.Text = "";
            sponCombo.Text = "";
            dtpDOB.Text = "";
            cmbTerm.Text = "";
            cmbCategory.Text = "";
            nationCombo.Text = "";
            txtEmail.Text = "";
     
            cmbCounty.Text = "";
            btnUpdate.Enabled = false;
            btnDel.Enabled = false;
            grpSchoolDetail.Enabled = false;
            btnSaveSchool.Enabled = true;
            sch.ResetCombos(this);

        }

        private void ValidEntry()
        {

            if (txtAdmNo.Text == "")
            {
                MessageBox.Show("Please Enter Admission Number", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtAdmNo.Focus();
                return;
            }
            if (fname.Text == "")
            {
                MessageBox.Show("Please Enter First Name", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                fname.Focus();
                return;
            }

            if (sname.Text == "")
            {
                MessageBox.Show("Please Enter Surname", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                sname.Focus();
                return;
            }

            if (gendCombo.Text == "")
            {
                MessageBox.Show("Please Select Gender", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                gendCombo.Focus();
                return;
            }

            if (txtEmail.Text == "")
            {
                MessageBox.Show("Please Enter Current Email Address", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtEmail.Focus();
                return;
            }

            if (reCombo.Text == "")
            {
                MessageBox.Show("Please Select Religion", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                reCombo.Focus();
                return;
            }




            if (sponCombo.Text == "")
            {
                MessageBox.Show("Please Select Sponsor", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                sponCombo.Focus();
                return;
            }

            if ((sponCombo.Text == "Father") && (txtFather.Text == ""))
            {
                MessageBox.Show("Please Enter Father's Name", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtFather.Focus();
                return;
            }

            if ((sponCombo.Text == "Mother") && (txtMother.Text == ""))
            {
                MessageBox.Show("Please Enter Mother's Name", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtMother.Focus();
                return;
            }

            if ((sponCombo.Text == "Guardian") && (txtGuardian.Text == ""))
            {
                MessageBox.Show("Please Enter Guardian's Name", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtGuardian.Focus();
                return;
            }

            if (sponCombo.Text == "Both Parents")
            {

                if (txtFather.Text == "")
                {
                    MessageBox.Show("Please Enter Father's Name", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtFather.Focus();
                    return;
                }

                if (txtMother.Text == "")
                {
                    MessageBox.Show("Please Enter Mother's Name", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtMother.Focus();
                    return;
                }

            }

            if ((sponCombo.Text == "Organization") && (txtOrganization.Text == ""))
            {
                MessageBox.Show("Please Enter Organization's Name", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtOrganization.Focus();
                return;
            }

           

        }


        private void ValidateSchool()
        {
    


            if (int.Parse(cmbSchool.SelectedValue.ToString()) == -1)
            {
                MessageBox.Show("Please Enter School Name", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            
                return;
            }

            if (int.Parse(cmbCategory.SelectedValue.ToString()) ==-1)
            {
                MessageBox.Show("Please Select Category", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                cmbCategory.Focus();
                return;
            }


            if (int.Parse(cmbClass.SelectedValue.ToString()) == -1)
            {
                MessageBox.Show("Please Select Current Class", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                cmbClass.Focus();
                return;
            }

            if (int.Parse(cmbTerm.SelectedValue.ToString()) == -1)
            {
                MessageBox.Show("Please Select Current Term", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                cmbTerm.Focus();
                return;
            }

            if (int.Parse(cmbSection.SelectedValue.ToString()) == -1)
            {
                MessageBox.Show("Please Select Current Section", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                cmbSection.Focus();
                return;
            }



        }
        private void SaveDetails() {

            ValidEntry();
           try {



               SQLConn.ConnOpen();
                SQLConn.sqL = "INSERT INTO studentdetail (admissionno,admissiondate,gender,firstname,othername,dob,email,religion,nationality,county,photo,sponsor,father,mother,guardian,organization,address,phone, status)  ";
                SQLConn.sqL+= " VALUES  (@admissionno,@admissiondate,@gender,@firstname,@othername, @dob,@email,@religion,@nationality,@county,@photo,@sponsor,@father,@mother,@guardian,@organization,@address,@phone, @status)";
              SQLConn.cmd= new NpgsqlCommand(SQLConn.sqL,SQLConn.conn);

              SQLConn.cmd.Parameters.AddWithValue("@admissionno", txtAdmNo.Text);
              SQLConn.cmd.Parameters.AddWithValue("@admissiondate", TM.TimeToString(  dtpAdmissionDate.Value));
              SQLConn.cmd.Parameters.AddWithValue("@gender", gendCombo.Text);
              SQLConn.cmd.Parameters.AddWithValue("@firstname", fname.Text);

                SQLConn.cmd.Parameters.AddWithValue("@othername",sname.Text );
                SQLConn.cmd.Parameters.AddWithValue("@dob",TM.TimeToString(dtpDOB.Value) );
                SQLConn.cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                SQLConn.cmd.Parameters.AddWithValue("@religion", reCombo.Text);
                SQLConn.cmd.Parameters.AddWithValue("@nationality",nationCombo.Text );
                SQLConn.cmd.Parameters.AddWithValue("@county", cmbCounty.Text);
                SQLConn.cmd.Parameters.AddWithValue("@phone",txtPhone.Text);
                SQLConn.cmd.Parameters.AddWithValue("@mother", txtMother.Text);
                SQLConn.cmd.Parameters.AddWithValue("@father", txtFather.Text );
               SQLConn.cmd.Parameters.AddWithValue("@guardian", txtGuardian.Text);
                SQLConn.cmd.Parameters.AddWithValue("@organization", txtOrganization.Text);
                SQLConn.cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                SQLConn.cmd.Parameters.AddWithValue("@sponsor", sponCombo.Text);
                SQLConn.cmd.Parameters.AddWithValue("@photo", "");
                SQLConn.cmd.Parameters.AddWithValue("@status", "1");



                SQLConn.cmd.ExecuteNonQuery();

                MessageBox.Show(" " + fname.Text + " " + sname.Text + " 's" + " " + "Records saved successfully", "Data Saved!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                enableUpdate();

                SQLConn.ConnClose();


           }
           catch (NpgsqlException ex)
           {
               MessageBox.Show("Data not Saved", ex.Message);
           }
        }

        private void UpdateDetails() {

            try
            {
                SQLConn.ConnOpen();
                SQLConn.sqL = "update studentdetail set admissiondate=@admissiondate,gender=@gender,firstname=@firstname, othername=@othername,dob=@dob, email=@email,religion=@religion,nationality=@nationality,county=@county,photo=@photo,sponsor=@sponsor,father=@father,mother=@mother,guardian=@guardian,organization=@organization,address=@address,phone=@phone where admissionno=@admissionno";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.cmd.Parameters.AddWithValue("@admissionno", txtAdmNo.Text);
                SQLConn.cmd.Parameters.AddWithValue("@admissiondate", TM.TimeToString(dtpAdmissionDate.Value));
                SQLConn.cmd.Parameters.AddWithValue("@gender", gendCombo.Text);
                SQLConn.cmd.Parameters.AddWithValue("@firstname", fname.Text);
                SQLConn.cmd.Parameters.AddWithValue("@firstname", sname.Text);
                SQLConn.cmd.Parameters.AddWithValue("@othername", sname.Text);
                SQLConn.cmd.Parameters.AddWithValue("@dob", TM.TimeToString(dtpDOB.Value));
                SQLConn.cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                SQLConn.cmd.Parameters.AddWithValue("@religion", reCombo.Text);
                SQLConn.cmd.Parameters.AddWithValue("@nationality", nationCombo.Text);
                SQLConn.cmd.Parameters.AddWithValue("@county", cmbCounty.Text);
                SQLConn.cmd.Parameters.AddWithValue("@phone", txtPhone.Text);
                SQLConn.cmd.Parameters.AddWithValue("@mother", txtMother.Text);
                SQLConn.cmd.Parameters.AddWithValue("@father", txtFather.Text);
                SQLConn.cmd.Parameters.AddWithValue("@photo", "");
                SQLConn.cmd.Parameters.AddWithValue("@guardian", txtGuardian.Text);
                SQLConn.cmd.Parameters.AddWithValue("@organization", txtOrganization.Text);
                SQLConn.cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                SQLConn.cmd.Parameters.AddWithValue("@sponsor", sponCombo.Text);



      
                SQLConn.cmd.ExecuteNonQuery();

                MessageBox.Show(" " + fname.Text + " " + sname.Text + " 's" + " " + "Records Updated Successfully", "Data Saved!", MessageBoxButtons.OK, MessageBoxIcon.Information);
                enableUpdate();
               

                SQLConn.ConnClose();

            }
            catch (NpgsqlException ex)
            {
                MessageBox.Show(ex.ToString());


            }
            finally
            {
                SQLConn.cmd.Dispose();


            }

        }

        private void DeleteStudent(){
            int rowcount;
            try
            {
                SQLConn.ConnOpen();
                SQLConn.sqL = "delete from StudentsDetails where AdmissionNo = '" + txtAdmNo.Text + "'";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                rowcount = SQLConn.cmd.ExecuteNonQuery();

                if (rowcount > 0)
                {
                    MessageBox.Show(fname.Text + " " + sname.Text + " 's" + " " + "Records Deleted successfully", "Records Deleted", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    ResetAll();
                }
            }

            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }   
        }
        
        private void btn_Del_Click(object sender, EventArgs e)
        {
            DeleteStudent();
        }


        private void btnSaveDetails_Click(object sender, EventArgs e)
        {
            ValidEntry();
            this.adding = false;
            SaveDetails();
            GetStudentDetails(txtAdmNo.Text.Trim());
            enableUpdate();

        }

        private void btnSaveSchool_Click(object sender, EventArgs e)
        {
            ValidateSchool();
            SaveSchoolDetails();

            this.adding = false;
            GetStudentDetails(txtAdmNo.Text.Trim());
            this.Refresh();

        }


        private void txtAdmno_TextChanged(object sender, EventArgs e)
        {
            txtAdmNo.BackColor = Color.LightGray;
            GetStudentDetails(txtAdmNo.Text);
        }

        private void fname_TextChanged(object sender, EventArgs e)
        {
            fname.BackColor = Color.LightGray;
        }

        private void sname_TextChanged(object sender, EventArgs e)
        {
            sname.BackColor = Color.LightGray;
        }

        private void txtEmail_TextChanged(object sender, EventArgs e)
        {
            txtEmail.BackColor = Color.LightGray;
        }

        private void txtFather_TextChanged(object sender, EventArgs e)
        {
            txtFather.BackColor = Color.LightGray;
        }

        private void txtMother_TextChanged(object sender, EventArgs e)
        {
            txtMother.BackColor = Color.LightGray;
        }

        private void txtGuardian_TextChanged(object sender, EventArgs e)
        {
            txtGuardian.BackColor = Color.LightGray;
        }

        private void txtOrganization_TextChanged(object sender, EventArgs e)
        {
            txtOrganization.BackColor = Color.LightGray;
        }

       

        private void txtAddress_TextChanged(object sender, EventArgs e)
        {
            txtAddress.BackColor = Color.LightGray;
        }

        private void txtPhone_TextChanged(object sender, EventArgs e)
        {
            txtPhone.BackColor = Color.LightGray;
        }



        private void btn_GetData_Click(object sender, EventArgs e)
        {
            //this.Hide();
            frmStudentRecords stdSearch = new frmStudentRecords();
            stdSearch.Show();
        }

      

        private void GetStudentDetails(string admission) {

            try
            {
                SQLConn.ConnOpen();
                SQLConn.sqL = "select admissionno,admissiondate,gender,firstname,othername,dob,email,religion,nationality,county,photo,sponsor,father,mother,guardian,organization,address,phone,status,category,sclass,section,term,school from studentdetail where admissionno='" +admission+ "'";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.dr = SQLConn.cmd.ExecuteReader();

     
    
            
                while (SQLConn.dr.Read() == true)
                {
                  //  
                    txtAdmNo.Text = SQLConn.dr["admissionno"].ToString();
    
       
                    gendCombo.Text =SQLConn.dr["gender"].ToString() ;
                    fname.Text = SQLConn.dr["firstname"].ToString();
                             dtpAdmissionDate.Value = Convert.ToDateTime(SQLConn.dr["admissiondate"].ToString());
                    sname.Text = SQLConn.dr["othername"].ToString();
                    dtpDOB.Text =SQLConn.dr["dob"].ToString();
                    txtEmail.Text = SQLConn.dr["email"].ToString();
                    reCombo.Text = SQLConn.dr["religion"].ToString();
                    nationCombo.Text = SQLConn.dr["nationality"].ToString();          
                    //pictureBox1.Image = SQLCONN.rdr.GetByte(10).ToString();
                    sponCombo.Text = SQLConn.dr["sponsor"].ToString();
                    txtFather.Text = SQLConn.dr["father"].ToString();
                    txtMother.Text = SQLConn.dr["mother"].ToString();
                    txtGuardian.Text = SQLConn.dr["guardian"].ToString();
                    txtOrganization.Text = SQLConn.dr["organization"].ToString();
             
                    txtAddress.Text = SQLConn.dr["address"].ToString();
                    txtPhone.Text = SQLConn.dr["phone"].ToString();
                  
                    cmbSchool.SelectedValue = SQLConn.dr["school"].ToString();
                    cmbCategory.Text= SQLConn.dr["category"].ToString();

                    cmbStatus.SelectedValue = SQLConn.dr["status"].ToString();
                    cmbClass.Text = SQLConn.dr["sclass"].ToString();
                    cmbSection.Text = SQLConn.dr["section"].ToString();
                    cmbTerm.SelectedValue = SQLConn.dr["term"].ToString();
           
                    btnSaveSchool.BackColor = Color.ForestGreen;
   
                }
                
               
                if (SQLConn.dr != null)
                {
                    SQLConn.dr.Close();
                }
                SQLConn.ConnClose();
            }
            catch (NpgsqlException ex) {
               MessageBox.Show(ex.Message);
             
            }

            finally
            {

                SQLConn.cmd.Dispose();

            }
            
        }


        private void SaveSchoolDetails()
        {

            try
            {
                SQLConn.ConnOpen();
                SQLConn.sqL = "Update studentdetail set school= @school,category= @category,sclass= @sclass,section= @section,term= @term, status= @status  WHERE admissionno='" + txtAdmNo.Text + "'";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.cmd.Parameters.AddWithValue("@school", cmbSchool.SelectedValue.ToString());
                SQLConn.cmd.Parameters.AddWithValue("@category", cmbCategory.Text);
                SQLConn.cmd.Parameters.AddWithValue("@sclass", cmbClass.Text);
                SQLConn.cmd.Parameters.AddWithValue("@section", cmbSection.Text);
                SQLConn.cmd.Parameters.AddWithValue("@term", cmbTerm.SelectedValue.ToString());
                SQLConn.cmd.Parameters.AddWithValue("@status", cmbStatus.SelectedValue.ToString());
                SQLConn.cmd.ExecuteNonQuery();
                MessageBox.Show(" " + fname.Text + " " + sname.Text + " 's" + " " + "Records saved successfully", "Data Saved!", MessageBoxButtons.OK, MessageBoxIcon.Information);
                SQLConn.ConnClose();
            }

            catch (NpgsqlException ex)
            {
                MessageBox.Show(ex.ToString());


            }
            finally
            {
                SQLConn.cmd.Dispose();
            }

        }




       
        private void resetSuggest()
        {
            lstStudents.Visible = false;
            txtSearch.Text = "";
        }



        private void MoveUp()
        {
            int cnt = lstStudents.Items.Count;

            if (cnt > 0)
            {
                if (lstStudents.SelectedItems.Count == 0) lstStudents.Items[0].Selected = true;
                int sel = lstStudents.SelectedIndices[0];
                if (sel == 0) lstStudents.Items[0].Selected = true;
                if (sel == 0)
                {
                    return;
                }
                else
                {
                    lstStudents.SelectedItems.Clear();
                    lstStudents.Items[sel - 1].Selected = true;
                    sel = 0;


                }
            }



        }

        private void MoveDown()
        {
            int cnt = lstStudents.Items.Count;



            if (cnt > 0)
            {
                if (lstStudents.SelectedItems.Count == 0) lstStudents.Items[0].Selected = true;
                int sel = lstStudents.SelectedIndices[0];

                if (sel == 0) lstStudents.Items[0].Selected = true;
                if (sel == cnt - 1)
                {

                    return;

                }


                else
                {
                    lstStudents.SelectedItems.Clear();
                    if (sel + 1 <= cnt - 1) lstStudents.Items[sel + 1].Selected = true;
                    sel = 0;

                }

            }



        }

        private void txtStudentSearch_Enter(object sender, EventArgs e)
        {
            txtSearch.ForeColor = Color.Black;
            txtSearch.Text = "";
        }

        private void btnAddNew_Click(object sender, EventArgs e)
        {
            ResetAll();
        }



        private void frmStudentEnrollment_FormClosed(object sender, FormClosedEventArgs e)
        {
            adding = true;
            admno = "";
        }

        private void txtStudentSearch_TextChanged(object sender, EventArgs e)
        {

            txtSearch.ForeColor = System.Drawing.Color.Black;
            if (txtSearch.Text.Trim() == "")
            {
                lstStudents.Visible = false;


            }


            else
            {

                lstStudents.Visible = true;
                lstStudents.BringToFront();
                lstStudents.Select();
                sch.SuggestStudent(lstStudents, txtSearch.Text);

                LSTResize();
            }
            





        }





      private   void LSTResize()
        {
            int lineheight = 15;
            Size maxSize = new Size(316, 150); //Your default maxSize on 15 items
            int currentItems =lstStudents.Items.Count;
    
            int newFormHeight = lineheight * currentItems +50;
            lstStudents.Size = new Size(316, newFormHeight);
        }




        private void lstStudents_MouseClick(object sender, MouseEventArgs e)
        {
            if (lstStudents.SelectedItems.Count == 0) return;
            admno = lstStudents.SelectedItems[0].SubItems[0].Text;
            txtAdmNo.Text = admno;
            enableUpdate();
            resetSuggest();

        }

        private void lstStudents_KeyDown(object sender, System.Windows.Forms.KeyEventArgs e)
        {


            if (lstStudents.Items.Count == 0)
            {
                txtSearch.Text = "";
                return;

            }
            switch (e.KeyCode)
            {
                case Keys.Up:
                    lstStudents.Select();
                    MoveUp();
                    break;
                case Keys.Down:

                    lstStudents.Select();
                    MoveDown();
                    break;
                case Keys.Escape:
                    lstStudents.Visible = false;
                    break;

                case Keys.Enter:

                    txtAdmNo.Text = admno;

                    if (lstStudents.SelectedItems.Count == 0) return;
                    admno = lstStudents.SelectedItems[0].SubItems[0].Text;
                    txtAdmNo.Text = admno;
                    resetSuggest();



                    break;

            }
            e.Handled = true;



        }

       

       
       
      
    }
}
