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
    public partial class frmSchoolFeeCharge : Form
    {
        School sch = new School();
        TimeManager Tm = new TimeManager();
        Dictionary<string, double> termcharges=null;

         public frmSchoolFeeCharge()
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


         private bool TermFeeCharge()
         {
           termcharges = sch.ClassTermFee(cmbClass.Text, int.Parse(cmbTerm.SelectedValue.ToString()));


             if (termcharges.Count<=0)
             {
                 MessageBox.Show("Term fees fo this  class no set up. Please visit fees master to add Term Fees ");
                 return false;
             }
       
             int pointX = 20;
             int pointY = 20;
             foreach (KeyValuePair<string, double> charge in termcharges)
             {


                 CheckBox c = new CheckBox();

                 ////  Button c = new Button();
                 c.Text = charge.Key;
                 c.Name =charge.Key;
                 c.Tag= charge.Value;

                 c.Location = new Point(pointX, pointY);
                 grpFeeTypes.Controls.Add(c);
                 pointX += 150;

             }

             return true;




         }



        private void SchoolParameters()
        {

       
            sch.FillComboClass(cmbClass);
            sch.FillComboTerm(cmbTerm);
     
            sch.ResetCombos(this);


        }
      

   private void SearchStudents(bool sname)
        {

        
            try
            {
                SQLConn.ConnOpen();
                SQLConn.sqL = "SELECT admissionno,CONCAT(firstname,  ' '  ,othername) as fullname,status , sclass,section,termname,term, admissiondate,gender,category from studentdetail LEFT JOIN schoolterm on  studentdetail.term=schoolterm.id WHERE 1=1";


            
                    

                    if (int.Parse(cmbTerm.SelectedValue.ToString()) > 0)
                    {

                        SQLConn.sqL += " AND term ='" + cmbTerm.SelectedValue.ToString() + "'";
                    }
                    if (int.Parse(cmbClass.SelectedValue.ToString()) > 0)
                    {

                        SQLConn.sqL += " AND sclass ='" + cmbClass.SelectedValue.ToString() + "'";
                    }

                  
                    
           

                if (sname)
                {

                    if (txtAdmissionNo.Text.Trim() != "") SQLConn.sqL += " AND  admissionno ILike  '%" + txtAdmissionNo.Text.Trim() + "%' or othername ILIKE '%" + txtAdmissionNo.Text.Trim() + "%' or  firstname ILike  '%" + txtAdmissionNo.Text.Trim() + "%' ";

                }

                

                DGV.DataSource = null;



                SQLConn.sqL += "  order by admissionno";



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

            }
        }

       

     
       


        
        


        private void btnSearchName_Click(object sender, EventArgs e)
        {

            Button bt = sender as Button;
            SearchStudents(true);
        }

        private void eEnableCharge()
        {
            foreach (Control c in grpFeeTypes.Controls)
            {
                if (c.GetType().Name == "CheckBox")
                {
                    grpFeeTypes.Controls.Remove(c); 
                }
            }

          
            if (!TermFeeCharge()) return;

            if (int.Parse(cmbClass.SelectedValue.ToString()) > 0 || int.Parse(cmbTerm.SelectedValue.ToString()) > 0)
            {

                btnChargeFee.Enabled = true;
                            }
            else
            {
                btnChargeFee.Enabled = false;

            }




        }

        private void btnSearchSchool_Click(object sender, EventArgs e)
        {
            if (int.Parse(cmbClass.SelectedValue.ToString()) > 0 && int.Parse(cmbTerm.SelectedValue.ToString()) > 0)
            {

                SearchStudents(false);
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

        private void btnChargeFee_Click(object sender, EventArgs e)
        {
            int appp = 0;
            foreach (Control c in grpFeeTypes.Controls)
            {
                if (c.GetType() == typeof(CheckBox))
                {
                    CheckBox C = (CheckBox)c;
         
                    if (C.Checked) appp++;
                }
            }

            MessageBox.Show(appp.ToString());
            if (appp > 0)
            {
                ChargeFees();
          
            }
            else
            {

                MessageBox.Show("Check at least one Feetype to Apply");
             
            }
    
        }

        private void ChargeFees()
        {

            StringCollection sqline= new StringCollection();

            foreach (DataGridViewRow row in DGV.Rows)
            {
                DataGridViewCheckBoxCell c = (DataGridViewCheckBoxCell)row.Cells[0];
                bool state = (bool)c.Value;
                string admno = row.Cells["admissionno"].Value.ToString();
                int term =int.Parse(row.Cells["term"].Value.ToString());
                string sclass = row.Cells["sclass"].Value.ToString();
                 string del="";
                 string ins="";

            if (state == true) 

           del = "DELETE FROM  feecharge where  admissionno='" + admno + "'  and  term=" + term + "      ";

            sqline.Add(del);

          
     

            foreach (KeyValuePair<string, double> charge in termcharges)
            {

                ins = "INSERT INTO feecharge(admissionno, term, sclass, feetype, amount, datein  ) VALUES('" + admno + "', '" + term + " ', '" + sclass + "', '" + charge.Key + "',  '" + charge.Value + "', '" + Tm.NowToString() + "')";
                sqline.Add(ins);
            }

            }

            SQLConn.ConnOpen();
            NpgsqlTransaction tr = (NpgsqlTransaction)SQLConn.conn.BeginTransaction();
            try
            {
                

                for (int i = 0; i <= sqline.Count - 1; i++)
                {

                    NpgsqlCommand cmd = new NpgsqlCommand(sqline[i], SQLConn.conn);
                    cmd.ExecuteNonQuery();
                }


                tr.Commit();
                MessageBox.Show("Fee Charge Applied  for the Selected Term/Class");
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

        private void cmbTerm_SelectedIndexChanged(object sender, EventArgs e)
        {
         
        }

        private void cmbClass_SelectedIndexChanged(object sender, EventArgs e)
        {
  
        }

        


    }
}