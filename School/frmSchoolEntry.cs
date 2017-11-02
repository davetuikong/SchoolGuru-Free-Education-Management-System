using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using Npgsql;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SchoolGuru
{
    public partial class frmSchoolEntry : Form
    {


        School sch = new School();
        
        clsFunc cf = new clsFunc();

        string st2;
        public frmSchoolEntry()
        {
            InitializeComponent();
      
        }


        private void School_Entry_Load(object sender, EventArgs e)
        {


    
            this.cmbSchool.SelectedIndexChanged -= new System.EventHandler(this.cmbSchool_SelectedIndexChanged);
            sch.FillComboSchool(cmbSchool);
            this.cmbSchool.SelectedIndexChanged += new System.EventHandler(this.cmbSchool_SelectedIndexChanged);
            SchoolList();

            if (DGV.Rows.Count > 0)
            {
                DGV.Rows[0].Selected = true;

                DataGridViewRow dr = DGV.SelectedRows[0];

                SchoolData(dr);
            }

            enableUpdate();
         
        }
      
        private void ResetAll() {

            cmbSchool.SelectedValue = -1; ;
            txtAddress.Text = null;
            txtPhone.Text = null;
        
            cmbEmail.Text = null;
            txtWeb.Text = null;
            enableSave();
           
   
        }

     private void   enableSave() {

         btnSave.Enabled = true;
         btbDelete.Enabled = false;
         btnUpdate.Enabled = false;

        }

     private void enableUpdate()
     {

         btnSave.Enabled = false;
         btbDelete.Enabled = true;
         btnUpdate.Enabled = true;
      


     }
        


        private void SchoolList()
        {
            try
            {

                SQLConn.ConnOpen();
                SQLConn.sqL = " SELECT id, schoolname, address, phone, email, fax, website FROM school";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);

                DataTable dt = new DataTable();

                SQLConn.da.Fill(dt);



                DGV.DataSource=dt;

            }

            catch (NpgsqlException ex)
            {
                MessageBox.Show(this, ex.Message);
            }
        }


        private void AddSchool()
        {
           
            try {
               
                    SQLConn.ConnOpen();
                    SQLConn.sqL = "insert into school(schoolname,address,phone,email,website) values (@schoolname,@address,@phone,@email,@website)";
                    SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
           
               
                    SQLConn.cmd.Parameters.AddWithValue("@schoolname", cmbSchool.Text);
                    SQLConn.cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                    SQLConn.cmd.Parameters.AddWithValue("@phone", txtPhone.Text);
    
                    SQLConn.cmd.Parameters.AddWithValue("@email", cmbEmail.Text);
                    SQLConn.cmd.Parameters.AddWithValue("@website", txtWeb.Text);
                    SQLConn.cmd.ExecuteNonQuery();
              
                    SQLConn.ConnClose();
                    MessageBox.Show("School Information Saved Successfully", "Report Message", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    ResetAll();
           
            }

            catch (Exception ex) {
                MessageBox.Show(this, ex.Message);
            }
        }

       
     

        private void LoadSchool ()
        {
   
            try {
                SQLConn.ConnOpen();
                SQLConn.sqL = "Select id, address,phone,fax,email,website from school where id='" + cmbSchool.SelectedValue  + "'";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL , SQLConn.conn);

                SQLConn.dr = SQLConn.cmd.ExecuteReader();
                if (SQLConn.dr.Read() == true)
                {
                    cmbSchool.SelectedValue= SQLConn.dr["id"].ToString();
                    txtAddress.Text = SQLConn.dr["id"].ToString();
                    txtPhone.Text = SQLConn.dr["phone"].ToString();
   
                    cmbEmail.Text = SQLConn.dr["email"].ToString();
                    txtWeb.Text = SQLConn.dr["website"].ToString();
                    DGV.Focus();
                }

                else
                {
                    ResetAll();
             

                }
            }
            catch (NpgsqlException  ex) {
                MessageBox.Show(ex.ToString());
            }
        }

       


        

        private void DeleteSchool()
        {
            try
            {

                int RowsAffected = 0;

                SQLConn.ConnOpen();
                SQLConn.sqL = "select  from  studentdetail where school=" + cmbSchool.SelectedValue + "";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
         
           


                SQLConn.dr = SQLConn.cmd.ExecuteReader();

                if (SQLConn.dr.Read())
                {
                    MessageBox.Show("Unable to delete. Already in use", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
           


                    if ((SQLConn.dr != null))
                    {
                        SQLConn.dr.Close();
                    }
                    return;
                }
           

         
                SQLConn.sqL = "delete from school where id = '" + cmbSchool.SelectedValue + "'";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);

                RowsAffected = SQLConn.cmd.ExecuteNonQuery();
  

                if (RowsAffected > 0)
                {
                    MessageBox.Show("Successfully deleted", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
                  //  st1 = lblUser.Text;
                    st2 = "Deleted the school'" + cmbSchool.Text + "'";
                   // cf.LogFunc(st1, System.DateTime.Now, st2);
              
                 
             
                }
                else
                {
                    MessageBox.Show("No Record found", "Sorry", MessageBoxButtons.OK, MessageBoxIcon.Information);
               
                }
                SQLConn.ConnClose();
                //GetData();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

       

        private void DataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
              DataGridViewRow dr = DGV.SelectedRows[0];

              SchoolData(dr);
        }


        private void SchoolData(DataGridViewRow dr)
        {

            if (!dr.IsNewRow && dr.Cells["id"].Value != null)
            {
                cmbSchool.Text = dr.Cells["schoolname"].Value.ToString();
                txtAddress.Text = dr.Cells["address"].Value.ToString();
                txtPhone.Text = dr.Cells["phone"].Value.ToString();
                txtWeb.Text = dr.Cells["website"].Value.ToString();
                cmbEmail.Text = dr.Cells["email"].Value.ToString();

                enableUpdate();
            }
            

        }

        private void ValidateEntry(){
           

                if (cmbSchool.Text == "")
                {

                    cmbSchool.BackColor = Color.Red;
                    MessageBox.Show("Please Enter School Name", "Error", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    cmbSchool.BackColor = Color.MidnightBlue;
                    cmbSchool.Focus();
                    return;
                }

                if (txtAddress.Text == "")
                {
                    txtAddress.BackColor = Color.Red;
                    MessageBox.Show("Please Enter School Address", "Error", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txtAddress.BackColor = Color.MidnightBlue;
                    txtAddress.Focus();
                    return;
                }

                if (txtPhone.Text == "")
                {
                    txtPhone.BackColor = Color.Red;
                    MessageBox.Show("Please Enter School Contact Number", "Error", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txtPhone.BackColor = Color.MidnightBlue;
                    txtPhone.Focus();
                    return;
                }

               

                if (cmbEmail.Text == "")
                {
                    cmbEmail.BackColor = Color.Red;
                    MessageBox.Show("Please Enter School Email ID", "Error", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    cmbEmail.BackColor = Color.MidnightBlue;
                    cmbEmail.Focus();
                    return;
                }

                if (txtWeb.Text == "")
                {
                    txtWeb.BackColor = Color.Red;
                    MessageBox.Show("Please Enter School Website", "Error", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txtWeb.BackColor = Color.MidnightBlue;
                    txtWeb.Focus();
                    return;
                }



        }

        private void UpdateSchool()
        {

            try
            {
                SQLConn.ConnOpen();
                SQLConn.sqL = "update school SET schoolname=@schoolname,address=@address, email=@email,website=@website where id= " + cmbSchool.SelectedValue + " ";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);

                SQLConn.cmd.Parameters.AddWithValue("@schoolname", cmbSchool.Text);
                SQLConn.cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                SQLConn.cmd.Parameters.AddWithValue("@phone", txtPhone.Text);
                    SQLConn.cmd.Parameters.AddWithValue("@email", cmbEmail.Text);
                SQLConn.cmd.Parameters.AddWithValue("@website", txtWeb.Text);
                SQLConn.cmd.ExecuteNonQuery();
          
            
                SQLConn.ConnClose();
                MessageBox.Show("School Information Updated Successfully", "Report Message", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }

            catch (Exception ex)
            {
                MessageBox.Show(this, ex.Message);
            }
        }

        private void txtID_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            AddSchool();
            SchoolList();

        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            DeleteSchool();
            ResetAll();
            SchoolList();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            
            
            UpdateSchool();


            SchoolList();
        }

        private void cmbSchool_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (int.Parse(cmbSchool.SelectedValue.ToString()) == -1)
            {
                ResetAll();
                btnSave.Enabled = false;
                return;
              

            }
            LoadSchool();
            enableUpdate();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            ResetAll();
            this.cmbSchool.SelectedIndexChanged -= new System.EventHandler(this.cmbSchool_SelectedIndexChanged);
            cmbSchool.Text = "Add New School";
            this.cmbSchool.SelectedIndexChanged += new System.EventHandler(this.cmbSchool_SelectedIndexChanged);


        }

       
        

    }
}
