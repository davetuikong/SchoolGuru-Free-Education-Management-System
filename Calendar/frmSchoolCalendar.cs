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
    public partial class frmSchoolCalendar : Form
    {

        TimeManager Tm = new TimeManager();
        public frmSchoolCalendar()
        {
            InitializeComponent();
        
        }
        private void SelectEvent()
        {
            try {
            
            NpgsqlConnection conn = new NpgsqlConnection(SQLConn.DBcon);
            conn.Open();
            string evt= "select eventname from event order by startdate asc";
            NpgsqlCommand cmd = new NpgsqlCommand(evt);
            cmd.Connection = conn;
            NpgsqlDataReader read = cmd.ExecuteReader();
            while (read.Read())
            {
                cmbEvtName.Items.Add(read[0]);
            }
            }
            catch(Exception ex){
                MessageBox.Show(ex.ToString());
            
            }
        }
        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            txtActivity.BackColor = Color.LightGray;
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

        private void cmbEvtName_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            NpgsqlConnection conn = new NpgsqlConnection(SQLConn.DBcon);
            conn.Open();
            string stri= "select startdate, enddate,manager, activity from event  where eventname='"+cmbEvtName.Text+"'";
            NpgsqlCommand cmd = new NpgsqlCommand(stri);
            cmd.Connection = conn;
            NpgsqlDataReader read = cmd.ExecuteReader();
            if (read.Read()==true)
            {
                dtpStartDate.Text = read["startdate"].ToString().Trim();
                dtpEndDate.Text = read["enddate"].ToString().Trim();
                cmbManager.Text = read["manager"].ToString().Trim();
                txtActivity.Text = read["activity"].ToString().Trim();
                conn.Close();
                btnSave.Enabled = false;
                btnNew.Enabled = false;
            }

            else
            {
                Clears();
            }
        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (cmbEvtName.Text=="" || cmbManager.Text=="" || txtActivity.Text==""){
               
                cmbEvtName.BackColor = Color.MistyRose;
                MessageBox.Show("Please Enter Event Name");
                cmbEvtName.BackColor = Color.White;

                cmbManager.BackColor = Color.MistyRose;
                MessageBox.Show("Please Enter Event Manager");
                cmbManager.BackColor = Color.White;

                txtActivity.BackColor = Color.MistyRose;
                MessageBox.Show("Please List Activities");
                txtActivity.BackColor = Color.White;
                return;
            }
            try
            {
               SQLConn.ConnOpen();

               string startdate= Tm.TimeToString(dtpStartDate.Value);
               string enddate = Tm.TimeToString(dtpEndDate.Value);
                SQLConn.sqL="insert into event (eventname, startdate, enddate,manager, activity) values ('" + cmbEvtName.Text + "','" + startdate + "','" +enddate + "','" + cmbManager.Text + "','" + txtActivity.Text + "') ";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);

                SQLConn.cmd.ExecuteNonQuery();
              
                MessageBox.Show("Successfully Saved", "Events Records", MessageBoxButtons.OK, MessageBoxIcon.Information);
                SQLConn.ConnClose();
                Clears();
                SelectEvent();
                LoadEvents();

            }
            catch (NpgsqlException ex)
            {
                MessageBox.Show(ex.ToString());


            }
        }




        public void LoadEvents()
        {
            try
            {


                SQLConn.ConnOpen();

          
                DataTable dt = new DataTable();

                DGV.DataSource = null;
                SQLConn.sqL = "SELECT id, eventname, startdate, enddate, manager, activity FROM event order by startdate  asc";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);

                // data adapter making request from our connection
                SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);
                MessageBox.Show(dt.Rows.Count.ToString());
                SQLConn.da.Fill(dt);

                DGV.DataSource = dt;


                SQLConn.ConnClose();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }


        private void btnNew_Click(object sender, EventArgs e)
        {
            Clears();
        }


        private void DataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try 
            {
                DataGridViewRow row = DGV.SelectedRows[0];
                if (DGV.SelectedRows[0].Cells[0].Value == null) return;
                cmbEvtName.Tag = row.Cells["id"].Value.ToString();

                dtpStartDate.Text = row.Cells["startdate"].Value.ToString();
                dtpEndDate.Text= row.Cells["enddate"].Value.ToString();
                cmbEvtName.Text = row.Cells["eventname"].Value.ToString();
                txtActivity.Text = row.Cells["activity"].Value.ToString();
                cmbManager.Text  = row.Cells["manager"].Value.ToString();



                btnUpdate.Enabled = true; //ye button item select karne pe dikhe
                btnSave.Enabled = false;
                btnDelete.Enabled = true;                            //ye hide ho jaye kyu ki grid view se data laye he update k liye save ke lie nhi 
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void Clears()
        {
            cmbEvtName.Text = "";
            cmbManager.Text = "";
            dtpStartDate.Text = "";
            dtpEndDate.Text = "";
            txtActivity.Text = "";
            txtActivity.BackColor = Color.White;
            btnNew.Enabled = true;
            btnSave.Enabled = true;
            btnUpdate.Enabled = true;
            btnPrint.Enabled = true;
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {

            try
            {
                 string startdate = Tm.TimeToString(dtpStartDate.Value);
                string enddate = Tm.TimeToString(dtpEndDate.Value);
                SQLConn.ConnOpen();
                SQLConn.sqL="update event set eventname='" + cmbEvtName.Text + "', startdate ='" + startdate + "', enddate='" + enddate + "',manager='" + cmbManager.Text + "', activity='" + txtActivity.Text + "' WHERE id= "+cmbEvtName.Tag+" ";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.cmd.ExecuteNonQuery();
                SQLConn.ConnClose();
                MessageBox.Show("Updated Saved", "Events Records", MessageBoxButtons.OK, MessageBoxIcon.Information);
                Clears();
                SelectEvent();
                LoadEvents();
            }
            catch (NpgsqlException ex)
            {
                MessageBox.Show( ex.ToString());


            }
        }

     

        private void frmSchoolCalendar_Load(object sender, EventArgs e)
        {

            SelectEvent();
            LoadEvents();
        }

       





    }

}
