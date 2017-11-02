using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Npgsql;
using System.IO;
using Excel = Microsoft.Office.Interop.Excel;
namespace SchoolGuru  {
    public partial class frmStaffRecord : Form
    {


        School sch = new School();
        public frmStaffRecord()
        {
            InitializeComponent();
            FillRecords();
        }
       
        private void   FillRecords()
        {
            try
            {
                string s = "doj between @date1 and @date2 ";

                SQLConn.sqL = "select id, staffname, department, gender,dob,status, paddress,taddress,phone, mobile, doj,qualification,yop, designation, email, salary from staff WHERE 1=1  ";
                if( txtStaffName.Text.Trim()!="")     SQLConn.sqL +=  "  AND   staffname ILIKE '%" + txtStaffName.Text + "%'   ";

                  SQLConn.sqL +="  order by staffname  ";    
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
     

                SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);
                DataTable dt= new DataTable();

     

                SQLConn.da.Fill(dt);

                DGV.DataSource = dt;




                SQLConn.ConnClose();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void frmEmployee_Recordss_Load(object sender, EventArgs e)
        {
          
        }

        private void dataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow dr = DGV.SelectedRows[0];
        
                int staffid = int.Parse(dr.Cells["id"].Value.ToString());
      
                frmStaff frm = new frmStaff();

                frm.staffid = staffid;
    
                frm.Show();

              
        
            
      
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

       

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

      

        //private void dataGridView2_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        //{
        //    {
        //        string strRowNumber = (e.RowIndex + 1).ToString();
        //        SizeF size = e.Graphics.MeasureString(strRowNumber, this.Font);
        //        if (dataGridView2.RowHeadersWidth < Convert.ToInt32((size.Width + 20)))
        //        {
        //            dataGridView2.RowHeadersWidth = Convert.ToInt32((size.Width + 20));
        //        }
        //        Brush b = SystemBrushes.ControlText;
        //        e.Graphics.DrawString(strRowNumber, this.Font, b, e.RowBounds.Location.X + 15, e.RowBounds.Location.Y + ((e.RowBounds.Height - size.Height) / 2));
        //    }
        //}

        //private void dataGridView1_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        //{
        //    {
        //        string strRowNumber = (e.RowIndex + 1).ToString();
        //        SizeF size = e.Graphics.MeasureString(strRowNumber, this.Font);
        //        if (dataGridView1.RowHeadersWidth < Convert.ToInt32((size.Width + 20)))
        //        {
        //            dataGridView1.RowHeadersWidth = Convert.ToInt32((size.Width + 20));
        //        }
        //        Brush b = SystemBrushes.ControlText;
        //        e.Graphics.DrawString(strRowNumber, this.Font, b, e.RowBounds.Location.X + 15, e.RowBounds.Location.Y + ((e.RowBounds.Height - size.Height) / 2));
        //    }
        //}

       

      

        private void button9_Click(object sender, EventArgs e)
        {

            FillRecords();
        }

        private void ExportExcel_Click(object sender, EventArgs e)
        {
            
        }

        private void button7_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            FillRecords();
        }
    }
}
