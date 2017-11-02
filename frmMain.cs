using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SchoolGuru
{
    public partial class frmMain : Form
    {
        School sch = new School();  
        public frmMain()
        {
            InitializeComponent();

            SQLConn.dsSchool = sch.dsSchoolParameter("");
        }

        private void logoutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DialogResult iLogout;
            iLogout = MessageBox.Show("Are you sure you want to Logout from the System?", "SCHOOL CONFIRMATION DIALOG", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (iLogout == DialogResult.Yes)
            {

                Application.Exit();

            }

        }

        private void schoolEntryToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //   this.Hide();
            frmSchoolEntry sch = new frmSchoolEntry();
            sch.Show();
        }

        private void masterEntryToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void studentProfileToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmStudentEnrollment std = new frmStudentEnrollment();
            std.txtAdmNo.Focus();
            std.Show();
        }

        private void studentToolStripMenuItem1_Click(object sender, EventArgs e)
        {

        }

        private void studentToolStripMenuItem1_Click_1(object sender, EventArgs e)
        {
            frmStudentRecords stdSearch = new frmStudentRecords();
            stdSearch.Show();
        }

        private void hostelEntryToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // this.Hide();
            frmHostelEntry hostel = new frmHostelEntry();
            hostel.Show();
        }

        private void classFeeEntryToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmSchoolFeeEntry frm = new frmSchoolFeeEntry();

            frm.Show();
        }

        private void studentRecordToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmStudentRecords frm = new frmStudentRecords();
            frm.Show();
        }

        private void hostelersToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Frmhosteler hosteler = new Frmhosteler();
            hosteler.Show();
        }

        private void statusStrip2_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void busCardHoldersToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Bus_Cards_Entry bus = new Bus_Cards_Entry();
            bus.Show();
        }

        private void classFeePaymentToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmSchoolFeePayment clsFeePay = new frmSchoolFeePayment();
            clsFeePay.Show();
        }

        private void classFeePaymentToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            frmSchoolFeePayment cls = new frmSchoolFeePayment();
            cls.Show();
        }

        private void scholarshipPaymentToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void schoolarshipEntryToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmScholarshipEntry schola = new frmScholarshipEntry();
            schola.Show();
        }

        private void scholarshipFeePaymentToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmScholarshipPayment scholar = new frmScholarshipPayment();
            scholar.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void frm_Main_Menu_Load(object sender, EventArgs e)
        {

        }

        private void classToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmClass clas = new frmClass();
            clas.Show();
        }

        private void registrationToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmUserRegistration reg = new frmUserRegistration();
            reg.Show();
        }

        private void calculatorToolStripMenuItem_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("Calc.exe");
        }

        private void taskManagerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("TaskMgr.exe");
        }

        private void notepadToolStripMenuItem_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("Notepad.exe");
        }

        private void calendarToolStripMenuItem_Click(object sender, EventArgs e)
        {
           // System.Diagnostics.Process.Start("Calendar.exe");
        }

        private void msWordToolStripMenuItem_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("winword.exe");
        }

        private void wordpadToolStripMenuItem_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("Wordpad.exe");
        }

        private void msPublisherToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //System.Diagnostics.Process.Start("winPublisher.exe");
        }

        private void eventToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmSchoolCalendar fevnt = new frmSchoolCalendar();
            fevnt.Show();
        }

        private void transactionToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void registrationToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            frmUserRegistration reg = new frmUserRegistration();
            reg.Show();
        }

        private void registrationToolStripMenuItem_Click_2(object sender, EventArgs e)
        {

        }

        private void registrationToolStripMenuItem_Click_3(object sender, EventArgs e)
        {
            frmUserRegistration reg = new frmUserRegistration();
            reg.Show();
        }

        private void examsEntryToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmExamType ee = new frmExamType();
            ee.Show();
        }

        private void departmentToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmDepartment frm = new frmDepartment();
            frm.Show();
        }

        private void bookEntryToolStripMenuItem_Click(object sender, EventArgs e)
        {

            MessageBox.Show("Module Under Development");
            //frmBookEntry frm = new frmBookEntry();
            //frm.Show();
        }

        private void feeCategoryToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmFeeCategory frm = new frmFeeCategory();
            frm.Show();
        }

        private void schoolTermToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmSchoolTerms frm= new frmSchoolTerms();
            frm.Show();

        }

        private void toolStripMenuItem1_Click(object sender, EventArgs e)
        {
            

        }

        private void addStaffToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmStaff frm = new frmStaff();
            frm.Show();

        }

        private void staffRecordsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmStaffRecord frm = new frmStaffRecord();
            frm.Show();
        }

        private void subjectEntryToolStripMenuItem_Click(object sender, EventArgs e)
        {

            frmSubjectRecords frm = new frmSubjectRecords();
          
            frm.Show();


        }

        private void subjectsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmSubjectRecords frm = new frmSubjectRecords();
            frm.Show();
        }

        private void logsToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void contaxtToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void marksEntryToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmMarksEntry frm = new frmMarksEntry();
            frm.Show();
        }

        private void examToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmExamEntry frm = new frmExamEntry();
            frm.Show();
        }

        private void frmMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }

        private void reportsToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void studentEntryToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmStudentEnrollment frm = new frmStudentEnrollment();
            frm.adding = true;
            frm.Show();
        }

        private void classPromotionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmClassBatch frm = new frmClassBatch();
            frm.Show();
        }

        private void schoolFeeChargeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmSchoolFeeCharge frm = new frmSchoolFeeCharge();
            frm.Show();
        }

        private void classFeePaymentToolStripMenuItem1_Click_1(object sender, EventArgs e)
        {
            frmSchoolFeePayment frm = new frmSchoolFeePayment();
            frm.Show();
        }

        private void logsToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            frmDatabaseConfig frm = new frmDatabaseConfig();
            frm.Show();
        }

        private void salaryPaymentToolStripMenuItem1_Click(object sender, EventArgs e)
        {
           frmTeacherSubjectRecords frm = new frmTeacherSubjectRecords();
           frm.Show();
        }

        private void salaryPaymentToolStripMenuItem1_Click_1(object sender, EventArgs e)
        {
            frmTeacherSubjectRecords frm = new frmTeacherSubjectRecords();
            frm.Show();

        }

        private void subjectEntryToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            frmSubjectRecords frm = new frmSubjectRecords();
            frm.Show();
        }

        private void classToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            frmClass frm = new frmClass();
            frm.Show();
        }

        private void classPromotionToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            frmClassBatch frm = new frmClassBatch();
            frm.Show();
        }

        private void examToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            frmExamEntry frm = new frmExamEntry();
            frm.Show();
        }

        private void marksEntryToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            frmMarksEntry frm = new frmMarksEntry();
            frm.Show();
        }

        private void registrationToolStripMenuItem_Click_4(object sender, EventArgs e)
        {
            frmUserRegistration frm = new frmUserRegistration();
            frm.Show();
        }

        private void schoolTermsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmSchoolTerms frm = new frmSchoolTerms();  
           frm.Show();
        }

        private void schoolEventsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmSchoolCalendar frm = new frmSchoolCalendar();
            frm.Show();
        }

        private void employeeListToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmStaffRecord frm = new frmStaffRecord();
            frm.Show();
        }

        private void classLisToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmClassListReport frm= new frmClassListReport();
            frm.Show();
        }

        private void feePaymentToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmSchoolFeePaymentReport frm = new frmSchoolFeePaymentReport();
            frm.Show();
        }

        private void Customers_Click(object sender, EventArgs e)
        {
            frmStaffRecord frm= new frmStaffRecord();
            frm.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            frmExamEntry frm = new frmExamEntry();
            frm.Show();
        }
    }
}
