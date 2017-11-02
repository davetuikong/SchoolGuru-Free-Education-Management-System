using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Npgsql;
using Excel = Microsoft.Office.Interop.Excel;
namespace SchoolGuru
{
    public partial class frmBookEntryRecords : Form
    {
      
       
      
        DataTable dt = new DataTable();
        DataSet ds;
     
    
        public frmBookEntryRecords()
        {
            InitializeComponent();
        }
       

         private void AutocompleteBookReference()
        {

            try
            {


                SQLConn.ConnOpen();
                NpgsqlDataAdapter da = new NpgsqlDataAdapter();

                SQLConn.cmd = new NpgsqlCommand("SELECT distinct BookTitle FROM Book where BookTitle is not null", SQLConn.conn);
            
                da.Fill(dt);
                cmbBookTitle.Items.Clear();

                foreach (DataRow drow in dt.Rows)
                {
                    cmbBookTitle.Items.Add(drow[0].ToString());

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

         private void AutocompleteBooktitle()
         {

             try
             {


                 SQLConn.ConnOpen();
                 SQLConn.da = new NpgsqlDataAdapter();
                 DataTable dt = new DataTable();
                 SQLConn.sqL= "SELECT distinct Reference FROM Book where Reference is not null";
                 SQLConn.da.SelectCommand = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
            

                 SQLConn.da.Fill(dt);
           
                 cmbRfBook.Items.Clear();

                 foreach (DataRow drow in  dt.Rows)
                 {
                     cmbRfBook.Items.Add(drow[0].ToString());

                 }
             }
             catch (Exception ex)
             {
                 MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
             }

         }
         private void AutocompleteDepartment()
         {

             try
             {
                 SQLConn.da= new NpgsqlDataAdapter();
                 DataTable dt = new DataTable();

                 SQLConn.ConnOpen();
                 SQLConn.sqL="SELECT distinct Department FROM Book where Department is not null";
                 SQLConn.da.SelectCommand = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);


                 SQLConn.da.Fill(dt);
            
                 cmbDepartment.Items.Clear();

                 foreach (DataRow drow in dt.Rows)
                 {
                     cmbDepartment.Items.Add(drow[0].ToString());

                 }
             }
             catch (Exception ex)
             {
                 MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
             }

         }
         private void AutocompleteAccessionNo()
         {

             try
             {


                 SQLConn.da = new NpgsqlDataAdapter();
                 DataTable dt = new DataTable();

                 SQLConn.ConnOpen();
                 SQLConn.sqL = "SELECT distinct AccessionNo FROM Book where AccessionNo is not null";
                 SQLConn.da.SelectCommand = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);

                 SQLConn.da.Fill(dt);
                

                 foreach (DataRow drow in dt.Rows)
                 {
                     cmbAccessionNo.Items.Add(drow[0].ToString());

                 }
             }
             catch (Exception ex)
             {
                 MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
             }

         }

         private void AutocompleteSubject()
         {

             try
             {



                 SQLConn.da = new NpgsqlDataAdapter();
                 DataTable dt = new DataTable();

                 SQLConn.ConnOpen();
                 SQLConn.sqL = "SELECT distinct Subject FROM Book";
                 SQLConn.da.SelectCommand = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);

                 SQLConn.da.Fill(dt);

                 cmbSubject.Items.Clear();
                 foreach (DataRow drow in dt.Rows)
                 {
                     cmbSubject.Items.Add(drow[0].ToString());

                 }
             }
             catch (Exception ex)
             {
                 MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
             }

         }
         private void AutocompleteAuthor()
         {

             try
             {


                


                 SQLConn.da = new NpgsqlDataAdapter();
                 DataTable dt = new DataTable();

                 SQLConn.ConnOpen();
                 SQLConn.sqL = "SELECT distinct Author FROM Book where Author is not null";
                 SQLConn.da.SelectCommand = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);

                 SQLConn.da.Fill(dt);
                 cmbAuthor.Items.Clear();


                 foreach (DataRow drow in dt.Rows)
                 {
                     cmbAuthor.Items.Add(drow[0].ToString());

                 }
             }
             catch (Exception ex)
             {
                 MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
             }

         }
        private void cmbBookTitle_SelectedIndexChanged(object sender, EventArgs e)
        {

            try
            {
                SQLConn.ConnOpen();
                SQLConn.sqL="SELECT RTRIM(AccessionNo) as [Accession No],RTRIM(BookTitle) as [Book Title],RTRIM(Author) as [Author], RTRIM(JointAuthors) as [Joint Authors],RTRIM(Subject) as [Subject],RTRIM(Department) as [Department],RTRIM (Barcode) as [Barcode],RTRIM (ISBN) as [ISBN],RTRIM(Volume)as[Volume],RTRIM(Edition) as[Edition],RTRIM(Publisher) as [Publisher],RTRIM(PlaceOfPublisher) as [Place Of Publisher],RTRIM(CD) as[CD],RTRIM(PublishingYear) as [Publishing Year],RTRIM(Reference) as [Refrence],RTRIM(AlmiraPosition) as [Almira Position],RTRIM(Price) as [price],convert(Datetime,BillDate,103) as [Bill Date],SupplierName,Remarks from book  where bookTitle='"+cmbBookTitle.Text+"' order by BookTitle";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.da = new NpgsqlDataAdapter(SQLConn.sqL, SQLConn.conn);

                DataTable dt = new DataTable();
                SQLConn.da.Fill(dt);
                dataGridView1.DataSource = dt;
                SQLConn.ConnClose();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        private void frmBookEntryRecords_Load(object sender, EventArgs e)
        {
            AutocompleteBooktitle();
            AutocompleteAuthor();
            AutocompleteAccessionNo();
            AutocompleteSubject();
            AutocompleteBookReference();
            AutocompleteDepartment();
        }

        private void txtBookTitle_TextChanged(object sender, EventArgs e)
        {
            //try
            //{
            //    con = new SqlConnection(cs.DBcon);

            //    con.Open();
            //    cmd = new SqlCommand("SELECT RTRIM(AccessionNo) as [Accession No],RTRIM(BookTitle) as [Book Title],RTRIM(Author) as [Author], RTRIM(JointAuthors) as [Joint Authors],RTRIM(Subject) as [Subject],RTRIM(Department) as [Department],RTRIM (Barcode) as [Barcode],RTRIM (ISBN) as [ISBN],RTRIM(Volume)as[Volume],RTRIM(Edition) as[Edition],RTRIM(Publisher) as [Publisher],RTRIM(PlaceOfPublisher) as [Place Of Publisher],RTRIM(CD) as[CD],RTRIM(PublishingYear) as [Publishing Year],RTRIM(Reference) as [Refrence],RTRIM(AlmiraPosition) as [Almira Position],RTRIM(Price) as [price],convert(Datetime,BillDate,103) as [Bill Date],SupplierName,Remarks from book  where bookTitle Like '" + txtBookTitle.Text+ "%' order by BookTitle", con);
            //    SqlDataAdapter myDA = new SqlDataAdapter(cmd);
              
            //    dataGridView1.DataSource = myDataSet.Tables["Book"].DefaultView;
            //    con.Close();
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }

        private void cmbAuthor_SelectedIndexChanged(object sender, EventArgs e)
        {
            //try
            //{
            //    con = new SqlConnection(cs.DBcon);

            //    con.Open();
            //    cmd = new SqlCommand("SELECT RTRIM(AccessionNo) as [Accession No],RTRIM(BookTitle) as [Book Title],RTRIM(Author) as [Author], RTRIM(JointAuthors) as [Joint Authors],RTRIM(Subject) as [Subject],RTRIM(Department) as [Department],RTRIM (Barcode) as [Barcode],RTRIM (ISBN) as [ISBN],RTRIM(Volume)as[Volume],RTRIM(Edition) as[Edition],RTRIM(Publisher) as [Publisher],RTRIM(PlaceOfPublisher) as [Place Of Publisher],RTRIM(CD) as[CD],RTRIM(PublishingYear) as [Publishing Year],RTRIM(Reference) as [Refrence],RTRIM(AlmiraPosition) as [Almira Position],RTRIM(Price) as [price],convert(Datetime,BillDate,103) as [Bill Date],SupplierName,Remarks from book  where Author='" + cmbAuthor.Text + "' order by Author", con);
            //    SqlDataAdapter myDA = new SqlDataAdapter(cmd);
            //    DataSet myDataSet = new DataSet();
            //    myDA.Fill(myDataSet, "Book");
            //    dataGridView2.DataSource = myDataSet.Tables["Book"].DefaultView;
            //    con.Close();
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }

        private void txtAuthor_TextChanged(object sender, EventArgs e)
        {
            //try
            //{
            //    con = new SqlConnection(cs.DBcon);

            //    con.Open();
            //    cmd = new SqlCommand("SELECT RTRIM(AccessionNo) as [Accession No],RTRIM(BookTitle) as [Book Title],RTRIM(Author) as [Author], RTRIM(JointAuthors) as [Joint Authors],RTRIM(Subject) as [Subject],RTRIM(Department) as [Department],RTRIM (Barcode) as [Barcode],RTRIM (ISBN) as [ISBN],RTRIM(Volume)as[Volume],RTRIM(Edition) as[Edition],RTRIM(Publisher) as [Publisher],RTRIM(PlaceOfPublisher) as [Place Of Publisher],RTRIM(CD) as[CD],RTRIM(PublishingYear) as [Publishing Year],RTRIM(Reference) as [Refrence],RTRIM(AlmiraPosition) as [Almira Position],RTRIM(Price) as [price],convert(Datetime,BillDate,103) as [Bill Date],SupplierName,Remarks from book  where Author Like '" +txtAuthor.Text + "%' order by BookTitle", con);
            //    SqlDataAdapter myDA = new SqlDataAdapter(cmd);
            //    DataSet myDataSet = new DataSet();
            //    myDA.Fill(myDataSet, "Book");
            //    dataGridView2.DataSource = myDataSet.Tables["Book"].DefaultView;
            //    con.Close();
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }

        private void txtJointAuthors_TextChanged(object sender, EventArgs e)
        {
            //try
            //{
            //    con = new SqlConnection(cs.DBcon);

            //    con.Open();
            //    cmd = new SqlCommand("SELECT RTRIM(AccessionNo) as [Accession No],RTRIM(BookTitle) as [Book Title],RTRIM(Author) as [Author], RTRIM(JointAuthors) as [Joint Authors],RTRIM(Subject) as [Subject],RTRIM(Department) as [Department],RTRIM (Barcode) as [Barcode],RTRIM (ISBN) as [ISBN],RTRIM(Volume)as[Volume],RTRIM(Edition) as[Edition],RTRIM(Publisher) as [Publisher],RTRIM(PlaceOfPublisher) as [Place Of Publisher],RTRIM(CD) as[CD],RTRIM(PublishingYear) as [Publishing Year],RTRIM(Reference) as [Refrence],RTRIM(AlmiraPosition) as [Almira Position],RTRIM(Price) as [price],convert(Datetime,BillDate,103) as [Bill Date],SupplierName,Remarks from book  where jointAuthors Like '" +txtJointAuthors.Text + "%' order by jointAuthors", con);
            //    SqlDataAdapter myDA = new SqlDataAdapter(cmd);
            //    DataSet myDataSet = new DataSet();
            //    myDA.Fill(myDataSet, "Book");
            //    dataGridView2.DataSource = myDataSet.Tables["Book"].DefaultView;
            //    con.Close();
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }

        private void cmbAccessionNo_SelectedIndexChanged(object sender, EventArgs e)
        {
            //try
            //{
            //    con = new SqlConnection(cs.DBcon);

            //    con.Open();
            //    cmd = new SqlCommand("SELECT RTRIM(AccessionNo) as [Accession No],RTRIM(BookTitle) as [Book Title],RTRIM(Author) as [Author], RTRIM(JointAuthors) as [Joint Authors],RTRIM(Subject) as [Subject],RTRIM(Department) as [Department],RTRIM (Barcode) as [Barcode],RTRIM (ISBN) as [ISBN],RTRIM(Volume)as[Volume],RTRIM(Edition) as[Edition],RTRIM(Publisher) as [Publisher],RTRIM(PlaceOfPublisher) as [Place Of Publisher],RTRIM(CD) as[CD],RTRIM(PublishingYear) as [Publishing Year],RTRIM(Reference) as [Refrence],RTRIM(AlmiraPosition) as [Almira Position],RTRIM(Price) as [price],convert(Datetime,BillDate,103) as [Bill Date],SupplierName,Remarks from book  where AccessionNo='" +cmbAccessionNo.Text + "' order by BookTitle", con);
            //  DataSource = myDataSet.Tables["Book"].DefaultView;
            //    con.Close();
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }

        private void cmbSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
        //    try
        //    {
        //        con = new SqlConnection(cs.DBcon);

        //        con.Open();
        //        cmd = new SqlCommand("SELECT RTRIM(AccessionNo) as [Accession No],RTRIM(BookTitle) as [Book Title],RTRIM(Author) as [Author], RTRIM(JointAuthors) as [Joint Authors],RTRIM(Subject) as [Subject],RTRIM(Department) as [Department],RTRIM (Barcode) as [Barcode],RTRIM (ISBN) as [ISBN],RTRIM(Volume)as[Volume],RTRIM(Edition) as[Edition],RTRIM(Publisher) as [Publisher],RTRIM(PlaceOfPublisher) as [Place Of Publisher],RTRIM(CD) as[CD],RTRIM(PublishingYear) as [Publishing Year],RTRIM(Reference) as [Refrence],RTRIM(AlmiraPosition) as [Almira Position],RTRIM(Price) as [price],convert(Datetime,BillDate,103) as [Bill Date],SupplierName,Remarks from book  where Subject='" +cmbSubject.Text + "' order by BookTitle", con);
        //        SqlDataAdapter myDA = new SqlDataAdapter(cmd);
        //        DataSet myDataSet = new DataSet();
        //        myDA.Fill(myDataSet, "Book");
        //        dataGridView4.DataSource = myDataSet.Tables["Book"].DefaultView;
        //        con.Close();
        //    }
        //    catch (Exception ex)
        //    {
        //        MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        //    }
        }

        private void txtSubject_TextChanged(object sender, EventArgs e)
        {
                //try
                //{
                //    con = new SqlConnection(cs.DBcon);

                //    con.Open();
                //    cmd = new SqlCommand("SELECT RTRIM(AccessionNo) as [Accession No],RTRIM(BookTitle) as [Book Title],RTRIM(Author) as [Author], RTRIM(JointAuthors) as [Joint Authors],RTRIM(Subject) as [Subject],RTRIM(Department) as [Department],RTRIM (Barcode) as [Barcode],RTRIM (ISBN) as [ISBN],RTRIM(Volume)as[Volume],RTRIM(Edition) as[Edition],RTRIM(Publisher) as [Publisher],RTRIM(PlaceOfPublisher) as [Place Of Publisher],RTRIM(CD) as[CD],RTRIM(PublishingYear) as [Publishing Year],RTRIM(Reference) as [Refrence],RTRIM(AlmiraPosition) as [Almira Position],RTRIM(Price) as [price],convert(Datetime,BillDate,103) as [Bill Date],SupplierName,Remarks from book  where Subject Like '" +txtSubject.Text + "%' order by jointAuthors", con);
                //    SqlDataAdapter myDA = new SqlDataAdapter(cmd);
                //    DataSet myDataSet = new DataSet();
                //    myDA.Fill(myDataSet, "Book");
                //    dataGridView4.DataSource = myDataSet.Tables["Book"].DefaultView;
                //    con.Close();
                //}
                //catch (Exception ex)
                //{
                //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                //}
        }

        private void cmbDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            //try
            //{
            //    con = new SqlConnection(cs.DBcon);

            //    con.Open();
            //    cmd = new SqlCommand("SELECT RTRIM(AccessionNo) as [Accession No],RTRIM(BookTitle) as [Book Title],RTRIM(Author) as [Author], RTRIM(JointAuthors) as [Joint Authors],RTRIM(Subject) as [Subject],RTRIM(Department) as [Department],RTRIM (Barcode) as [Barcode],RTRIM (ISBN) as [ISBN],RTRIM(Volume)as[Volume],RTRIM(Edition) as[Edition],RTRIM(Publisher) as [Publisher],RTRIM(PlaceOfPublisher) as [Place Of Publisher],RTRIM(CD) as[CD],RTRIM(PublishingYear) as [Publishing Year],RTRIM(Reference) as [Refrence],RTRIM(AlmiraPosition) as [Almira Position],RTRIM(Price) as [price],convert(Datetime,BillDate,103) as [Bill Date],SupplierName,Remarks from book  where Department='" + cmbDepartment.Text + "' order by Department", con);
            //    SqlDataAdapter myDA = new SqlDataAdapter(cmd);
            //    DataSet myDataSet = new DataSet();
            //    myDA.Fill(myDataSet, "Book");
            //    DataGridView6.DataSource = myDataSet.Tables["Book"].DefaultView;
            //    con.Close();
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }

