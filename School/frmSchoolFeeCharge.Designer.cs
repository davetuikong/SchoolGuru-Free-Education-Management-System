namespace SchoolGuru
{
    partial class frmSchoolFeeCharge
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
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.btnChargeFee = new System.Windows.Forms.Button();
            this.linkLabel2 = new System.Windows.Forms.LinkLabel();
            this.linkLabel1 = new System.Windows.Forms.LinkLabel();
            this.btnSearchSchool = new System.Windows.Forms.Button();
            this.cmbClass = new System.Windows.Forms.ComboBox();
            this.cmbTerm = new System.Windows.Forms.ComboBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.btnSearchName = new System.Windows.Forms.Button();
            this.txtAdmissionNo = new System.Windows.Forms.TextBox();
            this.DGV = new System.Windows.Forms.DataGridView();
            this.Charge = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.admissionno = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.fullname = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TermName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.sclass = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Section = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.term = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.chkAll = new System.Windows.Forms.CheckBox();
            this.grpFeeTypes = new System.Windows.Forms.GroupBox();
            this.groupBox3.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DGV)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.btnChargeFee);
            this.groupBox3.Controls.Add(this.linkLabel2);
            this.groupBox3.Controls.Add(this.linkLabel1);
            this.groupBox3.Controls.Add(this.btnSearchSchool);
            this.groupBox3.Controls.Add(this.cmbClass);
            this.groupBox3.Controls.Add(this.cmbTerm);
            this.groupBox3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox3.Location = new System.Drawing.Point(255, 12);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(726, 107);
            this.groupBox3.TabIndex = 1;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Search By Session, Class or Section";
            // 
            // btnChargeFee
            // 
            this.btnChargeFee.BackColor = System.Drawing.Color.IndianRed;
            this.btnChargeFee.Enabled = false;
            this.btnChargeFee.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnChargeFee.ForeColor = System.Drawing.Color.White;
            this.btnChargeFee.Location = new System.Drawing.Point(562, 38);
            this.btnChargeFee.Name = "btnChargeFee";
            this.btnChargeFee.Size = new System.Drawing.Size(145, 36);
            this.btnChargeFee.TabIndex = 6;
            this.btnChargeFee.Text = "Charge Fee";
            this.btnChargeFee.UseVisualStyleBackColor = false;
            this.btnChargeFee.Click += new System.EventHandler(this.btnChargeFee_Click);
            // 
            // linkLabel2
            // 
            this.linkLabel2.AutoSize = true;
            this.linkLabel2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.linkLabel2.LinkColor = System.Drawing.Color.Teal;
            this.linkLabel2.Location = new System.Drawing.Point(12, 24);
            this.linkLabel2.Name = "linkLabel2";
            this.linkLabel2.Size = new System.Drawing.Size(42, 16);
            this.linkLabel2.TabIndex = 6;
            this.linkLabel2.TabStop = true;
            this.linkLabel2.Text = "Class";
            // 
            // linkLabel1
            // 
            this.linkLabel1.AutoSize = true;
            this.linkLabel1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.linkLabel1.LinkColor = System.Drawing.Color.Teal;
            this.linkLabel1.Location = new System.Drawing.Point(195, 26);
            this.linkLabel1.Name = "linkLabel1";
            this.linkLabel1.Size = new System.Drawing.Size(96, 16);
            this.linkLabel1.TabIndex = 5;
            this.linkLabel1.TabStop = true;
            this.linkLabel1.Text = "Term/ Session";
            // 
            // btnSearchSchool
            // 
            this.btnSearchSchool.BackColor = System.Drawing.Color.DimGray;
            this.btnSearchSchool.FlatAppearance.BorderSize = 0;
            this.btnSearchSchool.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnSearchSchool.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSearchSchool.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnSearchSchool.Location = new System.Drawing.Point(15, 73);
            this.btnSearchSchool.Name = "btnSearchSchool";
            this.btnSearchSchool.Size = new System.Drawing.Size(81, 24);
            this.btnSearchSchool.TabIndex = 4;
            this.btnSearchSchool.Text = "&Search";
            this.btnSearchSchool.UseVisualStyleBackColor = false;
            this.btnSearchSchool.Click += new System.EventHandler(this.btnSearchSchool_Click);
            // 
            // cmbClass
            // 
            this.cmbClass.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbClass.FormattingEnabled = true;
            this.cmbClass.Location = new System.Drawing.Point(15, 43);
            this.cmbClass.Name = "cmbClass";
            this.cmbClass.Size = new System.Drawing.Size(130, 24);
            this.cmbClass.TabIndex = 2;
            // 
            // cmbTerm
            // 
            this.cmbTerm.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbTerm.FormattingEnabled = true;
            this.cmbTerm.Location = new System.Drawing.Point(198, 45);
            this.cmbTerm.Name = "cmbTerm";
            this.cmbTerm.Size = new System.Drawing.Size(239, 24);
            this.cmbTerm.TabIndex = 1;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.btnSearchName);
            this.groupBox2.Controls.Add(this.txtAdmissionNo);
            this.groupBox2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox2.Location = new System.Drawing.Point(13, 12);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(219, 107);
            this.groupBox2.TabIndex = 0;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Search Name/Admission  #";
            // 
            // btnSearchName
            // 
            this.btnSearchName.BackColor = System.Drawing.Color.DimGray;
            this.btnSearchName.FlatAppearance.BorderSize = 0;
            this.btnSearchName.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnSearchName.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSearchName.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnSearchName.Location = new System.Drawing.Point(6, 73);
            this.btnSearchName.Name = "btnSearchName";
            this.btnSearchName.Size = new System.Drawing.Size(81, 24);
            this.btnSearchName.TabIndex = 12;
            this.btnSearchName.Text = "&Search";
            this.btnSearchName.UseVisualStyleBackColor = false;
            this.btnSearchName.Click += new System.EventHandler(this.btnSearchName_Click);
            // 
            // txtAdmissionNo
            // 
            this.txtAdmissionNo.Location = new System.Drawing.Point(6, 45);
            this.txtAdmissionNo.Name = "txtAdmissionNo";
            this.txtAdmissionNo.Size = new System.Drawing.Size(207, 22);
            this.txtAdmissionNo.TabIndex = 0;
            this.txtAdmissionNo.TextChanged += new System.EventHandler(this.txtAdmissionNo_TextChanged);
            // 
            // DGV
            // 
            this.DGV.AllowUserToAddRows = false;
            this.DGV.AllowUserToDeleteRows = false;
            this.DGV.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.DGV.BackgroundColor = System.Drawing.Color.DimGray;
            this.DGV.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.DGV.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Charge,
            this.admissionno,
            this.fullname,
            this.TermName,
            this.sclass,
            this.Section,
            this.term});
            this.DGV.Location = new System.Drawing.Point(5, 185);
            this.DGV.Name = "DGV";
            this.DGV.Size = new System.Drawing.Size(991, 520);
            this.DGV.TabIndex = 3;
            this.DGV.RowHeaderMouseClick += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.DataGridView1_RowHeaderMouseClick);
            // 
            // Charge
            // 
            this.Charge.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.ColumnHeader;
            this.Charge.HeaderText = "Charge";
            this.Charge.Name = "Charge";
            this.Charge.Width = 47;
            // 
            // admissionno
            // 
            this.admissionno.DataPropertyName = "admissionno";
            this.admissionno.HeaderText = "Admission#";
            this.admissionno.Name = "admissionno";
            // 
            // fullname
            // 
            this.fullname.DataPropertyName = "fullname";
            this.fullname.HeaderText = "Name";
            this.fullname.Name = "fullname";
            // 
            // TermName
            // 
            this.TermName.DataPropertyName = "termname";
            this.TermName.HeaderText = "Term Name";
            this.TermName.Name = "TermName";
            // 
            // sclass
            // 
            this.sclass.DataPropertyName = "sclass";
            this.sclass.HeaderText = "Class";
            this.sclass.Name = "sclass";
            // 
            // Section
            // 
            this.Section.DataPropertyName = "section";
            this.Section.HeaderText = "Section";
            this.Section.Name = "Section";
            // 
            // term
            // 
            this.term.DataPropertyName = "term";
            this.term.HeaderText = "term";
            this.term.Name = "term";
            this.term.Visible = false;
            // 
            // chkAll
            // 
            this.chkAll.AutoSize = true;
            this.chkAll.Location = new System.Drawing.Point(19, 162);
            this.chkAll.Name = "chkAll";
            this.chkAll.Size = new System.Drawing.Size(70, 17);
            this.chkAll.TabIndex = 4;
            this.chkAll.Text = "Select All";
            this.chkAll.UseVisualStyleBackColor = true;
            this.chkAll.CheckedChanged += new System.EventHandler(this.chkSelectAll_CheckedChanged);
            // 
            // grpFeeTypes
            // 
            this.grpFeeTypes.Location = new System.Drawing.Point(117, 125);
            this.grpFeeTypes.Name = "grpFeeTypes";
            this.grpFeeTypes.Size = new System.Drawing.Size(864, 54);
            this.grpFeeTypes.TabIndex = 5;
            this.grpFeeTypes.TabStop = false;
            this.grpFeeTypes.Text = "Applicable Fees";
            // 
            // frmSchoolFeeCharge
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1008, 729);
            this.Controls.Add(this.grpFeeTypes);
            this.Controls.Add(this.chkAll);
            this.Controls.Add(this.DGV);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.Name = "frmSchoolFeeCharge";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "School Fee Charge";
            this.Load += new System.EventHandler(this.frmSchoolFeeCharge_Load);
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DGV)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.ComboBox cmbClass;
        private System.Windows.Forms.ComboBox cmbTerm;
        private System.Windows.Forms.LinkLabel linkLabel1;
        private System.Windows.Forms.Button btnSearchSchool;
        private System.Windows.Forms.LinkLabel linkLabel2;
        private System.Windows.Forms.DataGridView DGV;
        private System.Windows.Forms.TextBox txtAdmissionNo;
        private System.Windows.Forms.Button btnSearchName;
        private System.Windows.Forms.CheckBox chkAll;
        private System.Windows.Forms.GroupBox grpFeeTypes;
        private System.Windows.Forms.Button btnChargeFee;
        private System.Windows.Forms.DataGridViewCheckBoxColumn Charge;
        private System.Windows.Forms.DataGridViewTextBoxColumn admissionno;
        private System.Windows.Forms.DataGridViewTextBoxColumn fullname;
        private System.Windows.Forms.DataGridViewTextBoxColumn TermName;
        private System.Windows.Forms.DataGridViewTextBoxColumn sclass;
        private System.Windows.Forms.DataGridViewTextBoxColumn Section;
        private System.Windows.Forms.DataGridViewTextBoxColumn term;
    }
}