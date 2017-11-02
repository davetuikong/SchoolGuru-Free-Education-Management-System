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
    public partial class frmSchoolFeeEntry : Form
    {
        TimeManager TM = new TimeManager();
        School sch = new School();
      
      
        clsFunc cf = new clsFunc();
     
        DataTable dt = new DataTable();

        public frmSchoolFeeEntry()
        {
            InitializeComponent();
            FeeSchedule();
            sch.FillComboFeeType(cmbFeeType);
            sch.FillComboTerm(cmbTerm);
            sch.FillComboClass(cmbClass);
            sch.FillComboTerm(cmbTermQuery);
            sch.FillComboClass(cmbClassQuery);
            sch.ResetCombos(this);
        }
        public void FeeSchedule()
        {


            DataGridView1.DataSource = null;
            try
            {
                SQLConn.sqL = "  SELECT amount,termname, schoolterm.id as termid ,feeschedule.id,feetype,sclass from feeschedule  ";
               SQLConn.sqL += " LEFT JOIN   public.schoolterm on feeschedule.term = schoolterm.id  ";
                SQLConn.sqL += "  order by schoolterm.startdate ASC  ";

                Console.WriteLine(SQLConn.sqL);

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
        }




        private bool ValidEntry()
        {

            bool valid = true;
            string msg = "";

            int num;
            if (!int.TryParse(txtAmount.Text, out  num) ||  num<0    ||  txtAmount.Text=="")
            {   
           
                txtAmount.Focus();
                valid = false;
               msg += "Please enter Valid Fee Amount  \n";
             
            }
            if (cmbClass.SelectedValue.ToString() == "-1" || cmbFeeType.SelectedValue.ToString() == "-1" || cmbTerm.SelectedValue.ToString() == "-1")
            {

                 msg +="Please enter Exam Type, Term and Class \n";

                valid = false;
             


            }

           if(!valid) MessageBox.Show(msg, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

            return valid;


        }


        private void btnSave_Click(object sender, EventArgs e)
        {
            if (!ValidEntry()) return;
            
            AddFee();
            FeeSchedule();
            Reset();
          
        }

        private void AddFee()
        {

           
            try
            {

                
                SQLConn.ConnOpen();
                SQLConn.sqL = "select * from feeschedule where term='" + cmbTerm.SelectedValue+ "'  AND sclass= '" + cmbClass.Text + "' AND feetype= '" + cmbFeeType.Text + "' ";
    
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.dr = SQLConn.cmd.ExecuteReader();


                if (SQLConn.dr.Read())
                {
                    MessageBox.Show("Exam Name Already Exists", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    cmbClass.SelectedValue = -1;
                    cmbFeeType.SelectedValue = -1;
                    cmbTerm.SelectedValue = -1;
                    if ((SQLConn.dr != null))
                    {
                        SQLConn.dr.Close();
                    }
                    return;
                }



                SQLConn.sqL = "insert into feeschedule(feetype, sclass, term, amount) VALUES ('" + cmbFeeType.Text + "','" + cmbClass.Text + "', '" +  cmbTerm.SelectedValue + "', '" + txtAmount.Text+ "' )";
                Console.WriteLine(SQLConn.sqL);
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.cmd.ExecuteNonQuery();
              
              

                string st2 = "Added New Fee'" + cmbFeeType.Text + "'  For   '" + cmbTerm.Text + "' ";
                // cf.LogFunc(st1, System.DateTime.Now, st2);
                MessageBox.Show("Successfully saved", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);


                btnSave.Enabled = false;

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
           
        }

     
        private void Reset()
        {
            txtAmount.Text = "";
            btnSave.Enabled = true;
            btnDelete.Enabled = false;
           btnUpdate.Enabled   = false;
           sch.ResetCombos(this);
        }
        private void btnDelete_Click(object sender, EventArgs e)
        {
            delete_records();
        }

        private void delete_records()
        {
            throw new NotImplementedException();
        }
        
        private void Button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            frmBookEntryRecords frm = new frmBookEntryRecords();
   
      
            frm.Show();
        }


        private void btnNew_Click(object sender, EventArgs e)
        {
            Reset();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            UpdateFee();

            FeeSchedule();
                Reset();

        }


        private void UpdateFee()
        {


            if (!ValidEntry()) return;


            try
            {


                SQLConn.ConnOpen();
                SQLConn.sqL = "update feeschedule set term='" +  cmbTerm.SelectedValue + "',feetype='" + cmbFeeType.Text + "' ,amount='"+txtAmount.Text +"'  , sclass='"+cmbClass.Text+"'   where  id='" +txtAmount.Tag+ "'";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.cmd.ExecuteNonQuery();

                MessageBox.Show("Successfully updated", "Exam Details", MessageBoxButtons.OK, MessageBoxIcon.Information);
                //    st1 = lblUser.Text;
                //  st2 = "Updated Exam'" +txtExamName.Text+ "'";
                //    cf.LogFunc(st1, System.DateTime.Now, st2);

                SQLConn.ConnClose();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void DataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
             
                DataGridViewRow row = DataGridView1.SelectedRows[0];
                if (row.IsNewRow) return;
                cmbClass.Text = row.Cells["sclass"].Value.ToString().Trim();
                cmbTerm.SelectedValue = int.Parse(row.Cells["termid"].Value.ToString());
                cmbFeeType.Text = row.Cells["feetype"].Value.ToString();
                txtAmount.Text = row.Cells["amount"].Value.ToString();
                txtAmount.Tag = row.Cells["id"].Value.ToString();
                btnUpdate.Enabled = true;
                btnSave.Enabled = false;
                btnDelete.Enabled = true;
                             
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

    }
}

