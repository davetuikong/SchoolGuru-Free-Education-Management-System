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
    public partial class frmBookEntry : Form
    {
        
      
        clsFunc cf = new clsFunc();

        string st1;
        string st2;
        public frmBookEntry()
        {
            InitializeComponent();
        }
        private void Autocompletedepartment()
        {
            try
            {

                SQLConn.ConnOpen();


                SQLConn.sqL = "select distinct RTRIM(departmentname) from department ";

                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);

               SQLConn.dr = SQLConn.cmd.ExecuteReader();

                while ( SQLConn.dr.Read())
                {
                    cmbDepartment.Items.Add(SQLConn.dr["departmentname"]);
                }
                SQLConn.ConnClose();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void Autocompleteubject()
        {
            //try
            //{

            //    con = new SqlConnection(cs.DBcon);
            //    con.Open();


            //    string ct = "select distinct RTRIM(Subject) from Book ";

            //    cmd = new SqlCommand(ct);
            //    cmd.Connection = con;

            //    rdr = cmd.ExecuteReader();

            //    while (rdr.Read())
            //    {
            //        cmbSubject.Items.Add(rdr[0]);
            //    }
            //    con.Close();

            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }

        private void AutocompletSupplier()
        {
            //try
            //{

            //    con = new SqlConnection(cs.DBcon);
            //    con.Open();


            //    string ct = "select distinct RTRIM(SupplierName) from Supplier ";

            //    cmd = new SqlCommand(ct);
            //    cmd.Connection = con;

            //    rdr = cmd.ExecuteReader();

            //    while (rdr.Read())
            //    {
            //        cmbSupplierName.Items.Add(rdr[0]);
            //    }
            //    con.Close();

            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }
        
        private void btnSave_Click(object sender, EventArgs e)
        {
           
            //    try
            //    {
            //        if (txtAccessionNo.Text == "")
            //        {
            //            MessageBox.Show("Please Enter Book Accession NO", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //            txtAccessionNo.Focus();
            //            return;
            //        }
            //        if (txtBookTitle.Text== "")
            //        {
            //            MessageBox.Show("Please Enter Book Title", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //            txtBookTitle.Focus();
            //            return;
            //        }
            //        if (txtEdition.Text == "")
            //        {
            //            MessageBox.Show("Please Enter Book Eddition", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //            txtEdition.Focus();
            //            return;
            //        }
            //        if (txtPrice.Text == "")
            //        {
            //            MessageBox.Show("Please Enter Book Price", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //            txtPrice.Focus();
            //            return;
            //        }
            //        if (txtPublisherName.Text== "")
            //        {
            //            MessageBox.Show("Please Enter Book PublisherName", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //            txtPublisherName.Focus();
            //            return;
            //        }
            //        if (txtPublishingYear.Text== "")
            //        {
            //            MessageBox.Show("Please Enter Book Publishing year", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //            txtPublishingYear.Focus();
            //            return;
            //        }
            //        if (txtAlmiraPosition.Text == "")
            //        {
            //            MessageBox.Show("Please Enter Book Almira Position", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //            txtAlmiraPosition.Focus();
            //            return;
            //        }
            //        if (txtAuthor.Text == "")
            //        {
            //            MessageBox.Show("Please Enter Book Author", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //            txtAuthor.Focus();
            //            return;
            //        }
            //        if (cmbSupplierName.Text == "")
            //        {
            //            MessageBox.Show("Please Select Book Supplier", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //            cmbSupplierName.Focus();
            //            return;
            //        }
            //        if (cmbCD.Text == "")
            //        {
            //            MessageBox.Show("Please Select CD", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //            cmbCD.Focus();
            //            return;
            //        }
            //        if (cmbReference.Text == "")
            //        {
            //            MessageBox.Show("Please Select Reference", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //            cmbReference.Focus();
            //            return;
            //        }
            //        con = new SqlConnection(cs.DBcon);
            //        con.Open();
            //        string ct = "select AccessionNo from Book where AccessionNo=@find";

            //        cmd = new SqlCommand(ct);
            //        cmd.Connection = con;
            //        SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@find", System.Data.SqlDbType.NChar, 30, "AccessionNo"));
            //        SQLConn.cmd.Parameters["@find"].Value =txtAccessionNo.Text;
            //        rdr = cmd.ExecuteReader();

            //        if (rdr.Read())
            //        {
            //            MessageBox.Show("This AccessionNo Is Already Exist,Plz Enter Unique AccessionNo of Each Book", "", MessageBoxButtons.OK, MessageBoxIcon.Information);
            //            return;
            //        }
                   
            //        if ((rdr != null))
            //        {
            //            rdr.Close();
            //        }

                    
            //    con = new SqlConnection(cs.DBcon);
            //    con.Open();

            //    string cb = "insert into Book(AccessionNo,BookTitle,Department,Barcode,ISBN,Volume,Edition,Publisher,PlaceOfPublisher,PublishingYear,AlmiraPosition,Price,SupplierName,BillDate,Remarks,CD,Reference) VALUES (@d1,@d2,@d3,@d4,@d5,@d6,@d7,@d8,@d9,@d10,@d11,@d12,@d14,@d16,@d17,@d18,@d19,@d20,@d21,@d22)";

            //    cmd = new SqlCommand(cb);

            //    cmd.Connection = con;
            //    SQLConn.cmd.Parameters.AddWithValue("@d1",txtAccessionNo.Text);
            //    SQLConn.cmd.Parameters.AddWithValue("@d2" ,txtBookTitle.Text);
          
            //     SQLConn.cmd.Parameters.AddWithValue("@d12", txtPlaceOfPublisher.Text);
       
            //     SQLConn.cmd.Parameters.AddWithValue("@d14", txtPublishingYear.Text);
  
            //     SQLConn.cmd.Parameters.AddWithValue("@d16", txtAlmiraPosition.Text);
            //     SQLConn.cmd.Parameters.AddWithValue("@d17", txtPrice.Text);
            //     SQLConn.cmd.Parameters.AddWithValue("@d18",cmbSupplierName.Text);
            //     SQLConn.cmd.Parameters.AddWithValue("@d19",dtpBillDate.Text);
            //     SQLConn.cmd.Parameters.AddWithValue("@d20",txtRemarks.Text);
            //     SQLConn.cmd.Parameters.AddWithValue("@d21",cmbCD.Text);
            //     SQLConn.cmd.Parameters.AddWithValue("@d22",cmbReference.Text);
                
           
            //    cmd.ExecuteNonQuery();

            //    Autocompleteubject();
            //    st1 = lblUser.Text;
            //    st2 = "book  is added  having accessionNo='" + txtAccessionNo.Text + "'";
            //    cf.LogFunc(st1, System.DateTime.Now, st2);
            //     MessageBox.Show("Successfully saved", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
            //    btnSave.Enabled = false;
              

            //    con.Close();


            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }

        private void frmBookEntry_Load(object sender, EventArgs e)
        {
            Autocompletedepartment();
            AutocompletSupplier();
            Autocompleteubject();
       
        }
         private void Reset()
        {
            cmbCD.SelectedIndex = -1;
            cmbReference.SelectedIndex = -1;
            txtAccessionNo.Text = "";
            txtAlmiraPosition.Text = "";
            txtAuthor.Text= "";
            txtBarcode.Text = "";
            txtBookTitle.Text= "";
            txtEdition.Text = "";
            txtISBN.Text= "";
            txtJointAuthor.Text = "";
            txtPrice.Text = "";
            txtPlaceOfPublisher.Text = "";
            txtPublisherName.Text= "";
            txtPublishingYear.Text= "";
            txtRemarks.Text = "";
            txtVolume.Text = "";
            cmbDepartment.SelectedIndex=-1;
            cmbSubject.Text = "";
            cmbSupplierName.Text = "";
            btnSave.Enabled = true;
            btnDelete.Enabled = false;
            btnUpdate_record.Enabled = false;
        }
        private void btnDelete_Click(object sender, EventArgs e)
        {
            delete_records();
        }
        private void delete_records()
        {

            //try
            //{
                 
            //    int RowsAffected = 0;
            //    con = new SqlConnection(cs.DBcon);

            //    con.Open();
            //    string ct = "select AccessionNo from BookIssueStaff where AccessionNo=@find";


            //    cmd = new SqlCommand(ct);

            //    cmd.Connection = con;
            //    SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@find", System.Data.SqlDbType.NChar, 15, "AccessionNo"));


            //    SQLConn.cmd.Parameters["@find"].Value = txtAccessionNo.Text;


            //    rdr = cmd.ExecuteReader();

            //    if (rdr.Read())
            //    {
            //        MessageBox.Show("Unable to delete..Already in use", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //        Reset();
            //        if ((rdr != null))
            //        {
            //            rdr.Close();
            //        }
            //        return;
            //    }
               
            //   con = new SqlConnection(cs.DBcon);

            //    con.Open();
            //    string ct1 = "select AccessionNo from studentBookIssue where AccessionNo=@find";


            //    cmd = new SqlCommand(ct1);

            //    cmd.Connection = con;
            //    SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@find", System.Data.SqlDbType.NChar, 15, "AccessionNo"));


            //    SQLConn.cmd.Parameters["@find"].Value = txtAccessionNo.Text;


            //    rdr = cmd.ExecuteReader();

            //    if (rdr.Read())
            //    {
            //        MessageBox.Show("Unable to delete..Already in use", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //        Reset();
            //        if ((rdr != null))
            //        {
            //            rdr.Close();
            //        }
            //        return;
            //    }
            //    con = new SqlConnection(cs.DBcon);
            //    con.Open();
            //    string cq1 = "delete from Book where AccessionNo='" +txtAccessionNo.Text + "'";
            //    cmd = new SqlCommand(cq1);
            //    cmd.Connection = con;
            //    RowsAffected = cmd.ExecuteNonQuery();
            //    con.Close();

            //    if (RowsAffected > 0)
            //    {
            //        MessageBox.Show("Successfully deleted", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
            //        st1 = lblUser.Text;
            //        st2 = "book is deleted accessionNo='" + txtAccessionNo.Text + "'";
            //        cf.LogFunc(st1, System.DateTime.Now, st2);
            //        Reset();
            //    }
            //    else
            //    {
            //        MessageBox.Show("No Record found", "Sorry", MessageBoxButtons.OK, MessageBoxIcon.Information);
            //        Reset();
            //    }
            //    if (con.State == ConnectionState.Open)
            //    {
            //        con.Close();
            //    }
            //   //GetData(); 
            //   }
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            frmBookEntryRecords frm=new frmBookEntryRecords();
            frm.lblUser.Text = lblUser.Text;
            frm.lblUserType.Text = lblUserType.Text;
            frm.set.Text = "Book Entry";
            frm.Show();
        }

        private void btnUpdate_record_Click(object sender, EventArgs e)
        {
           try
            {

            
                SQLConn.ConnOpen();
               SQLConn.sqL = "Update Book Set AccessionNo=@d1, BookTitle=@d2,Author=@d3,JointAuthors=@d4,Subject=@d5,Department=@d6,Barcode=@d7,ISBN=@d8,Volume=@d9,Edition=@d10,Publisher=@d11,PlaceOfPublisher=@d12,PublishingYear=@d13,AlmiraPosition=@d14,Price=@d15,SupplierName=@d16,BillDate=@d17,Remarks=@d18,CD=@d19,Reference=@d20 where AccessionNo='"+TextBox1.Text+"'";
                SQLConn.cmd= new NpgsqlCommand (SQLConn.sqL, SQLConn.conn);
                SQLConn.cmd.Parameters.AddWithValue("@d1",txtAccessionNo.Text);
                SQLConn.cmd.Parameters.AddWithValue("@d2",txtBookTitle.Text);
           
                SQLConn.cmd.Parameters.AddWithValue("@d8",txtISBN.Text);
                SQLConn.cmd.Parameters.AddWithValue("@d9",txtVolume.Text );
                SQLConn.cmd.Parameters.AddWithValue("@d10",txtEdition.Text);
                SQLConn.cmd.Parameters.AddWithValue("@d11",txtPublisherName.Text);
                SQLConn.cmd.Parameters.AddWithValue("@d12",txtPlaceOfPublisher.Text);
                 SQLConn.cmd.Parameters.AddWithValue("@d13",txtPublishingYear.Text);
                SQLConn.cmd.Parameters.AddWithValue("@d14", txtAlmiraPosition.Text);
               SQLConn.cmd.Parameters.AddWithValue("@d15",txtPrice.Text);
               SQLConn.cmd.Parameters.AddWithValue("@d16",cmbSupplierName.Text);
               SQLConn.cmd.Parameters.AddWithValue("@d17",dtpBillDate.Text);
                SQLConn.cmd.Parameters.AddWithValue("@d18",txtRemarks.Text);
                SQLConn.cmd.Parameters.AddWithValue("@d19",cmbCD.Text);
                SQLConn.cmd.Parameters.AddWithValue("@d20",cmbReference.Text);
           
               
               SQLConn.cmd.ExecuteReader();
               MessageBox.Show("Successfully updated", "Book Details", MessageBoxButtons.OK, MessageBoxIcon.Information);
                st1 = lblUser.Text;
                st2 = "Update the book ='" + txtBookTitle.Text + "'";
                cf.LogFunc(st1, System.DateTime.Now, st2);
                btnUpdate_record.Enabled = false;
               SQLConn.ConnClose();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

     

        private void btnNewRecord_Click(object sender, EventArgs e)
        {
            Reset();
            txtAccessionNo.Enabled = true;
        }

        private void GroupBox1_Enter(object sender, EventArgs e)
        {

        }
        }
    }