        private void txtDepartment_TextChanged(object sender, EventArgs e)
        {
            // try
            //{
            //    con = new SqlConnection(cs.DBcon);

            //    con.Open();
            //    cmd = new SqlCommand("SELECT RTRIM(AccessionNo) as [Accession No],RTRIM(BookTitle) as [Book Title],RTRIM(Author) as [Author], RTRIM(JointAuthors) as [Joint Authors],RTRIM(Subject) as [Subject],RTRIM(Department) as [Department],RTRIM (Barcode) as [Barcode],RTRIM (ISBN) as [ISBN],RTRIM(Volume)as[Volume],RTRIM(Edition) as[Edition],RTRIM(Publisher) as [Publisher],RTRIM(PlaceOfPublisher) as [Place Of Publisher],RTRIM(CD) as[CD],RTRIM(PublishingYear) as [Publishing Year],RTRIM(Reference) as [Refrence],RTRIM(AlmiraPosition) as [Almira Position],RTRIM(Price) as [price],convert(Datetime,BillDate,103) as [Bill Date],SupplierName,Remarks from book  where Department Like '" +txtDepartment.Text + "%' order by Department", con);
            
            //    myDA.Fill(myDataSet, "Book");
            //    DataGridView6.DataSource = myDataSet.Tables["Book"].DefaultView;
            //    con.Close();
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        
        }

