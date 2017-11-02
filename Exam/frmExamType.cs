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
    public partial class frmExamType : Form
    {
        
        public frmExamType()
        {
            InitializeComponent();
        }
        public void GetData()
        {
            try
            {
                SQLConn.sqL = "SELECT id, examtypename, description from examtype";

                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);
                DataTable dt = new DataTable();
                SQLConn.da.Fill(dt);
                DataGridView1.DataSource = dt;
            
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {


                SQLConn.ConnClose();
                SQLConn.cmd.Dispose();
            }
        }
        private void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtExamName.Text == "")
                {
                    MessageBox.Show("Please enter Exam name", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtExamName.Focus();
                    return;
                }

                SQLConn.ConnOpen();
                SQLConn.sqL = "select examtypename from examtype where examtypename='" + txtExamName.Text + "'";

                SQLConn.cmd= new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.dr = SQLConn.cmd.ExecuteReader();


                if (SQLConn.dr.Read())
                {
                    MessageBox.Show("Exam Name Already Exists", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtExamName.Text = "";
                    txtExamName.Focus();



                    if ((SQLConn.dr != null))
                    {
                        SQLConn.dr.Close();
                    }
                    return;
                }

               

               SQLConn.sqL = "insert into examtype(examtypename,description) VALUES ('" + txtExamName.Text + "','" + txtDescription.Text + "')";

               SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
              SQLConn.cmd.ExecuteNonQuery();
                GetData();
            
               string  st2 = "Added New Exam '" + txtExamName.Text+ "'";
               // cf.LogFunc(st1, System.DateTime.Now, st2);
                MessageBox.Show("Successfully saved", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);


                btnSave.Enabled = false;

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void frmExamType_Load(object sender, EventArgs e)
        {
            GetData();
        }

        private void NewRecord_Click(object sender, EventArgs e)
        {
         Reset();   
        }
         private void delete_records()
        {

            try
            {

                int RowsAffected = 0;
                SQLConn.ConnOpen();
               SQLConn.sqL= "delete from examtype where id = '" +txtExamName.Tag+ "'";
               SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
  
                SQLConn.cmd.ExecuteNonQuery();
         

                if (RowsAffected > 0)
                {
                    MessageBox.Show("Successfully deleted", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
         
               string      st2 = "Deleted Exam '" +txtExamName.Text+ "'";
                   // cf.LogFunc(st1, System.DateTime.Now, st2);
                    Reset();
                }
                else
                {
                    MessageBox.Show("No Record found", "Sorry", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Reset();
                }
                SQLConn.ConnClose();
                GetData(); 
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void Reset()
        {
      
            txtExamName.Text = "";
            txtDescription.Text = "";
            
            btnSave.Enabled = true;
            Delete.Enabled = false;
            Update_record.Enabled = false;
        }
        private void Update_record_Click(object sender, EventArgs e)
        {
             try
            {


                SQLConn.ConnOpen();
                SQLConn.sqL = "update examtype set examtypename='" + txtExamName.Text + "',description='" +txtDescription.Text + "' where  id='" +txtExamName.Tag  + "'";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.cmd.ExecuteNonQuery();
         
                 GetData();
                MessageBox.Show("Successfully updated", "Exam Details", MessageBoxButtons.OK, MessageBoxIcon.Information);
            //    st1 = lblUser.Text;
              //  st2 = "Updated Exam'" +txtExamName.Text+ "'";
            //    cf.LogFunc(st1, System.DateTime.Now, st2);
               Update_record.Enabled=false;


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
          delete_records();
        }

        private void DataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow dr = DataGridView1.SelectedRows[0];
                txtExamName.Tag = dr.Cells[0].Value.ToString();
                txtExamName.Text = dr.Cells[1].Value.ToString();
             txtDescription.Text = dr.Cells[2].Value.ToString();

                Update_record.Enabled = true; //ye button item select karne pe dikhe
                btnSave.Enabled = false;
                Delete.Enabled = true;                            //ye hide ho jaye kyu ki grid view se data laye he update k liye save ke lie nhi 
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }
        }
    }

