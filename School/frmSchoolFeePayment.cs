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
    public partial class frmSchoolFeePayment : Form
    {
        School sch = new School();
        DataTable dt = new DataTable();
        TimeManager TM = new TimeManager();
       public  string admno;

        public frmSchoolFeePayment()
        {
            InitializeComponent();
            SchoolParameters();
          
        }



        private void SchoolParameters()
        {

            sch.FillComboSchool(cmbSchool);

        
            sch.FillComboClass(cmbClassPay);
            sch.FillComboTerm(cmbTermPay);
            sch.FillComboFeeType(cmbFeeTypePay);

            sch.FillComboClass(cmbClassQuery);
            sch.FillComboTerm(cmbTermQuery);
            sch.FillComboFeeType(cmbFeeTypeQuery);
            
            sch.ResetCombos(this);

        }
        private void delRecords()
        {
            
       
           
            SQLConn.sqL= "delete from ClassFeePayment where AdmissionNo='"+txtAdmNo.Text+"'";

             SQLConn.cmd= new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
            SQLConn.cmd.ExecuteNonQuery();
            SQLConn.ConnClose();
            MessageBox.Show("Records deleted Successsfully...");
            ResetAll();
        }
       
        
        private void StudentDetailsConfirmation()
        {
            try {

                Dictionary<string, string> dic = sch.StudentDetails(admno);
                if (dic!=null)
                {
                    txtStudName.Text = dic["firstname"] +" " +dic["othername"];
                    txtAdmissionDate.Text = dic["admissiondate"];
                    cmbSchool.SelectedValue = int.Parse(dic["school"]);
                    txtClass.Text=dic["sclass"];
                    txtTerm.Text = dic["termname"];
                    txtSection.Text=dic["section"];
                    txtCategory.Text=dic["category"];
                
                }
            }
            catch (NpgsqlException exception)
            {
                MessageBox.Show(exception.Message);
            }
        }


        

        private void txtAdmNo_TextChanged(object sender, EventArgs e)
        {
            if (txtAdmNo.Text != "")
            {
                StudentDetailsConfirmation();
                FeePaymentDetails();
                           Totals();
            }
     
        }

        private void FeePaymentDetails()
        {
            int feetype = int.Parse(cmbFeeTypeQuery.SelectedValue.ToString());
            int term = int.Parse(cmbTermQuery.SelectedValue.ToString());
           int sclass= int.Parse(cmbClassQuery.SelectedValue.ToString());
        //   MessageBox.Show(feetype.ToString() + sclass.ToString() + term.ToString());
                       
        try
            {
                SQLConn.ConnOpen();

                DataSet ds = new DataSet();
                SQLConn.sqL = "select  feecharge.term, sclass, amount as feeamount, feetype, termname , to_char(datein, 'DD-MM-YYYY') as datein FROM feecharge   left join schoolterm on schoolterm.id=feecharge.term  WHERE admissionno='" + txtAdmNo.Text + "' ";
               if(feetype>0 ) SQLConn.sqL +=" AND feetype=  '"+cmbFeeTypeQuery.Text+"'  ";
               if (term > 0) SQLConn.sqL += " AND feecharge.term=  " + term + "";
               if (sclass > 0) SQLConn.sqL += " AND sclass=  '" + cmbClassQuery.Text + "'  ";


            SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);
                DataTable dt1 = new DataTable();
                     SQLConn.da.Fill(dt1);
                     ds.Tables.Add(dt1);



                     SQLConn.sqL = "select  feepayment.term, sclass, termname, amount as paidamount, feetype,  to_char(datein, 'DD-MM-YYYY') as datein FROM feepayment  left join schoolterm on schoolterm.id=feepayment.term   WHERE admissionno='" + txtAdmNo.Text + "'  ";
                     if (feetype > 0) SQLConn.sqL += " AND feetype=  '" + cmbFeeTypeQuery.Text + "'  ";
                     if (term > 0) SQLConn.sqL += " AND feepayment.term=  " + term + "";
                     if (sclass > 0) SQLConn.sqL += " AND sclass=  '" + cmbClassQuery.Text + "'  ";
            
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
            txtAdmNo.Text = "";

            txtStudName.Text = "";
            txtAdmissionDate.Text = "";
           
            sch.ResetCombos(this);
            txtTotalPaid.Text = "";
            txtComment.Text = "";
            dtpPaydate.Text = "";
            txtFeePaid.Text = "";
            txtFeeAmount.Text = "";
  
          
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            ResetAll();
            txtAdmNo.Text = admno;
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            
            SQLConn.ConnOpen();
            SQLConn.sqL = "delete from ClassFeePayment where AdmissionNo=@admission";
            SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
            
            SQLConn.cmd.Parameters.AddWithValue("@admission", txtAdmNo.Text);
            SQLConn.dr =SQLConn.cmd.ExecuteReader();

            
            SQLConn.ConnOpen();
            string cb = "insert into ClassFeePayment (AdmissionNo, StudentName, EnrolmentDate, SchoolName, Class, Session, Section, Month, Year, Fee, PaymentMode, Fine, GrandTotal, TotalPaid, PaymentModeDescription, PaymentDate, PreviousDue, CurrentDue) values (@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18)";
            SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
            
            SQLConn.cmd.Parameters.AddWithValue("@1",txtAdmNo.Text);
            SQLConn.cmd.Parameters.AddWithValue("@2", txtStudName.Text);
            SQLConn.cmd.Parameters.AddWithValue("@3", txtAdmissionDate.Text);


            SQLConn.cmd.Parameters.AddWithValue("@8", cmbTermQuery.Text);

            SQLConn.cmd.Parameters.AddWithValue("@10", cmbFeeTypeQuery.Text);
            SQLConn.cmd.Parameters.AddWithValue("@11", cmbPayMode.Text);

            SQLConn.cmd.Parameters.AddWithValue("@14", txtTotalPaid.Text);
            SQLConn.cmd.Parameters.AddWithValue("@15", txtComment.Text);
            SQLConn.cmd.Parameters.AddWithValue("@16", dtpPaydate.Text);
            SQLConn.cmd.Parameters.AddWithValue("@17", txtFeePaid.Text);
            SQLConn.cmd.Parameters.AddWithValue("@18", txtFeeAmount.Text);
            SQLConn.dr = SQLConn.cmd.ExecuteReader();

            MessageBox.Show(txtStudName.Text + " " + " has paid " + txtTotalPaid.Text + " as school fee ", "Payment Records", MessageBoxButtons.OK, MessageBoxIcon.Information);
            ResetAll();

        }

        private void btnDel_Click(object sender, EventArgs e)
        {
            delRecords();
        }

        






        private void lstStudents_KeyDown(object sender, System.Windows.Forms.KeyEventArgs e)
        {
               

            if ( lstStudents.Items.Count == 0)
            {
              txtSearch.Text = "";
                return;

            }
            switch (e.KeyCode)
            {
                case Keys.Up:
                    lstStudents.Select();
                    MoveUp();
                    break;
                case Keys.Down:
               
                    lstStudents.Select();
                    MoveDown();
                    break;
                case Keys.Escape:
                    lstStudents.Visible = false;
                    break;

                case Keys.Enter:
                 
                      txtAdmNo.Text = admno;
                   
                    if (lstStudents.SelectedItems.Count == 0) return;
                    admno = lstStudents.SelectedItems[0].SubItems[0].Text;
                    txtAdmNo.Text = admno;
                    resetSuggest();
                

     
                    break;

            }
            e.Handled = true;



        }

        private void resetSuggest()
        {
            lstStudents.Visible = false;
            txtSearch.Text = "";
        }



        private void MoveUp()
        {
            int cnt = lstStudents.Items.Count;

            if (cnt > 0)
            {
                if (lstStudents.SelectedItems.Count == 0) lstStudents.Items[0].Selected = true;
                int sel = lstStudents.SelectedIndices[0];
                if (sel == 0) lstStudents.Items[0].Selected = true;
                if ( sel==0)
                {
                    return;
                }
                else
                {
                    lstStudents.SelectedItems.Clear();
                   lstStudents.Items[sel -1].Selected = true;
                    sel = 0;


                }
            }



        }

        private void MoveDown()
        {
            int cnt = lstStudents.Items.Count;

              

            if (cnt > 0)
            {
                if (lstStudents.SelectedItems.Count == 0) lstStudents.Items[0].Selected = true;
                int sel = lstStudents.SelectedIndices[0];

                if (sel == 0) lstStudents.Items[0].Selected = true;
                if (sel == cnt-1)
                {

                    return;

                }


                else
                {
                    lstStudents.SelectedItems.Clear();
                 if(sel+1<=cnt-1) lstStudents.Items[sel + 1].Selected = true;
                 sel = 0;

                }

            }



        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {

            txtSearch.ForeColor = System.Drawing.Color.Black;
            if (txtSearch.Text.Trim() == "")
            {  lstStudents.Visible = false;


            }


            else
            {

                 lstStudents.Visible = true;
                 lstStudents.BringToFront();
                 lstStudents.Select();
                sch.SuggestStudent(lstStudents, txtSearch.Text);


            }


        }

      


        private void lstStudents_MouseClick(object sender, MouseEventArgs e)
        {
            if (lstStudents.SelectedItems.Count == 0) return;
            admno = lstStudents.SelectedItems[0].SubItems[0].Text;
            txtAdmNo.Text = admno;
            resetSuggest();


        }

        private void btnReceive_Click(object sender, EventArgs e)
        {

            if (!ValidEntry()) return;
            ReceivePayment();
   
            ResetAll();

            txtAdmNo.Text = admno;
            
       

        }

        private void ReceivePayment()
        {
       
            try
            {
                SQLConn.ConnOpen();
                SQLConn.sqL = "INSERT INTO feepayment(admissionno, term, sclass, feetype, amount, datein, comment  ) VALUES   ";
                SQLConn.sqL += " ('" + admno + "', '" + cmbTermPay.SelectedValue + " ', '" + cmbClassPay.SelectedValue + " ',  '" + cmbFeeTypePay.Text + "',  '" + txtTotalPaid.Text + "', '" + TM.TimeToString(dtpPaydate.Value) + "', '" +txtComment.Text.Trim()+ "')";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);

                SQLConn.cmd.ExecuteNonQuery();
                MessageBox.Show(txtStudName.Text + " " + " has paid " + txtTotalPaid.Text + " as school fee ", " Fee Payment", MessageBoxButtons.OK, MessageBoxIcon.Information);
                SQLConn.ConnClose();
            
            
            }

            catch (NpgsqlException exception)
            {
                MessageBox.Show(exception.Message);
            }
        }

        private void txtTotalPaid_Enter(object sender, EventArgs e)
        {
            txtTotalPaid.Text = "";
        }





        private bool ValidEntry()
        {

            bool valid = true;
            string msg = "";

            if (txtAdmNo.Text == "")
            {
                msg += "Search Student First \n";
                txtSearch.Focus();
                
                valid = false;
            }


            if (cmbPayMode.Text == "Select Payment Mode")
            {
                msg += "Select Payment Mode \n";
                txtSearch.Focus();

                valid = false;
            }


            int num;
            if (!int.TryParse(txtTotalPaid.Text, out  num) || num < 0 || txtTotalPaid.Text == "")
            {

                txtTotalPaid.Focus();
                valid = false;
                msg += "Please enter Valid Payment Amount  \n";

            }
            if (cmbFeeTypePay.SelectedValue.ToString() == "-1" || cmbTermPay.SelectedValue.ToString() == "-1" ||  cmbClassPay.SelectedValue.ToString() == "-1")
            {

                msg += "Please enter Class and  Term \n";

                valid = false;



            }

            if (!valid) MessageBox.Show(msg, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

            return valid;


        }

        private void frmSchoolFeePayment_Load(object sender, EventArgs e)
        {

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
            if (txtAdmNo.Text == "")
            {

                MessageBox.Show("Search Studemt First", "Fee Query");
                txtSearch.Focus();
                return;
            }

            
            FeePaymentDetails();
            Totals();
        }

        


    }
}