        private void cmbRfBook_SelectedIndexChanged(object sender, EventArgs e)
        {
            //try
            //{
            //    con = new SqlConnection(cs.DBcon);

            //    con.Open();
            //    cmd = new SqlCommand("SELECT RTRIM(AccessionNo) as [Accession No],RTRIM(BookTitle) as [Book Title],RTRIM(Author) as [Author], RTRIM(JointAuthors) as [Joint Authors],RTRIM(Subject) as [Subject],RTRIM(Department) as [Department],RTRIM (Barcode) as [Barcode],RTRIM (ISBN) as [ISBN],RTRIM(Volume)as[Volume],RTRIM(Edition) as[Edition],RTRIM(Publisher) as [Publisher],RTRIM(PlaceOfPublisher) as [Place Of Publisher],RTRIM(CD) as[CD],RTRIM(PublishingYear) as [Publishing Year],RTRIM(Reference) as [Refrence],RTRIM(AlmiraPosition) as [Almira Position],RTRIM(Price) as [price],convert(Datetime,BillDate,103) as [Bill Date],SupplierName,Remarks from book  where Reference='" + cmbRfBook.Text+ "' order by Reference", con);
            //    SqlDataAdapter myDA = new SqlDataAdapter(cmd);
            //    DataSet myDataSet = new DataSet();
            //    myDA.Fill(myDataSet, "Book");
            //    DataGridView7.DataSource = myDataSet.Tables["Book"].DefaultView;
            //    con.Close();
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }

