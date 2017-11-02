using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using Npgsql;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SchoolGuru
{
    public partial class frmSchoolTerms : Form
    {

        TimeManager tm = new TimeManager();
        public frmSchoolTerms()
        {
            InitializeComponent();
        }
       

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dateTimePicker2_ValueChanged(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

       


        private void btnSave_Click(object sender, EventArgs e)
        {
            if (txtTermName.Text=="" ){
               
                txtTermName.BackColor = Color.MistyRose;
                MessageBox.Show("Please Enter Term Name");
                txtTermName.BackColor = Color.White;

                
                return;
            }
            try
            {
               SQLConn.ConnOpen();
                SQLConn.sqL="insert into schoolterm (termname, startdate, enddate) values ('" + txtTermName.Text + "','" + dtpStartDate.Text + "','" + dtpEndDate.Text + "') ";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);

                SQLConn.cmd.ExecuteNonQuery();
              
                MessageBox.Show("Successfully Saved", "Events Records", MessageBoxButtons.OK, MessageBoxIcon.Information);
                SQLConn.ConnClose();
                Clears();
              

            }
            catch (NpgsqlException ex)
            {
                MessageBox.Show(ex.ToString());


            }
        }




        public void LoadSchoolTerms()
        {
            try
            {


                SQLConn.ConnOpen();

          
                DataTable dt = new DataTable();

                DataGridView1.DataSource = null;
                SQLConn.sqL = "SELECT id, termname, startdate, enddate  FROM schoolterm order by startdate";


                // data adapter making request from our connection
                NpgsqlDataAdapter da = new NpgsqlDataAdapter(SQLConn.sqL, SQLConn.conn);

                da.Fill(dt);

                DataGridView1.DataSource = dt;


                SQLConn.ConnClose();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void frmSchoolTerms_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'eRPDataSet1.EventsTable' table. You can move, or remove it, as needed.

            LoadSchoolTerms();
   //         this.eventsTableTableAdapter.Fill(this.eRPDataSet1.EventsTable);

        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            Clears();
        }

        private void Clears()
        {


            txtTermName.Text = "";
            txtTermName.Tag = null;
            dtpStartDate.Text = "";
            dtpEndDate.Text = "";
       
            btnNew.Enabled = true;
            btnSave.Enabled = true;
            btnUpdate.Enabled = false;
            btnPrint.Enabled = true;
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {

            if (txtTermName.Tag==null)
            {
                MessageBox.Show("Select Term in Grid to Edit");
                return;

            }
            try
            {
                SQLConn.ConnOpen();

                string startdate = tm.TimeToString(dtpStartDate.Value);
                string enddate = tm.TimeToString(dtpEndDate.Value);
                SQLConn.cmd.CommandText = "update schoolterm set termname='" + txtTermName.Text + "', startdate ='" + startdate + "', enddate='" + enddate + "' WHERE id=" + txtTermName.Tag + " ";
                SQLConn.cmd.ExecuteNonQuery();
                SQLConn.conn.Close();
                MessageBox.Show("Updated Saved", "Term Records", MessageBoxButtons.OK, MessageBoxIcon.Information);
                Clears();
                LoadSchoolTerms();
            }
            catch (NpgsqlException ex)
            {
                MessageBox.Show( ex.ToString());


            }
        }



        private void DataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow row = DataGridView1.SelectedRows[0];
                if (DataGridView1.SelectedRows[0].Cells[0].Value == null) return;
                txtTermName.Tag = row.Cells["id"].Value.ToString();

                dtpStartDate.Text = row.Cells["startdate"].Value.ToString();
                dtpEndDate.Text = row.Cells["enddate"].Value.ToString();
                txtTermName.Text = row.Cells["termname"].Value.ToString();
              



                btnUpdate.Enabled = true; //ye button item select karne pe dikhe
                btnSave.Enabled = false;
                btnDelete.Enabled = true;                            //ye hide ho jaye kyu ki grid view se data laye he update k liye save ke lie nhi 
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnGet_Click(object sender, EventArgs e)
        {

        }
    }
}
