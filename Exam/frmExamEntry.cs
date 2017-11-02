using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Npgsql;
using System.Diagnostics;
namespace SchoolGuru
{
    public partial class frmExamEntry : Form
    {
        TimeManager TM = new TimeManager();
        School sch = new School();


        public frmExamEntry()
        {
            InitializeComponent();

            DataGridView1.AutoGenerateColumns = false;
            sch.FillComboClass(cmbClass);
            sch.FillComboExamType(cmbExamType);
            sch.FillComboTerm(cmbTerm);
            sch.ResetCombos(this);
         
            
        }


        private void frmExamType_Load(object sender, EventArgs e)
        {
            ListExams();
        }
        public void ListExams()
        {


            DataGridView1.DataSource = null;
            try
            {
              
                SQLConn.sqL = "SELECT exam.id as examid , exam.examname,examtype.examtypename,exam.startdate, exam.enddate, schoolclass, schoolterm.termname   ";
                 SQLConn.sqL += " FROM   public.exam LEFT JOIN public.examtype   on    examtype.id = exam.examtype  ";
                 SQLConn.sqL += "LEFT JOIN   public.schoolterm on schoolterm = schoolterm.id  Where 1=1  ";
                if (int.Parse(cmbExamType.SelectedValue.ToString()) > 0) SQLConn.sqL += " AND  examtype.id = " + cmbExamType.SelectedValue.ToString() + "";
                if (int.Parse(cmbTerm.SelectedValue.ToString()) > 0) SQLConn.sqL += " AND  schoolterm = " + cmbTerm.SelectedValue.ToString() + "";
                if (int.Parse(cmbClass.SelectedValue.ToString()) >0) SQLConn.sqL += " AND schoolclass   = '" + cmbClass.Text + "'";
      
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



      



        private bool ValidEntry()
        {

            bool valid = true;
            if (txtExamName.Text == "")
            {
                MessageBox.Show("Please enter Exam name", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtExamName.Focus();
                valid = false;
             
               
            }
           if (cmbClass.SelectedValue.ToString() == "-1" || cmbExamType.SelectedValue.ToString() == "-1" || cmbTerm.SelectedValue.ToString() == "-1")
            {

                MessageBox.Show("Please enter Exam Type, Term and Class", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
             
                valid = false;
                return valid;


            }

            

            return valid;


        }
        private void btnSave_Click(object sender, EventArgs e)
        {


            if (!ValidEntry()) return;
            try
            {
               

                SQLConn.ConnOpen();
                SQLConn.sqL = "select examname from exam where examname='" + txtExamName.Text + "'";

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



                SQLConn.sqL = "insert into exam(examname, examtype, startdate, enddate, schoolclass, schoolterm) VALUES ('" + txtExamName.Text + "','" + cmbExamType.SelectedValue + "', '" + TM.TimeToString(dtpStart.Value) + "', '" + TM.TimeToString(dtpEnd.Value) + "', '" + cmbClass.Text + "', '" + cmbTerm.SelectedValue + "' )";

               SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
              SQLConn.cmd.ExecuteNonQuery();
                ListExams();
                Reset(); 
            
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

      

        private void NewRecord_Click(object sender, EventArgs e)
        {
         Reset();   
        }
         private void DeleteExam()
        {

            try
            {

                int RowsAffected = 0;
                SQLConn.ConnOpen();
               SQLConn.sqL= "delete from exam where id = '" +txtExamName.Tag+ "'";
               SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
  
              RowsAffected=  SQLConn.cmd.ExecuteNonQuery();
         

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
                ListExams(); 
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void Reset()
        {
      
            txtExamName.Text = "";
            cmbExamType.SelectedValue = -1;
            cmbTerm.SelectedValue = -1;
            cmbClass.SelectedValue = -1;
            
            btnSave.Enabled = true;
            Delete.Enabled = false;
            btnUpdate.Enabled = false;
            sch.ResetCombos(this);
        }
        private void Update_record_Click(object sender, EventArgs e)
        {

            if (!ValidEntry()) return;


             try
            {


                SQLConn.ConnOpen();
                SQLConn.sqL = "update exam set examname='" + txtExamName.Text + "',examtype='" + cmbExamType.SelectedValue  +"' , startdate='" + TM.TimeToString(dtpStart.Value) + "', schoolclass='" + cmbClass.Text+ "'  , schoolterm='" + cmbTerm.SelectedValue + "'      , enddate='" + TM.TimeToString(dtpEnd.Value) + "'    where  id='" + txtExamName.Tag + "'";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.cmd.ExecuteNonQuery();
                Debug.WriteLine(SQLConn.sqL);
                MessageBox.Show("Successfully updated", "Exam Details", MessageBoxButtons.OK, MessageBoxIcon.Information);
            //    st1 = lblUser.Text;
              //  st2 = "Updated Exam'" +txtExamName.Text+ "'";
            //    cf.LogFunc(st1, System.DateTime.Now, st2);
               btnUpdate.Enabled=false;

               ListExams();

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
          DeleteExam();
        }

        private void DataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow dr = DataGridView1.SelectedRows[0];
                txtExamName.Tag = dr.Cells["examid"].Value.ToString();
                txtExamName.Text = dr.Cells["examname"].Value.ToString();
            

                dtpStart.Text = dr.Cells["startdate"].Value.ToString();
                dtpEnd.Text = dr.Cells["enddate"].Value.ToString();
        
                cmbExamType.Text = dr.Cells["examtypename"].Value.ToString();
                cmbClass.Text = dr.Cells["classname"].Value.ToString();
                cmbTerm.Text = dr.Cells["termname"].Value.ToString();

                btnUpdate.Enabled = true; //ye button item select karne pe dikhe
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

        private void label1_Click(object sender, EventArgs e)
        {
        
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
        
        }

        private void btnFilter_Click(object sender, EventArgs e)
        {
           
            ListExams();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {

            Reset();
            ListExams();

        }

        private void btnRegenerate_Click(object sender, EventArgs e)
        {

            if  (ValidEntry())
            {

                string  name=  cmbExamType.Text  +" - Class  "+ cmbClass.Text + " - " +   cmbTerm.Text +  "";
                txtExamName.Text = name;

            }
        
        }


        }
    }