        private void txtRFBooks_TextChanged(object sender, EventArgs e)
        {
            //try
            //{
            //    con = new SqlConnection(cs.DBcon);

            //    con.Open();
            //    cmd = new SqlCommand("SELECT RTRIM(AccessionNo) as [Accession No],RTRIM(BookTitle) as [Book Title],RTRIM(Author) as [Author], RTRIM(JointAuthors) as [Joint Authors],RTRIM(Subject) as [Subject],RTRIM(Department) as [Department],RTRIM (Barcode) as [Barcode],RTRIM (ISBN) as [ISBN],RTRIM(Volume)as[Volume],RTRIM(Edition) as[Edition],RTRIM(Publisher) as [Publisher],RTRIM(PlaceOfPublisher) as [Place Of Publisher],RTRIM(CD) as[CD],RTRIM(PublishingYear) as [Publishing Year],RTRIM(Reference) as [Refrence],RTRIM(AlmiraPosition) as [Almira Position],RTRIM(Price) as [price],convert(Datetime,BillDate,103) as [Bill Date],SupplierName,Remarks from book  where Reference Like '" + txtRFBooks.Text + "%' order by Reference", con);
            //    SqlDataAdapter myDA = new SqlDataAdapter(cmd);
            //    DataSet myDataSet = new DataSet();
            //    myDA.Fill(myDataSet, "Book");
            //    DataGridView7.DataSource = myDataSet.Tables["Book"].DefaultView;
            //    con.Close();
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }

        private void Button16_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    con = new SqlConnection(cs.DBcon);

