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
    public partial class Librarian_Window : Form
    {
        public Librarian_Window()
        {
            InitializeComponent();
        }

        private void statusStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void bOOKBORROWEDToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void Librarian_Window_Load(object sender, EventArgs e)
        {

        }

        private void logoutToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            this.Hide();
            frmLogin login = new frmLogin();
            login.Show();
          
            login.UserID.Text = "";
            login.Password.Text = "";
        }
    }
}
