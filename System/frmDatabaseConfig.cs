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
using System.ComponentModel;
using System.Text;
using System.Reflection;
using System.IO;
using Npgsql;



namespace SchoolGuru
{
    public partial class frmDatabaseConfig : Form
    {
       

        public string ConfirmPassword { get; set; }
        string server = Interaction.GetSetting(SQLConn.AppName, "DBSection", "server");
        string port = Interaction.GetSetting(SQLConn.AppName, "DBSection", "port");
        string username = Interaction.GetSetting(SQLConn.AppName, "DBSection", "username");
        string password = Interaction.GetSetting(SQLConn.AppName, "DBSection", "password");
        string database = Interaction.GetSetting(SQLConn.AppName, "DBSection", "database");

        
        public frmDatabaseConfig()
        {
            InitializeComponent();
        }

        private void frmDatabaseConfig_Load(object sender, EventArgs e)
        {


            txtDatabase.Text = database;
            txtPort.Text = port;
            txtUserName.Text = username;
            txtPassword.Text = password;
            txtServerIP.Text = server;


            


            
        }



        private void SaveSettings()
        {
            Interaction.SaveSetting(SQLConn.AppName, "DBSection", "server", txtServerIP.Text.Trim());
            Interaction.SaveSetting(SQLConn.AppName, "DBSection", "port", txtPort.Text.Trim());
            Interaction.SaveSetting(SQLConn.AppName, "DBSection", "database", txtDatabase.Text.Trim());
            Interaction.SaveSetting(SQLConn.AppName, "DBSection", "username", txtUserName.Text.Trim());
           Interaction.SaveSetting(SQLConn.AppName, "DBSection", "password", txtPassword.Text.Trim());
           Interaction.MsgBox("Settings Saved. Now try running the programs", MsgBoxStyle.Information, "Settings");

        }


        private void TestConnection()
        {

           string tserver= txtServerIP.Text.Trim();
            string tport = txtPort.Text.Trim();
            string tdatabase=txtDatabase.Text.Trim();
            string tusername= txtUserName.Text.Trim();
          string tpassword= txtPassword.Text.Trim();

          if (string.IsNullOrEmpty(tserver) || string.IsNullOrEmpty(tport) || string.IsNullOrEmpty(tdatabase) || string.IsNullOrEmpty(tusername) || string.IsNullOrEmpty(tpassword))
          {
              MessageBox.Show("All Fields Are Required");
              return;
          }
              string      DBcon= String.Format("Server={0};Port={1}; User Id={2};Password={3};Database={4};", tserver, tport, tusername, tpassword, tdatabase);
            using (SQLConn.conn = new NpgsqlConnection(DBcon))
            {
                try
                {
                  SQLConn.conn.Open();
                 Interaction.MsgBox("Database Connection Successful", MsgBoxStyle.Information, "Success!");
                 grSetup.Visible = true;
                }
                catch (NpgsqlException)
                {
                Interaction.MsgBox("The system failed to establish a connection", MsgBoxStyle.Information, "Connection Failed!" );
                grSetup.Visible = false;
                }
            }

          
        }

      

        private void cmdClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }



        private void button2_Click(object sender, EventArgs e)
        {
            SaveFileDialog dlgSaveDB = new SaveFileDialog();
                
       
                string filenom = Path.GetFileName(txtDatabase.Text);
                dlgSaveDB.FileName = filenom;
     

                if (dlgSaveDB.ShowDialog() == DialogResult.OK)
                {
                    string destfolder = Path.GetDirectoryName(dlgSaveDB.FileName);
                    string destfile =   destfolder + "/" + filenom;
                    if (Directory.Exists(destfolder))
                    {
                        File.Copy(txtDatabase.Text, destfile, true);
                        Process.Start(destfolder);
                    }

                }
        

           
        }




        private void button1_Click(object sender, EventArgs e)
        {
              TestConnection();
        }

        private void cmdSave_Click(object sender, EventArgs e)
        {

            using (var form = new frmPasswordConfirm())
            {
                var result = form.ShowDialog();
                if (result == DialogResult.OK)
                {
                    bool confirmed = form.ConfirmPassword;
                    if (confirmed)
                    {
                        SaveSettings();


                        Application.Restart();


                    }
                    else
                    {
                        MessageBox.Show("Invalid Password");

                    }

                }
            }
           

        }

        private void InitialiseDB_Click(object sender, EventArgs e)
        {
            if (SQLConn.IsServerConnected())
            {
                Interaction.MsgBox("Database Initialised Already!", MsgBoxStyle.Information, "Database Initialised");
            }
            else
            {

             
                InitialiseDB();

            }
        }

        private void InitialiseDB()
        {
            lblinit.Text = "Initialising Database. Please Wait..";
            lblinit.ForeColor = Color.Red;
            lblinit.Visible = true;
            txtSQL.Visible = true;
            try
            {
                string appPath = Path.GetDirectoryName(Application.ExecutablePath);
                string file = appPath + "\\SQL\\schoolguru.sql";
                SQLConn.sqL = File.ReadAllText(file).ToString();

                txtSQL.Text = SQLConn.sqL;
                SQLConn.ConnOpen();

                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
           int r=  SQLConn.cmd.ExecuteNonQuery();
           if (r > 0)
           {
           MessageBox.Show("Database has been Initialised Successfully", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);

           }
           SQLConn.ConnClose();

            }
            catch (NpgsqlException ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

     





        }

     
     

        private void btnInitialise_Click(object sender, EventArgs e)
        {
            InitialiseDB();
        }

        private void btnCopy_Click(object sender, EventArgs e)
        {

            SaveFileDialog dlgSaveDB = new SaveFileDialog();
            string filename = "schoolguru.sql";
            dlgSaveDB.FileName = filename;




            if (dlgSaveDB.ShowDialog() == DialogResult.OK)
            {



                string appPath = Path.GetDirectoryName(Application.ExecutablePath);
                string file = appPath + "\\SQL\\schoolguru.sql";
                MessageBox.Show(file);
                string destpath = Path.GetDirectoryName(dlgSaveDB.FileName);
                string dest = Path.Combine(destpath, filename);
                System.IO.File.Copy(file, dest, true);

                Process.Start(destpath);
            }
            this.Close();

        }

        



       

     
    }
}