            //    con.Open();
            //    cmd = new SqlCommand("SELECT RTRIM(AccessionNo) as [Accession No],RTRIM(BookTitle) as [Book Title],RTRIM(Author) as [Author], RTRIM(JointAuthors) as [Joint Authors],RTRIM(Subject) as [Subject],RTRIM(Department) as [Department],RTRIM (Barcode) as [Barcode],RTRIM (ISBN) as [ISBN],RTRIM(Volume)as[Volume],RTRIM(Edition) as[Edition],RTRIM(Publisher) as [Publisher],RTRIM(PlaceOfPublisher) as [Place Of Publisher],RTRIM(CD) as[CD],RTRIM(PublishingYear) as [Publishing Year],RTRIM(Reference) as [Refrence],RTRIM(AlmiraPosition) as [Almira Position],RTRIM(Price) as [price],convert(Datetime,BillDate,103) as [Bill Date],SupplierName,Remarks from book order By BookTitle", con);
            //    SqlDataAdapter myDA = new SqlDataAdapter(cmd);
            //    DataSet myDataSet = new DataSet();
            //    myDA.Fill(myDataSet, "Book");
            //    DataGridView8.DataSource = myDataSet.Tables["Book"].DefaultView;
            //    con.Close();
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }

        private void button6_Click(object sender, EventArgs e)
        {
            cmbBookTitle.Text = "";
            txtBookTitle.Text = "";
            dataGridView1.DataSource = "";
        }

        private void button9_Click(object sender, EventArgs e)
        {
            cmbAuthor.Text = "";
            txtAuthor.Text = "";
            dataGridView2.DataSource = "";
        }

        private void button2_Click(object sender, EventArgs e)
        {
            cmbAccessionNo.Text = "";
            txtAccessionNo.Text = "";
            dataGridView3.DataSource = "";
        }

        private void button8_Click(object sender, EventArgs e)
        {
            cmbSubject.Text = "";
            txtSubject.Text = "";
            dataGridView4.DataSource = "";
        }

        private void Button11_Click(object sender, EventArgs e)
        {
            cmbDepartment.Text = "";
            txtDepartment.Text = "";
            DataGridView6.DataSource = "";
        }

        private void Button13_Click(object sender, EventArgs e)
        {
            cmbRfBook.Text = "";
            txtRFBooks.Text = "";
            DataGridView7.DataSource = "";
        }

        private void Button15_Click(object sender, EventArgs e)
        {
            DataGridView8.DataSource = "";
        }
       
        private void dataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
              DataGridViewRow dr = dataGridView1.SelectedRows[0];
            this.Hide();
            frmBookEntry frm  = new frmBookEntry();
            frm.Show();



            frm.cmbCD.Text = dr.Cells[12].Value.ToString();

            frm.cmbReference.Text = dr.Cells[14].Value.ToString();
            frm.TextBox1.Text= dr.Cells[0].Value.ToString();
            frm.txtAccessionNo.Text = dr.Cells[0].Value.ToString();
            frm.txtBookTitle.Text = dr.Cells[1].Value.ToString();
            frm.txtAuthor.Text = dr.Cells[2].Value.ToString();
           frm.txtJointAuthor.Text = dr.Cells[3].Value.ToString();
           frm.cmbSubject.Text = dr.Cells[4].Value.ToString();

            frm.cmbDepartment.Text= dr.Cells[5].Value.ToString();
             frm.txtBarcode.Text = dr.Cells[6].Value.ToString();
            
            frm.txtISBN.Text = dr.Cells[7].Value.ToString();
            frm.txtVolume.Text = dr.Cells[8].Value.ToString();
            frm.txtEdition.Text= dr.Cells[9].Value.ToString();
            frm.txtPublisherName.Text = dr.Cells[10].Value.ToString();
           frm.txtPlaceOfPublisher.Text= dr.Cells[11].Value.ToString();
           frm.txtPublishingYear.Text= dr.Cells[13].Value.ToString();
            frm.txtAlmiraPosition.Text = dr.Cells[15].Value.ToString();
            frm.txtPrice.Text= dr.Cells[16].Value.ToString();
                 frm.dtpBillDate.Text= dr.Cells[17].Value.ToString();
                 frm.cmbSupplierName.Text = dr.Cells[18].Value.ToString();
                frm.txtRemarks.Text = dr.Cells[19].Value.ToString();
                frm.lblUser.Text = lblUser.Text;
                frm.lblUserType.Text = lblUserType.Text;
             frm.btnDelete.Enabled = true;
            frm.btnUpdate_record.Enabled = true;
            frm.txtAccessionNo.Enabled = false;
            frm.btnSave.Enabled =false;
            set.Text = "";
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void dataGridView2_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try{
            DataGridViewRow dr = dataGridView2.SelectedRows[0];
            this.Hide();
            frmBookEntry frm = new frmBookEntry();

            // or simply use column name instead of index
            //dr.Cells["id"].Value.ToString();
            frm.Show();
            frm.cmbCD.Text = dr.Cells[12].Value.ToString();

            frm.cmbReference.Text = dr.Cells[14].Value.ToString();

            frm.txtAccessionNo.Text = dr.Cells[0].Value.ToString();
            frm.txtBookTitle.Text = dr.Cells[1].Value.ToString();
            frm.txtAuthor.Text = dr.Cells[2].Value.ToString();
            frm.txtJointAuthor.Text = dr.Cells[3].Value.ToString();
            frm.cmbSubject.Text = dr.Cells[4].Value.ToString();

            frm.cmbDepartment.Text = dr.Cells[5].Value.ToString();
            frm.txtBarcode.Text = dr.Cells[6].Value.ToString();

            frm.txtISBN.Text = dr.Cells[7].Value.ToString();
            frm.txtVolume.Text = dr.Cells[8].Value.ToString();
            frm.txtEdition.Text = dr.Cells[9].Value.ToString();
            frm.txtPublisherName.Text = dr.Cells[10].Value.ToString();
            frm.txtPlaceOfPublisher.Text = dr.Cells[11].Value.ToString();
            frm.txtPublishingYear.Text = dr.Cells[13].Value.ToString();

            frm.cmbSupplierName.Text = dr.Cells[18].Value.ToString();
            frm.txtRemarks.Text = dr.Cells[19].Value.ToString();
            frm.lblUser.Text = lblUser.Text;
            frm.lblUserType.Text = lblUserType.Text;
            frm.btnDelete.Enabled = true;
            frm.btnUpdate_record.Enabled = true;
            frm.txtAccessionNo.Enabled = false;
            frm.btnSave.Enabled = false;
        }
         catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
}
        private void dataGridView3_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow dr = dataGridView3.SelectedRows[0];
                this.Hide();
                frmBookEntry frm = new frmBookEntry();

                // or simply use column name instead of index
                //dr.Cells["id"].Value.ToString();
                frm.Show();
                frm.cmbCD.Text = dr.Cells[12].Value.ToString();

                frm.cmbReference.Text = dr.Cells[14].Value.ToString();
                frm.txtAccessionNo.Text = dr.Cells[0].Value.ToString();
                frm.txtBookTitle.Text = dr.Cells[1].Value.ToString();
                frm.txtAuthor.Text = dr.Cells[2].Value.ToString();
                frm.txtJointAuthor.Text = dr.Cells[3].Value.ToString();
                frm.cmbSubject.Text = dr.Cells[4].Value.ToString();

                frm.cmbDepartment.Text = dr.Cells[5].Value.ToString();
                frm.txtBarcode.Text = dr.Cells[6].Value.ToString();

                frm.txtPublisherName.Text = dr.Cells[10].Value.ToString();
                frm.txtPlaceOfPublisher.Text = dr.Cells[11].Value.ToString();
                frm.txtPublishingYear.Text = dr.Cells[13].Value.ToString();
                frm.txtAlmiraPosition.Text = dr.Cells[15].Value.ToString();
                frm.txtPrice.Text = dr.Cells[16].Value.ToString();
                frm.dtpBillDate.Text = dr.Cells[17].Value.ToString();
                frm.cmbSupplierName.Text = dr.Cells[18].Value.ToString();
                frm.txtRemarks.Text = dr.Cells[19].Value.ToString();
                frm.lblUser.Text = lblUser.Text;
                frm.lblUserType.Text = lblUserType.Text;
                frm.btnDelete.Enabled = true;
                frm.btnUpdate_record.Enabled = true;
                frm.txtAccessionNo.Enabled = false;
                frm.btnSave.Enabled = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void dataGridView4_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow dr = dataGridView4.SelectedRows[0];
                this.Hide();
                frmBookEntry frm = new frmBookEntry();
                frm.Show();
                frm.cmbCD.Text = dr.Cells[12].Value.ToString();

                frm.cmbReference.Text = dr.Cells[14].Value.ToString();

                frm.txtAccessionNo.Text = dr.Cells[0].Value.ToString();
                frm.txtBookTitle.Text = dr.Cells[1].Value.ToString();
                frm.txtAuthor.Text = dr.Cells[2].Value.ToString();
                frm.txtJointAuthor.Text = dr.Cells[3].Value.ToString();
                frm.cmbSubject.Text = dr.Cells[4].Value.ToString();

                frm.cmbDepartment.Text = dr.Cells[5].Value.ToString();
                frm.txtBarcode.Text = dr.Cells[6].Value.ToString();

                frm.txtISBN.Text = dr.Cells[7].Value.ToString();
                frm.txtVolume.Text = dr.Cells[8].Value.ToString();
                frm.txtEdition.Text = dr.Cells[9].Value.ToString();
                frm.txtPublisherName.Text = dr.Cells[10].Value.ToString();
                frm.txtPlaceOfPublisher.Text = dr.Cells[11].Value.ToString();
                frm.txtPublishingYear.Text = dr.Cells[13].Value.ToString();
                frm.txtAlmiraPosition.Text = dr.Cells[15].Value.ToString();
                frm.txtPrice.Text = dr.Cells[16].Value.ToString();
                frm.dtpBillDate.Text = dr.Cells[17].Value.ToString();
                frm.cmbSupplierName.Text = dr.Cells[18].Value.ToString();
                frm.txtRemarks.Text = dr.Cells[19].Value.ToString();
                frm.lblUser.Text = lblUser.Text;
                frm.lblUserType.Text = lblUserType.Text;
                frm.btnDelete.Enabled = true;
                frm.btnUpdate_record.Enabled = true;
                frm.txtAccessionNo.Enabled = false;
                frm.btnSave.Enabled = false; ;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void DataGridView6_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow dr = DataGridView6.SelectedRows[0];
                this.Hide();
                frmBookEntry frm = new frmBookEntry();
                frm.Show();
                frm.cmbCD.Text = dr.Cells[12].Value.ToString();

                frm.cmbReference.Text = dr.Cells[14].Value.ToString();

                frm.txtAccessionNo.Text = dr.Cells[0].Value.ToString();
                frm.txtBookTitle.Text = dr.Cells[1].Value.ToString();
                frm.txtAuthor.Text = dr.Cells[2].Value.ToString();
                frm.txtJointAuthor.Text = dr.Cells[3].Value.ToString();
                frm.cmbSubject.Text = dr.Cells[4].Value.ToString();

                frm.cmbDepartment.Text = dr.Cells[5].Value.ToString();
                frm.txtBarcode.Text = dr.Cells[6].Value.ToString();

                frm.txtISBN.Text = dr.Cells[7].Value.ToString();
                frm.txtVolume.Text = dr.Cells[8].Value.ToString();
                frm.txtEdition.Text = dr.Cells[9].Value.ToString();
                frm.txtPublisherName.Text = dr.Cells[10].Value.ToString();
                frm.txtPlaceOfPublisher.Text = dr.Cells[11].Value.ToString();
                frm.txtPublishingYear.Text = dr.Cells[13].Value.ToString();
                frm.txtAlmiraPosition.Text = dr.Cells[15].Value.ToString();
                frm.txtPrice.Text = dr.Cells[16].Value.ToString();
                frm.dtpBillDate.Text = dr.Cells[17].Value.ToString();
                frm.cmbSupplierName.Text = dr.Cells[18].Value.ToString();
                frm.txtRemarks.Text = dr.Cells[19].Value.ToString();
                frm.lblUser.Text = lblUser.Text;
                frm.lblUserType.Text = lblUserType.Text;
                frm.btnDelete.Enabled = true;
                frm.btnUpdate_record.Enabled = true;
                frm.txtAccessionNo.Enabled = false;
                frm.btnSave.Enabled = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void DataGridView7_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {

                DataGridViewRow dr = DataGridView7.SelectedRows[0];
                this.Hide();
                frmBookEntry frm = new frmBookEntry();
                frm.Show();
                frm.cmbCD.Text = dr.Cells[12].Value.ToString();

                frm.cmbReference.Text = dr.Cells[14].Value.ToString();

                frm.txtAccessionNo.Text = dr.Cells[0].Value.ToString();
                frm.txtBookTitle.Text = dr.Cells[1].Value.ToString();
                frm.txtAuthor.Text = dr.Cells[2].Value.ToString();
                frm.txtJointAuthor.Text = dr.Cells[3].Value.ToString();
                frm.cmbSubject.Text = dr.Cells[4].Value.ToString();

                frm.cmbDepartment.Text = dr.Cells[5].Value.ToString();
                frm.txtBarcode.Text = dr.Cells[6].Value.ToString();

                frm.txtISBN.Text = dr.Cells[7].Value.ToString();
                frm.txtVolume.Text = dr.Cells[8].Value.ToString();
                frm.txtEdition.Text = dr.Cells[9].Value.ToString();
                frm.txtPublisherName.Text = dr.Cells[10].Value.ToString();
                frm.txtPlaceOfPublisher.Text = dr.Cells[11].Value.ToString();
                frm.txtPublishingYear.Text = dr.Cells[13].Value.ToString();
                frm.txtAlmiraPosition.Text = dr.Cells[15].Value.ToString();
                frm.txtPrice.Text = dr.Cells[16].Value.ToString();
                frm.dtpBillDate.Text = dr.Cells[17].Value.ToString();
                frm.cmbSupplierName.Text = dr.Cells[18].Value.ToString();
                frm.txtRemarks.Text = dr.Cells[19].Value.ToString();
                frm.lblUser.Text = lblUser.Text;
                frm.lblUserType.Text = lblUserType.Text;
                frm.btnDelete.Enabled = true;
                frm.btnUpdate_record.Enabled = true;
                frm.txtAccessionNo.Enabled = false;
                frm.btnSave.Enabled = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void DataGridView8_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow dr = DataGridView8.SelectedRows[0];
                this.Hide();
                frmBookEntry frm = new frmBookEntry();
                frm.Show();
                frm.cmbCD.Text = dr.Cells[12].Value.ToString();

                frm.cmbReference.Text = dr.Cells[14].Value.ToString();

                frm.txtAccessionNo.Text = dr.Cells[0].Value.ToString();
                frm.txtBookTitle.Text = dr.Cells[1].Value.ToString();
                frm.txtAuthor.Text = dr.Cells[2].Value.ToString();
                frm.txtJointAuthor.Text = dr.Cells[3].Value.ToString();
                frm.cmbSubject.Text = dr.Cells[4].Value.ToString();

                frm.cmbDepartment.Text = dr.Cells[5].Value.ToString();
                frm.txtBarcode.Text = dr.Cells[6].Value.ToString();

                frm.txtISBN.Text = dr.Cells[7].Value.ToString();
                frm.txtVolume.Text = dr.Cells[8].Value.ToString();
                frm.txtEdition.Text = dr.Cells[9].Value.ToString();
                frm.txtPublisherName.Text = dr.Cells[10].Value.ToString();
                frm.txtPlaceOfPublisher.Text = dr.Cells[11].Value.ToString();
                frm.txtPublishingYear.Text = dr.Cells[13].Value.ToString();
                frm.txtAlmiraPosition.Text = dr.Cells[15].Value.ToString();
                frm.txtPrice.Text = dr.Cells[16].Value.ToString();
                frm.dtpBillDate.Text = dr.Cells[17].Value.ToString();
                frm.cmbSupplierName.Text = dr.Cells[18].Value.ToString();
                frm.txtRemarks.Text = dr.Cells[19].Value.ToString();
                frm.lblUser.Text = lblUser.Text;
                frm.lblUserType.Text = lblUserType.Text;
                frm.btnDelete.Enabled = true;
                frm.btnUpdate_record.Enabled = true;
                frm.txtAccessionNo.Enabled = false;
                frm.btnSave.Enabled = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void frmBookEntryRecords_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Hide();
            frmBookEntry frm = new frmBookEntry();
            frm.lblUserType.Text = lblUserType.Text;
            frm.lblUser.Text = lblUser.Text;
            frm.Show();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void DataGridView8_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            {
                string strRowNumber = (e.RowIndex + 1).ToString();
                SizeF size = e.Graphics.MeasureString(strRowNumber, this.Font);
                if (DataGridView8.RowHeadersWidth < Convert.ToInt32((size.Width + 20)))
                {
                    DataGridView8.RowHeadersWidth = Convert.ToInt32((size.Width + 20));
                }
                Brush b = SystemBrushes.ControlText;
                e.Graphics.DrawString(strRowNumber, this.Font, b, e.RowBounds.Location.X + 15, e.RowBounds.Location.Y + ((e.RowBounds.Height - size.Height) / 2));
            }
        }

        private void DataGridView7_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            {
                string strRowNumber = (e.RowIndex + 1).ToString();
                SizeF size = e.Graphics.MeasureString(strRowNumber, this.Font);
                if (DataGridView7.RowHeadersWidth < Convert.ToInt32((size.Width + 20)))
                {
                    DataGridView7.RowHeadersWidth = Convert.ToInt32((size.Width + 20));
                }
                Brush b = SystemBrushes.ControlText;
                e.Graphics.DrawString(strRowNumber, this.Font, b, e.RowBounds.Location.X + 15, e.RowBounds.Location.Y + ((e.RowBounds.Height - size.Height) / 2));
            }
        }

        private void DataGridView6_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            {
                string strRowNumber = (e.RowIndex + 1).ToString();
                SizeF size = e.Graphics.MeasureString(strRowNumber, this.Font);
                if (DataGridView6.RowHeadersWidth < Convert.ToInt32((size.Width + 20)))
                {
                    DataGridView6.RowHeadersWidth = Convert.ToInt32((size.Width + 20));
                }
                Brush b = SystemBrushes.ControlText;
                e.Graphics.DrawString(strRowNumber, this.Font, b, e.RowBounds.Location.X + 15, e.RowBounds.Location.Y + ((e.RowBounds.Height - size.Height) / 2));
            }
        }

        private void dataGridView4_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            {
                string strRowNumber = (e.RowIndex + 1).ToString();
                SizeF size = e.Graphics.MeasureString(strRowNumber, this.Font);
                if (dataGridView4.RowHeadersWidth < Convert.ToInt32((size.Width + 20)))
                {
                    dataGridView4.RowHeadersWidth = Convert.ToInt32((size.Width + 20));
                }
                Brush b = SystemBrushes.ControlText;
                e.Graphics.DrawString(strRowNumber, this.Font, b, e.RowBounds.Location.X + 15, e.RowBounds.Location.Y + ((e.RowBounds.Height - size.Height) / 2));
            }
        }

        private void dataGridView3_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            {
                string strRowNumber = (e.RowIndex + 1).ToString();
                SizeF size = e.Graphics.MeasureString(strRowNumber, this.Font);
                if (dataGridView4.RowHeadersWidth < Convert.ToInt32((size.Width + 20)))
                {
                    dataGridView4.RowHeadersWidth = Convert.ToInt32((size.Width + 20));
                }
                Brush b = SystemBrushes.ControlText;
                e.Graphics.DrawString(strRowNumber, this.Font, b, e.RowBounds.Location.X + 15, e.RowBounds.Location.Y + ((e.RowBounds.Height - size.Height) / 2));
            }
        }

        private void dataGridView2_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            {
                string strRowNumber = (e.RowIndex + 1).ToString();
                SizeF size = e.Graphics.MeasureString(strRowNumber, this.Font);
                if (dataGridView2.RowHeadersWidth < Convert.ToInt32((size.Width + 20)))
                {
                    dataGridView2.RowHeadersWidth = Convert.ToInt32((size.Width + 20));
                }
                Brush b = SystemBrushes.ControlText;
                e.Graphics.DrawString(strRowNumber, this.Font, b, e.RowBounds.Location.X + 15, e.RowBounds.Location.Y + ((e.RowBounds.Height - size.Height) / 2));
            }
        }

        private void dataGridView1_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            {
                string strRowNumber = (e.RowIndex + 1).ToString();
                SizeF size = e.Graphics.MeasureString(strRowNumber, this.Font);
                if (dataGridView1.RowHeadersWidth < Convert.ToInt32((size.Width + 20)))
                {
                    dataGridView1.RowHeadersWidth = Convert.ToInt32((size.Width + 20));
                }
                Brush b = SystemBrushes.ControlText;
                e.Graphics.DrawString(strRowNumber, this.Font, b, e.RowBounds.Location.X + 15, e.RowBounds.Location.Y + ((e.RowBounds.Height - size.Height) / 2));
            }
        }

        private void ExportExcel_Click(object sender, EventArgs e)
        {
            if (dataGridView1.DataSource == null)
            {
                MessageBox.Show("Sorry nothing to export into excel sheet..", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            int rowsTotal = 0;
            int colsTotal = 0;
            int I = 0;
            int j = 0;
            int iC = 0;
            System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.WaitCursor;
            Excel.Application xlApp = new Excel.Application();

            try
            {
                Excel.Workbook excelBook = xlApp.Workbooks.Add();
                Excel.Worksheet excelWorksheet = (Excel.Worksheet)excelBook.Worksheets[1];
                xlApp.Visible = true;

                rowsTotal = dataGridView1.RowCount - 1;
                colsTotal = dataGridView1.Columns.Count - 1;
                var _with1 = excelWorksheet;
                _with1.Cells.Select();
                _with1.Cells.Delete();
                for (iC = 0; iC <= colsTotal; iC++)
                {
                    _with1.Cells[1, iC + 1].Value = dataGridView1.Columns[iC].HeaderText;
                }
                for (I = 0; I <= rowsTotal - 1; I++)
                {
                    for (j = 0; j <= colsTotal; j++)
                    {
                        _with1.Cells[I + 2, j + 1].value = dataGridView1.Rows[I].Cells[j].Value;
                    }
                }
                _with1.Rows["1:1"].Font.FontStyle = "Bold";
                _with1.Rows["1:1"].Font.Size = 12;

                _with1.Cells.Columns.AutoFit();
                _with1.Cells.Select();
                _with1.Cells.EntireColumn.AutoFit();
                _with1.Cells[1, 1].Select();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                //RELEASE ALLOACTED RESOURCES
                System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default;
                xlApp = null;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (dataGridView3.DataSource == null)
            {
                MessageBox.Show("Sorry nothing to export into excel sheet..", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            int rowsTotal = 0;
            int colsTotal = 0;
            int I = 0;
            int j = 0;
            int iC = 0;
            System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.WaitCursor;
            Excel.Application xlApp = new Excel.Application();

            try
            {
                Excel.Workbook excelBook = xlApp.Workbooks.Add();
                Excel.Worksheet excelWorksheet = (Excel.Worksheet)excelBook.Worksheets[1];
                xlApp.Visible = true;

                rowsTotal = dataGridView3.RowCount - 1;
                colsTotal = dataGridView3.Columns.Count - 1;
                var _with1 = excelWorksheet;
                _with1.Cells.Select();
                _with1.Cells.Delete();
                for (iC = 0; iC <= colsTotal; iC++)
                {
                    _with1.Cells[1, iC + 1].Value = dataGridView3.Columns[iC].HeaderText;
                }
                for (I = 0; I <= rowsTotal - 1; I++)
                {
                    for (j = 0; j <= colsTotal; j++)
                    {
                        _with1.Cells[I + 2, j + 1].value = dataGridView3.Rows[I].Cells[j].Value;
                    }
                }
                _with1.Rows["1:1"].Font.FontStyle = "Bold";
                _with1.Rows["1:1"].Font.Size = 12;

                _with1.Cells.Columns.AutoFit();
                _with1.Cells.Select();
                _with1.Cells.EntireColumn.AutoFit();
                _with1.Cells[1, 1].Select();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                //RELEASE ALLOACTED RESOURCES
                System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default;
                xlApp = null;
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (dataGridView4.DataSource == null)
            {
                MessageBox.Show("Sorry nothing to export into excel sheet..", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            int rowsTotal = 0;
            int colsTotal = 0;
            int I = 0;
            int j = 0;
            int iC = 0;
            System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.WaitCursor;
            Excel.Application xlApp = new Excel.Application();

            try
            {
                Excel.Workbook excelBook = xlApp.Workbooks.Add();
                Excel.Worksheet excelWorksheet = (Excel.Worksheet)excelBook.Worksheets[1];
                xlApp.Visible = true;

                rowsTotal = dataGridView4.RowCount - 1;
                colsTotal = dataGridView4.Columns.Count - 1;
                var _with1 = excelWorksheet;
                _with1.Cells.Select();
                _with1.Cells.Delete();
                for (iC = 0; iC <= colsTotal; iC++)
                {
                    _with1.Cells[1, iC + 1].Value = dataGridView4.Columns[iC].HeaderText;
                }
                for (I = 0; I <= rowsTotal - 1; I++)
                {
                    for (j = 0; j <= colsTotal; j++)
                    {
                        _with1.Cells[I + 2, j + 1].value = dataGridView4.Rows[I].Cells[j].Value;
                    }
                }
                _with1.Rows["1:1"].Font.FontStyle = "Bold";
                _with1.Rows["1:1"].Font.Size = 12;

                _with1.Cells.Columns.AutoFit();
                _with1.Cells.Select();
                _with1.Cells.EntireColumn.AutoFit();
                _with1.Cells[1, 1].Select();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                //RELEASE ALLOACTED RESOURCES
                System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default;
                xlApp = null;
            }
        }

        private void Button4_Click(object sender, EventArgs e)
        {
            if (DataGridView6.DataSource == null)
            {
                MessageBox.Show("Sorry nothing to export into excel sheet..", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            int rowsTotal = 0;
            int colsTotal = 0;
            int I = 0;
            int j = 0;
            int iC = 0;
            System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.WaitCursor;
            Excel.Application xlApp = new Excel.Application();

            try
            {
                Excel.Workbook excelBook = xlApp.Workbooks.Add();
                Excel.Worksheet excelWorksheet = (Excel.Worksheet)excelBook.Worksheets[1];
                xlApp.Visible = true;

                rowsTotal = DataGridView6.RowCount - 1;
                colsTotal = DataGridView6.Columns.Count - 1;
                var _with1 = excelWorksheet;
                _with1.Cells.Select();
                _with1.Cells.Delete();
                for (iC = 0; iC <= colsTotal; iC++)
                {
                    _with1.Cells[1, iC + 1].Value = DataGridView6.Columns[iC].HeaderText;
                }
                for (I = 0; I <= rowsTotal - 1; I++)
                {
                    for (j = 0; j <= colsTotal; j++)
                    {
                        _with1.Cells[I + 2, j + 1].value = DataGridView6.Rows[I].Cells[j].Value;
                    }
                }
                _with1.Rows["1:1"].Font.FontStyle = "Bold";
                _with1.Rows["1:1"].Font.Size = 12;

                _with1.Cells.Columns.AutoFit();
                _with1.Cells.Select();
                _with1.Cells.EntireColumn.AutoFit();
                _with1.Cells[1, 1].Select();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                //RELEASE ALLOACTED RESOURCES
                System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default;
                xlApp = null;
            }
        }

        private void Button5_Click(object sender, EventArgs e)
        {
            if (DataGridView7.DataSource == null)
            {
                MessageBox.Show("Sorry nothing to export into excel sheet..", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            int rowsTotal = 0;
            int colsTotal = 0;
            int I = 0;
            int j = 0;
            int iC = 0;
            System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.WaitCursor;
            Excel.Application xlApp = new Excel.Application();

            try
            {
                Excel.Workbook excelBook = xlApp.Workbooks.Add();
                Excel.Worksheet excelWorksheet = (Excel.Worksheet)excelBook.Worksheets[1];
                xlApp.Visible = true;

                rowsTotal = DataGridView7.RowCount - 1;
                colsTotal = DataGridView7.Columns.Count - 1;
                var _with1 = excelWorksheet;
                _with1.Cells.Select();
                _with1.Cells.Delete();
                for (iC = 0; iC <= colsTotal; iC++)
                {
                    _with1.Cells[1, iC + 1].Value = DataGridView7.Columns[iC].HeaderText;
                }
                for (I = 0; I <= rowsTotal - 1; I++)
                {
                    for (j = 0; j <= colsTotal; j++)
                    {
                        _with1.Cells[I + 2, j + 1].value = DataGridView7.Rows[I].Cells[j].Value;
                    }
                }
                _with1.Rows["1:1"].Font.FontStyle = "Bold";
                _with1.Rows["1:1"].Font.Size = 12;

                _with1.Cells.Columns.AutoFit();
                _with1.Cells.Select();
                _with1.Cells.EntireColumn.AutoFit();
                _with1.Cells[1, 1].Select();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                //RELEASE ALLOACTED RESOURCES
                System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default;
                xlApp = null;
            }
        }

        private void Button14_Click(object sender, EventArgs e)
        {
            if (DataGridView8.DataSource == null)
            {
                MessageBox.Show("Sorry nothing to export into excel sheet..", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            int rowsTotal = 0;
            int colsTotal = 0;
            int I = 0;
            int j = 0;
            int iC = 0;
            System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.WaitCursor;
            Excel.Application xlApp = new Excel.Application();

            try
            {
                Excel.Workbook excelBook = xlApp.Workbooks.Add();
                Excel.Worksheet excelWorksheet = (Excel.Worksheet)excelBook.Worksheets[1];
                xlApp.Visible = true;

                rowsTotal = DataGridView8.RowCount - 1;
                colsTotal = DataGridView8.Columns.Count - 1;
                var _with1 = excelWorksheet;
                _with1.Cells.Select();
                _with1.Cells.Delete();
                for (iC = 0; iC <= colsTotal; iC++)
                {
                    _with1.Cells[1, iC + 1].Value = DataGridView8.Columns[iC].HeaderText;
                }
                for (I = 0; I <= rowsTotal - 1; I++)
                {
                    for (j = 0; j <= colsTotal; j++)
                    {
                        _with1.Cells[I + 2, j + 1].value = DataGridView8.Rows[I].Cells[j].Value;
                    }
                }
                _with1.Rows["1:1"].Font.FontStyle = "Bold";
                _with1.Rows["1:1"].Font.Size = 12;

                _with1.Cells.Columns.AutoFit();
                _with1.Cells.Select();
                _with1.Cells.EntireColumn.AutoFit();
                _with1.Cells[1, 1].Select();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                //RELEASE ALLOACTED RESOURCES
                System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default;
                xlApp = null;
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {

            if (dataGridView2.DataSource == null)
            {
                MessageBox.Show("Sorry nothing to export into excel sheet..", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            int rowsTotal = 0;
            int colsTotal = 0;
            int I = 0;
            int j = 0;
            int iC = 0;
            System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.WaitCursor;
            Excel.Application xlApp = new Excel.Application();

            try
            {
                Excel.Workbook excelBook = xlApp.Workbooks.Add();
                Excel.Worksheet excelWorksheet = (Excel.Worksheet)excelBook.Worksheets[1];
                xlApp.Visible = true;

                rowsTotal = dataGridView2.RowCount - 1;
                colsTotal = dataGridView2.Columns.Count - 1;
                var _with1 = excelWorksheet;
                _with1.Cells.Select();
                _with1.Cells.Delete();
                for (iC = 0; iC <= colsTotal; iC++)
                {
                    _with1.Cells[1, iC + 1].Value = dataGridView2.Columns[iC].HeaderText;
                }
                for (I = 0; I <= rowsTotal - 1; I++)
                {
                    for (j = 0; j <= colsTotal; j++)
                    {
                        _with1.Cells[I + 2, j + 1].value = dataGridView2.Rows[I].Cells[j].Value;
                    }
                }
                _with1.Rows["1:1"].Font.FontStyle = "Bold";
                _with1.Rows["1:1"].Font.Size = 12;

                _with1.Cells.Columns.AutoFit();
                _with1.Cells.Select();
                _with1.Cells.EntireColumn.AutoFit();
                _with1.Cells[1, 1].Select();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                //RELEASE ALLOACTED RESOURCES
                System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default;
                xlApp = null;
            }
        }

        }
    }

