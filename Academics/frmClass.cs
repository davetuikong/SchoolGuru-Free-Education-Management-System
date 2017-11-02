using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using  Npgsql;

namespace SchoolGuru 
{

    public partial class frmClass : Form
    {
        
        DataTable dt = new DataTable();
        
        clsFunc cf = new clsFunc();
        string st1;
        string st2;
        public frmClass()
        {
            InitializeComponent();
        }

        private void Frmsection_Load(object sender, EventArgs e)
        {
            FillSections();
            GetData();
        }

        public void FillSections()
        {
            try
            {

                
              
                SQLConn.ConnOpen();
                SQLConn.sqL = "SELECT distinct sectionname FROM section ";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);

                SQLConn.dr = SQLConn.cmd.ExecuteReader();

                while (SQLConn.dr.Read())
                {
                    cmbSection.Items.Add(SQLConn.dr[0]);
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
            try
            {

                SQLConn.ConnOpen();
          
                SQLConn.sqL = "select classname , section from sclass where classname='" + txtClass.Text + "' and section='" + cmbSection.Text + "'";

                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);

                SQLConn.dr = SQLConn.cmd.ExecuteReader();

                if (SQLConn.dr.Read())
                {
                    MessageBox.Show("Record Already Exists", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtClass.Text = "";
                    Reset();
                    txtClass.Focus();

                    if ((SQLConn.dr != null))
                    {
                        SQLConn.dr.Close();
                    }
                    return;
                }

          

                SQLConn.sqL = "insert into sclass(classname,section) VALUES ('" + txtClass.Text + "','" + cmbSection.Text + "')";

                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn );

                SQLConn.cmd.ExecuteReader();
             
                GetData();
        
                st2 = "Added the New Class='" + txtClass.Text + "'";
                //  cf.LogFunc(st1, System.DateTime.Now, st2);
                MessageBox.Show("Successfully saved", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);

                btnSave.Enabled = false;

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
        public void GetData()
        {
            try
            {

                SQLConn.ConnOpen();
                SQLConn.sqL = "SELECT sclass.id, sclass.classname,section from sclass order by classname , section";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);
                DataTable dt = new DataTable();
                SQLConn.da.Fill(dt);
                DataGridView1.DataSource = dt;
         
                



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

        private void cmbSection_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void Reset()
        {
        
        
            cmbSection.SelectedIndex = -1;
            txtClass.Text = "";
            btnSave.Enabled = true;
            btnDelete.Enabled = false;
            btnUpdate.Enabled = false;
        }
        private void delete_records()
        {

            try
            {


                int RowsAffected = 0;


                SQLConn.ConnOpen();
                SQLConn.sqL = "select classid from coursefee where classid=@find";


                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);


                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@find", "classid"));


                SQLConn.cmd.Parameters["@find"].Value = GroupBox1.Tag;


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

                SQLConn.ConnOpen();
                SQLConn.sqL = "delete from class  where id='" + GroupBox1.Tag + "'";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL);

                RowsAffected = SQLConn.cmd.ExecuteNonQuery();
                SQLConn.ConnClose();

                if (RowsAffected > 0)
                {
                    MessageBox.Show("Successfully deleted", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
            
                    st2 = "Deleted the Class='" + txtClass.Text + "'";
                    cf.LogFunc(st1, System.DateTime.Now, st2);
                    Reset();
                }
                else
                {
                    MessageBox.Show("No Record found", "Sorry", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Reset();
                }
          


                GetData();
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


        private void btnDelete_Click(object sender, EventArgs e)
        {
            delete_records();
        }


        private void btnNew_Click(object sender, EventArgs e)
        {
            Reset();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {


                SQLConn.ConnOpen();
                SQLConn.sqL = "Update class set classname= '" + txtClass.Text.Trim() + "', section= '" + cmbSection.Text.Trim() + "' where id='" + GroupBox1.Tag + "'";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
               
                SQLConn.cmd.ExecuteReader();
                SQLConn.ConnClose();



                GetData();  //  1 table update karna h to yha tak ka code hata de
                MessageBox.Show("Successfully updated", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
            
                st2 = "Updated the class='" + txtClass.Text + "'";
                cf.LogFunc(st1, System.DateTime.Now, st2);
                btnUpdate.Enabled = false;

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

        private void DataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow dr = DataGridView1.SelectedRows[0];
                GroupBox1.Tag = dr.Cells["id"].Value.ToString();
                txtClass.Text = dr.Cells["classname"].Value.ToString();
                cmbSection.Text = dr.Cells["sectionname"].Value.ToString();

                btnUpdate.Enabled = true; //ye button item select karne pe dikhe
                btnSave.Enabled = false;
                btnDelete.Enabled = true;                            //ye hide ho jaye kyu ki grid view se data laye he update k liye save ke lie nhi 
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

        private void cmbSection_SelectedIndexChanged_1(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

    }
}




