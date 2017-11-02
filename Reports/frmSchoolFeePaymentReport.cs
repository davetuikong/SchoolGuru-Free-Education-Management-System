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
    public partial class frmSchoolFeePaymentReport : Form
    {
        School sch = new School();
        DataTable dt = new DataTable();
        TimeManager TM = new TimeManager();
       public  string admno;

        public frmSchoolFeePaymentReport()
        {
            InitializeComponent();
            SchoolParameters();
          
        }



        private void SchoolParameters()
        {

          

            sch.FillComboClass(cmbClassQuery);
            sch.FillComboTerm(cmbTermQuery);
            sch.FillComboFeeType(cmbFeeTypeQuery);
            
            sch.ResetCombos(this);

        }
     
        


        private void FillFeePaymentDetails()
        {
            int feetype = int.Parse(cmbFeeTypeQuery.SelectedValue.ToString());
            int term = int.Parse(cmbTermQuery.SelectedValue.ToString());
           int sclass= int.Parse(cmbClassQuery.SelectedValue.ToString());
        //   MessageBox.Show(feetype.ToString() + sclass.ToString() + term.ToString());
                       
        try
            {
                SQLConn.ConnOpen();

                DataSet ds = new DataSet();
                SQLConn.sqL = "select  CONCAT(firstname, ' ', othername) as student,     s.sclass,  feecharge.term,  feetype, termname , to_char(datein, 'DD-MM-YYYY') as datein  , amount as feeamount  FROM feecharge, schoolterm, studentdetail  as s  WHERE   schoolterm.id=feecharge.term   AND   s.admissionno=feecharge.admissionno    ";
               if(feetype>0 ) SQLConn.sqL +=" AND feetype=  '"+cmbFeeTypeQuery.Text+"'  ";
               if (term > 0) SQLConn.sqL += " AND feecharge.term=  " + term + "";
               if (sclass > 0) SQLConn.sqL += " AND  s.sclass=  '" + cmbClassQuery.Text + "'  ";

            
            SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);
                DataTable dt1 = new DataTable();
                     SQLConn.da.Fill(dt1);
                     ds.Tables.Add(dt1);



                     SQLConn.sqL = "select  feepayment.term, s.sclass, termname,  CONCAT(firstname, ' ' ,othername) as student , feetype,  to_char(datein, 'DD-MM-YYYY') as datein, amount as paidamount FROM feepayment, schoolterm, studentdetail  as s  WHERE   schoolterm.id=feepayment.term   AND   s.admissionno=feepayment.admissionno     ";
                     if (feetype > 0) SQLConn.sqL += " AND feetype=  '" + cmbFeeTypeQuery.Text + "'  ";
                     if (term > 0) SQLConn.sqL += " AND feepayment.term=  " + term + "";
                     if (sclass > 0) SQLConn.sqL += " AND  s.sclass=  '" + cmbClassQuery.Text + "'  ";
            
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                     SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);
                     DataTable dt2 = new DataTable();
                     SQLConn.da.Fill(dt2);


              dt1.Merge(dt2);

              DGV.DataSource = dt1;

        
                SQLConn.ConnClose();
     
     

            }
        catch (Exception ex)
        {
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
         
        }


        }

      

        private void ResetAll() {
            //Student Details
  
           
            sch.ResetCombos(this);
           
            txtFeePaid.Text = "";
            txtFeeAmount.Text = "";
  
          
        }



        







       



        private void frmSchoolFeePayment_Load(object sender, EventArgs e)
        {
            FillFeePaymentDetails();
            Totals();

        }

        private void Totals()
        {

            double sumfee = 0;
            for (int i = 0; i < DGV.Rows.Count; ++i)
            {
                double d = 0;

                var  v= DGV.Rows[i].Cells["feeamount"].Value;
                if (v != null) Double.TryParse(v.ToString(), out d);
                sumfee += d;
            }
            txtFeeAmount.Text = sumfee.ToString();

             double sumpaid = 0;

            for (int i = 0; i < DGV.Rows.Count; ++i)
            {
                double d = 0;
                var v=DGV.Rows[i].Cells["paidamount"].Value;
               if(v!=null) Double.TryParse(v.ToString(), out d);
                sumpaid += d;
            }
            txtFeePaid.Text = sumpaid.ToString();

            txtBalance.Text = (sumfee - sumpaid).ToString();

       
        }

        private void btnFilter_Click(object sender, EventArgs e)
        {
                       
            FillFeePaymentDetails();
            Totals();
        }

        private void btnExport_Click(object sender, EventArgs e)
        {
            SaveFileDialog sfd = new SaveFileDialog();
            sfd.Filter = "Excel Documents (*.xls)|*.xls";
            sfd.FileName = this.Text;
            if (sfd.ShowDialog() == DialogResult.OK)
            {
                //ToCsV(dataGridView1, @"c:\export.xls");
                sch.ToCsV(DGV, sfd.FileName); // Here dataGridview1 is your grid view name

            }
        }

        


    }
}
