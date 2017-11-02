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
    public partial class frmDepartment : Form
    {

        
        DataTable dtable = new DataTable();
        NpgsqlConnection conn = null;
        NpgsqlCommand cmd = null;
        DataTable dt = new DataTable();
  
        clsFunc cf = new clsFunc();
      
        string st2;
        public frmDepartment()
        {
            InitializeComponent();
        }
        public void LoadDepartments()
        {
            try
            {  
               

                conn = new NpgsqlConnection(SQLConn.DBcon);
                conn.Open();
              
                DataSet ds = new DataSet();
                 DataTable dt = new DataTable();

                 DataGridView1.DataSource = null;
               SQLConn.sqL="SELECT * FROM department order by id";
               
               
                // data adapter making request from our connection
               NpgsqlDataAdapter da = new NpgsqlDataAdapter(SQLConn.sqL, conn);
                     
                         da.Fill(dt);
                
                DataGridView1.DataSource = dt;


                SQLConn.ConnClose();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
               try
            {
                if (txtDepartmentName.Text == "")
                {
                    MessageBox.Show("Please enter department name", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtDepartmentName.Focus();
                    return;
                }
                conn = new NpgsqlConnection(SQLConn.DBcon);
                conn.Open();
                string ct = "select departmentname from department where departmentname='" +txtDepartmentName.Text + "'";

                cmd = new NpgsqlCommand(ct);
                cmd.Connection = conn;
                SQLConn.dr = cmd.ExecuteReader();

                if (SQLConn.dr.Read())
                {
                    MessageBox.Show("Department Name Already Exists", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtDepartmentName.Text = "";
                     txtDepartmentName.Focus();
                   


                   if ((SQLConn.dr != null))
                    {
                        SQLConn.dr.Close();
                    }
                    return;
                }

                conn = new NpgsqlConnection(SQLConn.DBcon);
                conn.Open();

                string cb = "insert into department(departmentname) VALUES ('" +  txtDepartmentName.Text + "')";

                cmd = new NpgsqlCommand(cb);
                cmd.Connection = conn;
                cmd.ExecuteReader();
                conn.Close();
             
                MessageBox.Show("Successfully saved", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
            
                st2 = "Added the New Department'" +txtDepartmentName.Text+ "'";
             //   cf.LogFunc(st1, System.DateTime.Now, st2);
                
                btnSave.Enabled = false;

                LoadDepartments();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void FrmDepartment_Load(object sender, EventArgs e)
        {
            LoadDepartments();
        }

        private void DataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow dr = DataGridView1.SelectedRows[0];
                txtDepartmentName.Tag   = dr.Cells[0].Value.ToString();
                txtDepartmentName.Text = dr.Cells[1].Value.ToString();



                btnUpdate.Enabled = true; //ye button item select karne pe dikhe
                btnSave.Enabled = false;
                btnDelete.Enabled = true;                            //ye hide ho jaye kyu ki grid view se data laye he update k liye save ke lie nhi 
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void DataGridView1_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            string strRowNumber = (e.RowIndex + 1).ToString();
            SizeF size = e.Graphics.MeasureString(strRowNumber, this.Font);
            if (DataGridView1.RowHeadersWidth < Convert.ToInt32((size.Width + 20)))
            {
                DataGridView1.RowHeadersWidth = Convert.ToInt32((size.Width + 20));
            }
            Brush b = SystemBrushes.ControlText;
            e.Graphics.DrawString(strRowNumber, this.Font, b, e.RowBounds.Location.X + 15, e.RowBounds.Location.Y + ((e.RowBounds.Height - size.Height) / 2));
     
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {

            try
            {
                conn = new NpgsqlConnection(SQLConn.DBcon);
                conn.Open();


                string cb2 = "Update department set departmentname= '" + txtDepartmentName.Text + "' where ID = '" + txtDepartmentName.Tag + "'";
                cmd = new NpgsqlCommand(cb2);
                cmd.Connection = conn;
                cmd.ExecuteReader();
                conn.Close();
                LoadDepartments();  //  1 table update karna h to yha tak ka code hata de
                MessageBox.Show("Successfully updated", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
               
                st2 = "Updated the Department'" + txtDepartmentName.Text + "'";
                cf.LogFunc(SQLConn.USERNAME, System.DateTime.Now, st2);
                btnUpdate.Enabled = false;

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void Reset()
        {

            txtDepartmentName.Tag = "";
            txtDepartmentName.Text = "";
            btnSave.Enabled = true;
            btnDelete.Enabled = false;
            btnUpdate.Enabled = false;
        }
        private void delete_records()
        {

            try
            {

                int RowsAffected = 0;
                conn = new NpgsqlConnection(SQLConn.DBcon);
                conn.Open();
                string cq1 = "delete from department where id='" + txtDepartmentName.Tag + "'";
                cmd = new NpgsqlCommand(cq1);
                cmd.Connection = conn;
                RowsAffected = cmd.ExecuteNonQuery();
                conn.Close();

                if (RowsAffected > 0)
                {
                    MessageBox.Show("Successfully deleted", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
               
                    st2 = "Deleted the Department'" + txtDepartmentName.Text + "'";
                    cf.LogFunc(SQLConn.USERNAME, System.DateTime.Now, st2);
                    Reset();
                }
                else
                {
                    MessageBox.Show("No Record found", "Sorry", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Reset();
                }
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
          

                LoadDepartments();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            delete_records(); 
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            Reset();
        }

        private void FrmDepartment_FormClosing(object sender, FormClosingEventArgs e)
        {
           
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        }
    }

