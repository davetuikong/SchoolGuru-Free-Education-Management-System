namespace SchoolGuru
{
    partial class frmDatabaseConfig
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmDatabaseConfig));
            this.Panel1 = new System.Windows.Forms.Panel();
            this.Label6 = new System.Windows.Forms.Label();
            this.UploadDB = new System.Windows.Forms.OpenFileDialog();
            this.txtDatabase = new System.Windows.Forms.TextBox();
            this.txtPassword = new System.Windows.Forms.TextBox();
            this.Label3 = new System.Windows.Forms.Label();
            this.Label4 = new System.Windows.Forms.Label();
            this.Label2 = new System.Windows.Forms.Label();
            this.txtUserName = new System.Windows.Forms.TextBox();
            this.cmdSave = new System.Windows.Forms.Button();
            this.txtServerIP = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.GroupBox1 = new System.Windows.Forms.GroupBox();
            this.grSetup = new System.Windows.Forms.GroupBox();
            this.label5 = new System.Windows.Forms.Label();
            this.btnCopy = new System.Windows.Forms.Button();
            this.btnInitialise = new System.Windows.Forms.Button();
            this.lblinit = new System.Windows.Forms.Label();
            this.txtSQL = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.txtPort = new System.Windows.Forms.TextBox();
            this.dlgSaveDb = new System.Windows.Forms.SaveFileDialog();
            this.btnInitialiseDB = new System.Windows.Forms.Button();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.cmdClose = new System.Windows.Forms.Button();
            this.Panel1.SuspendLayout();
            this.GroupBox1.SuspendLayout();
            this.grSetup.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            this.SuspendLayout();
            // 
            // Panel1
            // 
            this.Panel1.BackColor = System.Drawing.Color.SteelBlue;
            this.Panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.Panel1.Controls.Add(this.pictureBox2);
            this.Panel1.Controls.Add(this.Label6);
            this.Panel1.Controls.Add(this.cmdClose);
            this.Panel1.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.Panel1.Location = new System.Drawing.Point(-1, -1);
            this.Panel1.Name = "Panel1";
            this.Panel1.Size = new System.Drawing.Size(728, 84);
            this.Panel1.TabIndex = 28;
            // 
            // Label6
            // 
            this.Label6.AutoSize = true;
            this.Label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Label6.ForeColor = System.Drawing.Color.White;
            this.Label6.Location = new System.Drawing.Point(90, 29);
            this.Label6.Name = "Label6";
            this.Label6.Size = new System.Drawing.Size(286, 29);
            this.Label6.TabIndex = 0;
            this.Label6.Text = "Database Configuration";
            // 
            // UploadDB
            // 
            this.UploadDB.FileName = "UploadDB";
            // 
            // txtDatabase
            // 
            this.txtDatabase.BackColor = System.Drawing.SystemColors.Info;
            this.txtDatabase.Location = new System.Drawing.Point(125, 101);
            this.txtDatabase.Name = "txtDatabase";
            this.txtDatabase.Size = new System.Drawing.Size(174, 22);
            this.txtDatabase.TabIndex = 4;
            // 
            // txtPassword
            // 
            this.txtPassword.BackColor = System.Drawing.SystemColors.Info;
            this.txtPassword.Location = new System.Drawing.Point(125, 168);
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.PasswordChar = '*';
            this.txtPassword.Size = new System.Drawing.Size(174, 22);
            this.txtPassword.TabIndex = 3;
            // 
            // Label3
            // 
            this.Label3.AutoSize = true;
            this.Label3.Location = new System.Drawing.Point(18, 176);
            this.Label3.Name = "Label3";
            this.Label3.Size = new System.Drawing.Size(71, 16);
            this.Label3.TabIndex = 10;
            this.Label3.Text = "Password:";
            // 
            // Label4
            // 
            this.Label4.AutoSize = true;
            this.Label4.Location = new System.Drawing.Point(18, 104);
            this.Label4.Name = "Label4";
            this.Label4.Size = new System.Drawing.Size(71, 16);
            this.Label4.TabIndex = 11;
            this.Label4.Text = "Database:";
            // 
            // Label2
            // 
            this.Label2.AutoSize = true;
            this.Label2.Location = new System.Drawing.Point(18, 144);
            this.Label2.Name = "Label2";
            this.Label2.Size = new System.Drawing.Size(74, 16);
            this.Label2.TabIndex = 9;
            this.Label2.Text = "Username:";
            // 
            // txtUserName
            // 
            this.txtUserName.BackColor = System.Drawing.SystemColors.Info;
            this.txtUserName.Location = new System.Drawing.Point(125, 136);
            this.txtUserName.Name = "txtUserName";
            this.txtUserName.Size = new System.Drawing.Size(174, 22);
            this.txtUserName.TabIndex = 2;
            // 
            // cmdSave
            // 
            this.cmdSave.BackColor = System.Drawing.Color.SteelBlue;
            this.cmdSave.Cursor = System.Windows.Forms.Cursors.Hand;
            this.cmdSave.FlatAppearance.BorderColor = System.Drawing.SystemColors.Highlight;
            this.cmdSave.FlatAppearance.BorderSize = 0;
            this.cmdSave.FlatAppearance.CheckedBackColor = System.Drawing.SystemColors.Highlight;
            this.cmdSave.FlatAppearance.MouseDownBackColor = System.Drawing.SystemColors.Highlight;
            this.cmdSave.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmdSave.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.cmdSave.Location = new System.Drawing.Point(125, 246);
            this.cmdSave.Name = "cmdSave";
            this.cmdSave.Size = new System.Drawing.Size(92, 31);
            this.cmdSave.TabIndex = 22;
            this.cmdSave.Text = "&Save";
            this.cmdSave.UseVisualStyleBackColor = false;
            this.cmdSave.Click += new System.EventHandler(this.cmdSave_Click);
            // 
            // txtServerIP
            // 
            this.txtServerIP.BackColor = System.Drawing.SystemColors.Info;
            this.txtServerIP.Location = new System.Drawing.Point(125, 27);
            this.txtServerIP.Name = "txtServerIP";
            this.txtServerIP.Size = new System.Drawing.Size(174, 22);
            this.txtServerIP.TabIndex = 27;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(18, 27);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(51, 16);
            this.label7.TabIndex = 28;
            this.label7.Text = "Server:";
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.Color.SteelBlue;
            this.button1.Cursor = System.Windows.Forms.Cursors.Hand;
            this.button1.FlatAppearance.BorderColor = System.Drawing.SystemColors.Highlight;
            this.button1.FlatAppearance.CheckedBackColor = System.Drawing.SystemColors.Highlight;
            this.button1.FlatAppearance.MouseDownBackColor = System.Drawing.SystemColors.Highlight;
            this.button1.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.button1.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.button1.Location = new System.Drawing.Point(125, 196);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(52, 21);
            this.button1.TabIndex = 29;
            this.button1.Text = "&Test";
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // GroupBox1
            // 
            this.GroupBox1.BackColor = System.Drawing.Color.Transparent;
            this.GroupBox1.Controls.Add(this.label8);
            this.GroupBox1.Controls.Add(this.label1);
            this.GroupBox1.Controls.Add(this.txtPort);
            this.GroupBox1.Controls.Add(this.button1);
            this.GroupBox1.Controls.Add(this.label7);
            this.GroupBox1.Controls.Add(this.txtServerIP);
            this.GroupBox1.Controls.Add(this.cmdSave);
            this.GroupBox1.Controls.Add(this.txtUserName);
            this.GroupBox1.Controls.Add(this.Label2);
            this.GroupBox1.Controls.Add(this.Label4);
            this.GroupBox1.Controls.Add(this.Label3);
            this.GroupBox1.Controls.Add(this.txtPassword);
            this.GroupBox1.Controls.Add(this.txtDatabase);
            this.GroupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.GroupBox1.Location = new System.Drawing.Point(9, 92);
            this.GroupBox1.Name = "GroupBox1";
            this.GroupBox1.Size = new System.Drawing.Size(314, 291);
            this.GroupBox1.TabIndex = 27;
            this.GroupBox1.TabStop = false;
            this.GroupBox1.Text = "PostgreSQL Database Configuration";
            // 
            // grSetup
            // 
            this.grSetup.Controls.Add(this.label5);
            this.grSetup.Controls.Add(this.btnCopy);
            this.grSetup.Controls.Add(this.btnInitialise);
            this.grSetup.Controls.Add(this.lblinit);
            this.grSetup.Controls.Add(this.txtSQL);
            this.grSetup.Controls.Add(this.btnInitialiseDB);
            this.grSetup.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grSetup.Location = new System.Drawing.Point(335, 92);
            this.grSetup.Name = "grSetup";
            this.grSetup.Size = new System.Drawing.Size(383, 280);
            this.grSetup.TabIndex = 36;
            this.grSetup.TabStop = false;
            this.grSetup.Text = "Database initialization";
            this.grSetup.Visible = false;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(9, 246);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(169, 26);
            this.label5.TabIndex = 46;
            this.label5.Text = "If you wish to set up the database \r\nyourself, you can copy sql files";
            // 
            // btnCopy
            // 
            this.btnCopy.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCopy.Location = new System.Drawing.Point(253, 246);
            this.btnCopy.Name = "btnCopy";
            this.btnCopy.Size = new System.Drawing.Size(113, 23);
            this.btnCopy.TabIndex = 45;
            this.btnCopy.Text = "Copy PostgreSQL file(.sql)";
            this.btnCopy.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCopy.UseVisualStyleBackColor = true;
            this.btnCopy.Click += new System.EventHandler(this.btnCopy_Click);
            // 
            // btnInitialise
            // 
            this.btnInitialise.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnInitialise.Location = new System.Drawing.Point(264, 73);
            this.btnInitialise.Name = "btnInitialise";
            this.btnInitialise.Size = new System.Drawing.Size(113, 23);
            this.btnInitialise.TabIndex = 44;
            this.btnInitialise.Text = "Initialiase Database";
            this.btnInitialise.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnInitialise.UseVisualStyleBackColor = true;
            this.btnInitialise.Click += new System.EventHandler(this.btnInitialise_Click);
            // 
            // lblinit
            // 
            this.lblinit.AutoSize = true;
            this.lblinit.Font = new System.Drawing.Font("Verdana", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblinit.ForeColor = System.Drawing.Color.Red;
            this.lblinit.Location = new System.Drawing.Point(11, 49);
            this.lblinit.Name = "lblinit";
            this.lblinit.Size = new System.Drawing.Size(33, 16);
            this.lblinit.TabIndex = 43;
            this.lblinit.Text = "Init";
            this.lblinit.Visible = false;
            // 
            // txtSQL
            // 
            this.txtSQL.BackColor = System.Drawing.SystemColors.InactiveCaptionText;
            this.txtSQL.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSQL.ForeColor = System.Drawing.Color.Lime;
            this.txtSQL.Location = new System.Drawing.Point(6, 102);
            this.txtSQL.Multiline = true;
            this.txtSQL.Name = "txtSQL";
            this.txtSQL.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtSQL.Size = new System.Drawing.Size(371, 126);
            this.txtSQL.TabIndex = 42;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Verdana", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.ForeColor = System.Drawing.Color.ForestGreen;
            this.label8.Location = new System.Drawing.Point(541, 196);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(0, 16);
            this.label8.TabIndex = 35;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(18, 65);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(32, 16);
            this.label1.TabIndex = 34;
            this.label1.Text = "Port";
            // 
            // txtPort
            // 
            this.txtPort.BackColor = System.Drawing.SystemColors.Info;
            this.txtPort.Location = new System.Drawing.Point(125, 62);
            this.txtPort.Name = "txtPort";
            this.txtPort.Size = new System.Drawing.Size(58, 22);
            this.txtPort.TabIndex = 33;
            // 
            // btnInitialiseDB
            // 
            this.btnInitialiseDB.BackColor = System.Drawing.Color.Transparent;
            this.btnInitialiseDB.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("btnInitialiseDB.BackgroundImage")));
            this.btnInitialiseDB.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btnInitialiseDB.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.btnInitialiseDB.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnInitialiseDB.ForeColor = System.Drawing.Color.Lavender;
            this.btnInitialiseDB.Location = new System.Drawing.Point(322, 14);
            this.btnInitialiseDB.Name = "btnInitialiseDB";
            this.btnInitialiseDB.Size = new System.Drawing.Size(55, 52);
            this.btnInitialiseDB.TabIndex = 39;
            this.btnInitialiseDB.UseVisualStyleBackColor = false;
            // 
            // pictureBox2
            // 
            this.pictureBox2.BackgroundImage = global::SchoolGuru.Properties.Resources.db;
            this.pictureBox2.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pictureBox2.Location = new System.Drawing.Point(14, 3);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(64, 68);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox2.TabIndex = 24;
            this.pictureBox2.TabStop = false;
            // 
            // cmdClose
            // 
            this.cmdClose.BackColor = System.Drawing.Color.SteelBlue;
            this.cmdClose.BackgroundImage = global::SchoolGuru.Properties.Resources.no;
            this.cmdClose.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.cmdClose.Cursor = System.Windows.Forms.Cursors.Hand;
            this.cmdClose.FlatAppearance.BorderColor = System.Drawing.SystemColors.Highlight;
            this.cmdClose.FlatAppearance.BorderSize = 0;
            this.cmdClose.FlatAppearance.CheckedBackColor = System.Drawing.SystemColors.Highlight;
            this.cmdClose.FlatAppearance.MouseDownBackColor = System.Drawing.SystemColors.Highlight;
            this.cmdClose.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmdClose.Location = new System.Drawing.Point(693, -1);
            this.cmdClose.Name = "cmdClose";
            this.cmdClose.Size = new System.Drawing.Size(34, 26);
            this.cmdClose.TabIndex = 23;
            this.cmdClose.UseVisualStyleBackColor = false;
            this.cmdClose.Click += new System.EventHandler(this.cmdClose_Click);
            // 
            // frmDatabaseConfig
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Lavender;
            this.ClientSize = new System.Drawing.Size(727, 384);
            this.ControlBox = false;
            this.Controls.Add(this.grSetup);
            this.Controls.Add(this.GroupBox1);
            this.Controls.Add(this.Panel1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmDatabaseConfig";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Load += new System.EventHandler(this.frmDatabaseConfig_Load);
            this.Panel1.ResumeLayout(false);
            this.Panel1.PerformLayout();
            this.GroupBox1.ResumeLayout(false);
            this.GroupBox1.PerformLayout();
            this.grSetup.ResumeLayout(false);
            this.grSetup.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        internal System.Windows.Forms.Button cmdClose;
        internal System.Windows.Forms.Panel Panel1;
        internal System.Windows.Forms.Label Label6;
        private System.Windows.Forms.OpenFileDialog UploadDB;
        private System.Windows.Forms.PictureBox pictureBox2;
        internal System.Windows.Forms.TextBox txtDatabase;
        internal System.Windows.Forms.TextBox txtPassword;
        internal System.Windows.Forms.Label Label3;
        internal System.Windows.Forms.Label Label4;
        internal System.Windows.Forms.Label Label2;
        internal System.Windows.Forms.TextBox txtUserName;
        internal System.Windows.Forms.Button cmdSave;
        internal System.Windows.Forms.TextBox txtServerIP;
        internal System.Windows.Forms.Label label7;
        internal System.Windows.Forms.Button button1;
        internal System.Windows.Forms.GroupBox GroupBox1;
        private System.Windows.Forms.SaveFileDialog dlgSaveDb;
        internal System.Windows.Forms.Label label1;
        internal System.Windows.Forms.TextBox txtPort;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.GroupBox grSetup;
        private System.Windows.Forms.Label lblinit;
        private System.Windows.Forms.TextBox txtSQL;
        private System.Windows.Forms.Button btnInitialiseDB;
        private System.Windows.Forms.Button btnCopy;
        private System.Windows.Forms.Button btnInitialise;
        private System.Windows.Forms.Label label5;
    }
}