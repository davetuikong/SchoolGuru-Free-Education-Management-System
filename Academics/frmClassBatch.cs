using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using Npgsql;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Collections.Specialized;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SchoolGuru
{
    public partial class frmClassBatch : Form
    {
        School sch = new School();
        TimeManager Tm = new TimeManager();
        Dictionary<string, double> termcharges=null;

        public frmClassBatch()
        {
            InitializeComponent();
            this.cmbTerm.SelectedIndexChanged -= new System.EventHandler(this.cmbTerm_SelectedIndexChanged);
            this.cmbClass.SelectedIndexChanged -= new System.EventHandler(this.cmbTerm_SelectedIndexChanged);
            SchoolParameters();

            this.cmbTerm.SelectedIndexChanged += new System.EventHandler(this.cmbTerm_SelectedIndexChanged);
            this.cmbClass.SelectedIndexChanged += new System.EventHandler(this.cmbTerm_SelectedIndexChanged);

    
        }

         private void frmSchoolFeeCharge_Load(object sender, EventArgs e)
        {

           
        }




        private void SchoolParameters()
        {

       
            sch.FillComboClass(cmbClass);
            sch.FillComboTerm(cmbTerm);
            sch.FillComboSection(cmbSection);
            sch.FillComboSection(cmbSectionNext);
    
  
          
            
      //    DataTable dts = SQLConn.dsSchool.Tables["section"].Copy;
     

        

            cmbTermNext.DisplayMember = "termname";
            cmbTermNext.ValueMember = "id";
            DataSet dsTerm= sch.dsSchoolParameter("term");
            cmbTermNext.DataSource = dsTerm.Tables["term"];



 
            cmbClassNext.DisplayMember = "classname";
            cmbClassNext.ValueMember = "id";
            DataSet dsCL = sch.dsSchoolParameter("classection");
            cmbClassNext.DataSource = dsCL.Tables["sclass"]; ;

            sch.ResetCombos(this);
        

        }
      

   private void SearchStudents()
        {

        
            try
            {
                SQLConn.ConnOpen();
                SQLConn.sqL = "SELECT admissionno,CONCAT(firstname,  ' '  ,othername) as fullname,status , classection,termname,term, admissiondate,gender,category from studentdetail LEFT JOIN schoolterm on  studentdetail.term=schoolterm.id WHERE 1=1";


            
                    

                    if (int.Parse(cmbTerm.SelectedValue.ToString()) > 0)
                    {

                        SQLConn.sqL += " AND term ='"+ cmbTerm.SelectedValue.ToString()+"'";
                    }
                    if (int.Parse(cmbClass.SelectedValue.ToString()) > 0)
                    {

                        SQLConn.sqL += " AND classection ='"+cmbClass.Text+"'";
                    }

                    if (int.Parse(cmbSection.SelectedValue.ToString()) > 0)
                    {

                        SQLConn.sqL += " AND section ='"+cmbSection.Text+"'";
                    }

                    SQLConn.sqL += "  order by admissionno ";


                    Console.WriteLine(SQLConn.sqL);

                

                DGV.DataSource = null;



      



                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);

                SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);
                DataTable dt = new DataTable();


                SQLConn.da.Fill(dt);
                DGV.DataSource = dt;
               

   
                SQLConn.ConnClose();

            }
            catch (NpgsqlException ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                SQLConn.cmd.Dispose();
                SQLConn.ConnClose();
            }
        }

       

     
       


        
        


        private void btnSearchName_Click(object sender, EventArgs e)
        {

            Button bt = sender as Button;
            SearchStudents();
        }

        private void eEnableCharge()
        {
            

          
  

            if (int.Parse(cmbClass.SelectedValue.ToString()) > 0 || int.Parse(cmbTerm.SelectedValue.ToString()) > 0)
            {

                btnMoveClass.Enabled = true;
                            }
            else
            {
                btnMoveClass.Enabled = false;

            }




        }

        private void btnSearchSchool_Click(object sender, EventArgs e)
        {
            if (int.Parse(cmbClass.SelectedValue.ToString()) > 0 && int.Parse(cmbTerm.SelectedValue.ToString()) > 0)
            {

                SearchStudents();
                eEnableCharge();

            }

            else
            {

                MessageBox.Show("Select Both Term and Class to Apply Fee charge");

            }
        }


        private void DataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow dr = DGV.SelectedRows[0];

                if (!dr.IsNewRow && dr.Cells["admissionno"].Value != null)
                {
                frmStudentEnrollment frm = new frmStudentEnrollment();
                string admmino = dr.Cells["admissionno"].Value.ToString();    
                frm.admno = admmino;
                frm.adding = false;
        
                frm.Show();

                    
            }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void txtAdmissionNo_TextChanged(object sender, EventArgs e)
        {

        }

        private void chkSelectAll_CheckedChanged(object sender, EventArgs e)
        {
            bool state = false;
            if (chkAll.Checked)
            {
                state = true;
             
            }
            int r = DGV.Rows.Count;
            foreach (DataGridViewRow row in DGV.Rows)
            {
                DataGridViewCheckBoxCell c = (DataGridViewCheckBoxCell)row.Cells[0];
                c.Value =state;

            }
        }

   

        private void MoveClass()
        {

            StringCollection sqline= new StringCollection();

            foreach (DataGridViewRow row in DGV.Rows)
            {
                DataGridViewCheckBoxCell c = (DataGridViewCheckBoxCell)row.Cells[0];
                bool state = (bool)c.Value;
                string admno = row.Cells["admissionno"].Value.ToString();
                int term =int.Parse( cmbTermNext.SelectedValue.ToString());
                string sclass = cmbClassNext.SelectedValue.ToString();
         
                string up = "";

                if (state == true)
                {


               

                        up = "update studentdetail set term= " + term + ", sclass='" + sclass + "' WHERE   admissionno= '" + admno + "'";
                        sqline.Add(up);
                   

                }

                SQLConn.ConnOpen();
                NpgsqlTransaction tr = (NpgsqlTransaction)SQLConn.conn.BeginTransaction();
                try
                {


                    for (int i = 0; i <= sqline.Count - 1; i++)
                    {
                        Console.WriteLine(sqline[i]);
                        NpgsqlCommand cmd = new NpgsqlCommand(sqline[i], SQLConn.conn);
                        cmd.ExecuteNonQuery();
                    }


                    tr.Commit();
                    MessageBox.Show("Class Batch Action Complete");
                    SQLConn.ConnClose();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString());


                    // Attempt to roll back the transaction.
                    try
                    {
                        tr.Rollback();
                    }
                    catch (Exception ex2)
                    {
                        MessageBox.Show(ex2.ToString());
                    }
                }
            }

        }

        private void cmbTerm_SelectedIndexChanged(object sender, EventArgs e)
        {
         
        }

        private void cmbClass_SelectedIndexChanged(object sender, EventArgs e)
        {
  
        }

        private void btnMoveClass_Click(object sender, EventArgs e)
        {

           int sel = 0;

            foreach (Control c in this.Controls)
            {
                if (c.GetType().Name == "ComboBox")
                {
                    ComboBox Cb = (ComboBox)c;
                    if (Cb.SelectedValue.ToString() == "-1") 
                    {
                        sel++;
                    }
                }
            }

            if (sel==0)
            {
                MoveClass();
                SearchStudents();
                chkAll.Checked = false;
            }
            else MessageBox.Show("All Parameters Requred", "Parameters");
        }

        


    }
}