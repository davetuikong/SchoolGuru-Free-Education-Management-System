using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Npgsql;
using System.IO;
using System.Security.Cryptography;

namespace SchoolGuru
{
    public partial class frmStaff: Form
    {

        TimeManager tm = new TimeManager();
        
       clsFunc cf = new clsFunc();

        public int staffid;

       string st2;
       School sch = new School();
        public frmStaff()
        {
            InitializeComponent();
            
        }
        
       
     
        private void frmEmployee_Load(object sender, EventArgs e)
        {
            sch.LoadDepartments(cmbDepartment);
      

            if (staffid > 0)
            {
                txtStaffID.Text = staffid.ToString();
                GetStaffDetails();
                enableUpdate();

            }
            else
            {
                enableSave();


            }
            
        }


       private void  enableUpdate() {
          Delete.Enabled = true;
         btnupdate.Enabled = true;
         btnSave.Enabled = false;


        }

       private void enableSave()
       {
           Delete.Enabled = false;
           btnupdate.Enabled = false;
           btnSave.Enabled = true;


       }
        private void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtStaffName.Text == "")
                {
                    MessageBox.Show("Please enter staff name", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtStaffName.Focus();
                    return;
                }
                if (cmbGender.Text == "")
                {
                    MessageBox.Show("Please select gender", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    cmbGender.Focus();
                    return;
                }
               
               
                if (txtPAddress.Text == "")
                {
                    MessageBox.Show("Please enter permanent address", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtPAddress.Focus();
                    return;
                }
                if (txtTAddress.Text == "")
                {
                    MessageBox.Show("Please enter temporary address", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtTAddress.Focus();
                    return;
                }
                if (txtPhoneNo.Text == "")
                {
                    MessageBox.Show("Please enter phone no.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtPhoneNo.Focus();
                    return;
                }
                if (txtMobileNo.Text == "")
                {
                    MessageBox.Show("Please enter mobile no.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtMobileNo.Focus();
                    return;
                }

                if (cmbDepartment.Text == "")
                {
                    MessageBox.Show("Please select department", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    cmbDepartment.Focus();
                    return;
                }
                if (txtQualifications.Text == "")
                {
                    MessageBox.Show("Please enter qualifications", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtQualifications.Focus();
                    return;
                }
                if (txtYOP.Text == "")
                {
                    MessageBox.Show("Please enter year of experience", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtYOP.Focus();
                    return;
                }
                if (txtDesignation.Text == "")
                {
                    MessageBox.Show("Please enter staff designation", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtDesignation.Focus();
                    return;
                }
                if (txtEmail.Text == "")
                {
                    MessageBox.Show("Please enter email", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtEmail.Focus();
                    return;
                }
                if (txtBasicSalary.Text == "")
                {
                    MessageBox.Show("Please enter basic salary", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtBasicSalary.Focus();
                    return;
                }

           

   

                SQLConn.ConnOpen();


               SQLConn.ConnOpen();
               SQLConn.sqL = "INSERT INTO staff (staffname,department,gender,paddress,taddress,phone,mobile,doj,qualification,yop,designation,email,salary,photo,DOB,status)  ";
               SQLConn.sqL += " VALUES  (@staffname,@department,@gender,@paddress,@taddress,@phone,@mobile,@doj,@qualification,@yop,@designation,@email,@salary,@photo,@DOB,@status)";
               SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);

               SQLConn.cmd.Parameters.AddWithValue("@staffname", txtStaffID.Text);
               SQLConn.cmd.Parameters.AddWithValue("@department", cmbDepartment.Text);
               SQLConn.cmd.Parameters.AddWithValue("@gender", cmbGender.Text);

               SQLConn.cmd.Parameters.AddWithValue("@paddress", txtPAddress.Text);
               SQLConn.cmd.Parameters.AddWithValue("@taddress", tm.TimeToString(dtpDOB.Value));
               SQLConn.cmd.Parameters.AddWithValue("@phone",  txtPhoneNo.Text);
               SQLConn.cmd.Parameters.AddWithValue("@mobile",txtMobileNo.Text);
               SQLConn.cmd.Parameters.AddWithValue("@doj", tm.TimeToString(dtpDOJ.Value));
               SQLConn.cmd.Parameters.AddWithValue("@qualification", txtQualifications.Text);
               SQLConn.cmd.Parameters.AddWithValue("@yop", txtYOP.Text);
               SQLConn.cmd.Parameters.AddWithValue("@designation",txtDesignation.Text);
               SQLConn.cmd.Parameters.AddWithValue("@email", txtEmail.Text);
               SQLConn.cmd.Parameters.AddWithValue("@salary", txtBasicSalary.Text);
       
               SQLConn.cmd.Parameters.AddWithValue("@photo", "");

               SQLConn.cmd.Parameters.AddWithValue("@DOB", tm.TimeToString(dtpDOB.Value));
               SQLConn.cmd.Parameters.AddWithValue("@status",cmbstatus.Text);



               SQLConn.cmd.ExecuteNonQuery();


      
                MessageBox.Show("Successfully saved", "staffRecord", MessageBoxButtons.OK, MessageBoxIcon.Information);
           
                st2 = "Added the New Staff'" +txtStaffName.Text+ "'";
               // cf.LogFunc(st1, System.DateTime.Now, st2);

                btnSave.Enabled = false;
              

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

        private void Browse_Click(object sender, EventArgs e)
        {
            var _with1 = openFileDialog1;

            _with1.Filter = ("Images |*.png; *.bmp; *.jpg;*.jpeg; *.gif; *.ico");
            _with1.FilterIndex = 4;

            //Clear the file name
            openFileDialog1.FileName = "";

            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                pictureBox1.Image = Image.FromFile(openFileDialog1.FileName);
            }
        }
        private void clear()
        {
            txtBasicSalary.Text = "";
            cmbDepartment.Text = "";
            txtDesignation.Text = "";
            txtEmail.Text = "";
            cmbGender.Text = "";

            txtMobileNo.Text = "";
            txtPAddress.Text = "";
            txtPhoneNo.Text = "";
            txtQualifications.Text = "";

            cmbstatus.SelectedIndex = -1;
            txtStaffName.Text = "";
            txtTAddress.Text = "";
            txtYOP.Text = "";
  
            txtStaffID.Text = "";
            dtpDOJ.Text = System.DateTime.Today.ToString();
          //  pictureBox1.Image = Properties.Resources.photo;
      
            btnSave.Enabled = true;
            Delete.Enabled = false;
            btnupdate.Enabled = false;
           
        }
        private void Delete_Click(object sender, EventArgs e)
        {
          try
            {

                int RowsAffected = 0;
                SQLConn.ConnOpen();
                SQLConn.sqL = "select StaffID from EmployeePayment where StaffID=@find";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                 SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@find",txtStaffID.Text));


                SQLConn.cmd.Parameters["@find"].Value = txtStaffID.Text;


                SQLConn.dr = SQLConn.cmd.ExecuteReader();

                if (SQLConn.dr.Read())
                {
                    MessageBox.Show("Unable to delete..Already in use", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    clear();

                    
                    if ((SQLConn.dr  != null))
                    {
                        SQLConn.dr.Close();
                    }
                   
                }
               
                SQLConn.sqL  = "select StaffID from Bookissuestaff where id=@find";
               
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@find", txtStaffID.Text));



                 SQLConn.dr =  SQLConn.cmd.ExecuteReader();

                if (SQLConn.dr.Read())
                {
                    MessageBox.Show("Unable to delete..Already in use", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    clear();


                    if ((SQLConn.dr  != null))
                    {
                        SQLConn.dr.Close();
                    }
                    return;
                }
             
                   SQLConn.sqL = "delete from staffwhere StaffID=@DELETE1;";
              SQLConn.cmd= new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@DELETE1", txtStaffID.Text));
           
                RowsAffected = SQLConn.cmd.ExecuteNonQuery();

                if (RowsAffected > 0)
                {
                    MessageBox.Show("Successfully deleted", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
                 
                    st2 = "Deleted the Employee'" + txtStaffName.Text + "' having StaffID='"+txtStaffID.Text+"'";
                 //   cf.LogFunc(st1, System.DateTime.Now, st2);
                    clear();
                }
                else
                {
                    MessageBox.Show("No Record found", "Sorry", MessageBoxButtons.OK, MessageBoxIcon.Information);
                   
                    clear();

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
        
        private void Update_record_Click(object sender, EventArgs e)
        {  
            try
            {

                SQLConn.ConnOpen();

            SQLConn.sqL = "update staffset staffname=@d2,department=@d3,gender=@d4,fathername=@d5,permanentaddress=@d6,temporaryaddress=@d7,phoneno=@d8,mobileno=@d9,dateofjoining=@d10,qualification=@d11,yearofexperience=@d12,designation=@d13,email=@d14,Basicsalary=@d15,picture=@d16,DOB=@d17,mothername=@d19,status=@d18 where staffid=@d1";

           
                 SQLConn.cmd.ExecuteNonQuery();
                SQLConn.ConnClose();

                MessageBox.Show("Successfully Updated", "staffRecord", MessageBoxButtons.OK, MessageBoxIcon.Information);
            

                st2 = "Updated the Staff'" +txtStaffName.Text + "' having StaffID '"+txtStaffID.Text+"'";
           //     cf.LogFunc(st1, System.DateTime.Now, st2);
                btnupdate.Enabled = false;
              
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
            clear();
        }




        private void GetStaffDetails()
        {
            try
            {
                SQLConn.ConnOpen();
                SQLConn.sqL = "select * from staff where id="+staffid+"";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.dr = SQLConn.cmd.ExecuteReader();

                while (SQLConn.dr.Read() == true)
                {

                    txtStaffName.Text = SQLConn.dr["staffname"].ToString();
                    cmbDepartment.Text = SQLConn.dr["department"].ToString();
                    cmbGender.Text = SQLConn.dr["gender"].ToString();
                    // DOB.Text = SQLConn.dr[""[4].ToString();
                    cmbstatus.Text = SQLConn.dr["status"].ToString();
                    //    txtFatherName.Text = SQLConn.dr[""[6].ToString();
                    //    txtmotherName.Text = SQLConn.dr[""[7].ToString();
                    txtPAddress.Text = SQLConn.dr["paddress"].ToString();
                    txtTAddress.Text = SQLConn.dr["taddress"].ToString();
                    txtPhoneNo.Text = SQLConn.dr["phone"].ToString();
                    txtMobileNo.Text = SQLConn.dr["mobile"].ToString();
                    dtpDOJ.Text = SQLConn.dr["doj"].ToString();
                    txtQualifications.Text = SQLConn.dr["qualification"].ToString();
                    txtYOP.Text = SQLConn.dr["yop"].ToString();
                    txtDesignation.Text = SQLConn.dr["designation"].ToString();
                    txtEmail.Text = SQLConn.dr["email"].ToString();
                    txtBasicSalary.Text = SQLConn.dr["salary"].ToString();

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
                SQLConn.ConnClose();
            }
        
        }



      
    }
}
