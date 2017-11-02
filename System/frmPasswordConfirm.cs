using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Diagnostics;
using System.Windows.Forms;
using System.Linq;
using System.Xml.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Collections.Specialized;
using Npgsql;

namespace SchoolGuru
{
    public partial class frmPasswordConfirm : Form
    {

        public bool ConfirmPassword;

        public frmPasswordConfirm()
        {
            InitializeComponent();
        
        }

     

     
       

       
        private void txtAdminPassword_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                btnOkay.PerformClick();
            }
        }

        private void btnOkay_Click(object sender, EventArgs e)
        {
            if (txtConfirmPassword.Text == "1234")
            {

                this.DialogResult = DialogResult.OK;
                ConfirmPassword = true;
                this.Close();
            }
            
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

       
    }
}
