namespace SchoolGuru
{
    partial class frmClassBatch
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmClassBatch));
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.linkLabel3 = new System.Windows.Forms.LinkLabel();
            this.cmbSection = new System.Windows.Forms.ComboBox();
            this.linkLabel2 = new System.Windows.Forms.LinkLabel();
            this.linkLabel1 = new System.Windows.Forms.LinkLabel();
            this.btnSearchSchool = new System.Windows.Forms.Button();
            this.cmbClass = new System.Windows.Forms.ComboBox();
            this.cmbTerm = new System.Windows.Forms.ComboBox();
            this.btnMoveClass = new System.Windows.Forms.Button();
            this.DGV = new System.Windows.Forms.DataGridView();
            this.Charge = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.admissionno = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.fullname = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TermName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.sclass = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Section = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.term = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.chkAll = new System.Windows.Forms.CheckBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.linkLabel4 = new System.Windows.Forms.LinkLabel();
            this.cmbSectionNext = new System.Windows.Forms.ComboBox();
            this.linkLabel5 = new System.Windows.Forms.LinkLabel();
            this.linkLabel6 = new System.Windows.Forms.LinkLabel();
            this.cmbClassNext = new System.Windows.Forms.ComboBox();
            this.cmbTermNext = new System.Windows.Forms.ComboBox();
            this.groupBox3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DGV)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox3
            // 
            this.groupBox3.BackColor = System.Drawing.Color.AliceBlue;
            this.groupBox3.Controls.Add(this.linkLabel3);
            this.groupBox3.Controls.Add(this.cmbSection);
            this.groupBox3.Controls.Add(this.linkLabel2);
            this.groupBox3.Controls.Add(this.linkLabel1);
            this.groupBox3.Controls.Add(this.btnSearchSchool);
            this.groupBox3.Controls.Add(this.cmbClass);
            this.groupBox3.Controls.Add(this.cmbTerm);
            this.groupBox3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox3.Location = new System.Drawing.Point(12, 12);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(405, 108);
            this.groupBox3.TabIndex = 1;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Current Class";
            // 
            // linkLabel3
            // 
            this.linkLabel3.AutoSize = true;
            this.linkLabel3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.linkLabel3.LinkColor = System.Drawing.Color.Teal;
            this.linkLabel3.Location = new System.Drawing.Point(276, 24);
            this.linkLabel3.Name = "linkLabel3";
            this.linkLabel3.Size = new System.Drawing.Size(53, 16);
            this.linkLabel3.TabIndex = 8;
            this.linkLabel3.TabStop = true;
            this.linkLabel3.Text = "Section";
            // 
            // cmbSection
            // 
            this.cmbSection.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSection.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbSection.FormattingEnabled = true;
            this.cmbSection.Location = new System.Drawing.Point(279, 45);
            this.cmbSection.Name = "cmbSection";
            this.cmbSection.Size = new System.Drawing.Size(120, 24);
            this.cmbSection.TabIndex = 7;
            // 
            // linkLabel2
            // 
            this.linkLabel2.AutoSize = true;
            this.linkLabel2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.linkLabel2.LinkColor = System.Drawing.Color.Teal;
            this.linkLabel2.Location = new System.Drawing.Point(7, 24);
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
            this.linkLabel1.Location = new System.Drawing.Point(143, 26);
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
            this.btnSearchSchool.Location = new System.Drawing.Point(10, 73);
            this.btnSearchSchool.Name = "btnSearchSchool";
            this.btnSearchSchool.Size = new System.Drawing.Size(81, 24);
            this.btnSearchSchool.TabIndex = 4;
            this.btnSearchSchool.Text = "&Search";
            this.btnSearchSchool.UseVisualStyleBackColor = false;
            this.btnSearchSchool.Click += new System.EventHandler(this.btnSearchSchool_Click);
            // 
            // cmbClass
            // 
            this.cmbClass.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbClass.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbClass.FormattingEnabled = true;
            this.cmbClass.Location = new System.Drawing.Point(10, 45);
            this.cmbClass.Name = "cmbClass";
            this.cmbClass.Size = new System.Drawing.Size(130, 24);
            this.cmbClass.TabIndex = 2;
            // 
            // cmbTerm
            // 
            this.cmbTerm.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTerm.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbTerm.FormattingEnabled = true;
            this.cmbTerm.Location = new System.Drawing.Point(146, 45);
            this.cmbTerm.Name = "cmbTerm";
            this.cmbTerm.Size = new System.Drawing.Size(117, 24);
            this.cmbTerm.TabIndex = 1;
            // 
            // btnMoveClass
            // 
            this.btnMoveClass.BackColor = System.Drawing.Color.IndianRed;
            this.btnMoveClass.Enabled = false;
            this.btnMoveClass.FlatAppearance.BorderSize = 0;
            this.btnMoveClass.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnMoveClass.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnMoveClass.ForeColor = System.Drawing.Color.White;
            this.btnMoveClass.Location = new System.Drawing.Point(888, 31);
            this.btnMoveClass.Name = "btnMoveClass";
            this.btnMoveClass.Size = new System.Drawing.Size(91, 70);
            this.btnMoveClass.TabIndex = 6;
            this.btnMoveClass.Text = "Move Class";
            this.btnMoveClass.UseVisualStyleBackColor = false;
            this.btnMoveClass.Click += new System.EventHandler(this.btnMoveClass_Click);
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
            this.DGV.Location = new System.Drawing.Point(5, 148);
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
            this.chkAll.Location = new System.Drawing.Point(13, 126);
            this.chkAll.Name = "chkAll";
            this.chkAll.Size = new System.Drawing.Size(70, 17);
            this.chkAll.TabIndex = 4;
            this.chkAll.Text = "Select All";
            this.chkAll.UseVisualStyleBackColor = true;
            this.chkAll.CheckedChanged += new System.EventHandler(this.chkSelectAll_CheckedChanged);
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.Color.LightBlue;
            this.groupBox1.Controls.Add(this.linkLabel4);
            this.groupBox1.Controls.Add(this.cmbSectionNext);
            this.groupBox1.Controls.Add(this.linkLabel5);
            this.groupBox1.Controls.Add(this.linkLabel6);
            this.groupBox1.Controls.Add(this.cmbClassNext);
            this.groupBox1.Controls.Add(this.cmbTermNext);
            this.groupBox1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(451, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(404, 107);
            this.groupBox1.TabIndex = 9;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Next Class / Term";
            // 
            // linkLabel4
            // 
            this.linkLabel4.AutoSize = true;
            this.linkLabel4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.linkLabel4.LinkColor = System.Drawing.Color.Teal;
            this.linkLabel4.Location = new System.Drawing.Point(275, 24);
            this.linkLabel4.Name = "linkLabel4";
            this.linkLabel4.Size = new System.Drawing.Size(53, 16);
            this.linkLabel4.TabIndex = 8;
            this.linkLabel4.TabStop = true;
            this.linkLabel4.Text = "Section";
            // 
            // cmbSectionNext
            // 
            this.cmbSectionNext.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSectionNext.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbSectionNext.FormattingEnabled = true;
            this.cmbSectionNext.Location = new System.Drawing.Point(278, 45);
            this.cmbSectionNext.Name = "cmbSectionNext";
            this.cmbSectionNext.Size = new System.Drawing.Size(120, 24);
            this.cmbSectionNext.TabIndex = 7;
            // 
            // linkLabel5
            // 
            this.linkLabel5.AutoSize = true;
            this.linkLabel5.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.linkLabel5.LinkColor = System.Drawing.Color.Teal;
            this.linkLabel5.Location = new System.Drawing.Point(7, 24);
            this.linkLabel5.Name = "linkLabel5";
            this.linkLabel5.Size = new System.Drawing.Size(42, 16);
            this.linkLabel5.TabIndex = 6;
            this.linkLabel5.TabStop = true;
            this.linkLabel5.Text = "Class";
            // 
            // linkLabel6
            // 
            this.linkLabel6.AutoSize = true;
            this.linkLabel6.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.linkLabel6.LinkColor = System.Drawing.Color.Teal;
            this.linkLabel6.Location = new System.Drawing.Point(143, 26);
            this.linkLabel6.Name = "linkLabel6";
            this.linkLabel6.Size = new System.Drawing.Size(96, 16);
            this.linkLabel6.TabIndex = 5;
            this.linkLabel6.TabStop = true;
            this.linkLabel6.Text = "Term/ Session";
            // 
            // cmbClassNext
            // 
            this.cmbClassNext.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbClassNext.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbClassNext.FormattingEnabled = true;
            this.cmbClassNext.Location = new System.Drawing.Point(10, 43);
            this.cmbClassNext.Name = "cmbClassNext";
            this.cmbClassNext.Size = new System.Drawing.Size(130, 24);
            this.cmbClassNext.TabIndex = 2;
            // 
            // cmbTermNext
            // 
            this.cmbTermNext.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTermNext.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbTermNext.FormattingEnabled = true;
            this.cmbTermNext.Location = new System.Drawing.Point(146, 45);
            this.cmbTermNext.Name = "cmbTermNext";
            this.cmbTermNext.Size = new System.Drawing.Size(117, 24);
            this.cmbTermNext.TabIndex = 1;
            // 
            // frmClassBatch
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1008, 729);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.chkAll);
            this.Controls.Add(this.DGV);
            this.Controls.Add(this.btnMoveClass);
            this.Controls.Add(this.groupBox3);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "frmClassBatch";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Move Class";
            this.Load += new System.EventHandler(this.frmSchoolFeeCharge_Load);
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DGV)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.ComboBox cmbClass;
        private System.Windows.Forms.ComboBox cmbTerm;
        private System.Windows.Forms.LinkLabel linkLabel1;
        private System.Windows.Forms.Button btnSearchSchool;
        private System.Windows.Forms.LinkLabel linkLabel2;
        private System.Windows.Forms.DataGridView DGV;
        private System.Windows.Forms.CheckBox chkAll;
        private System.Windows.Forms.Button btnMoveClass;
        private System.Windows.Forms.DataGridViewCheckBoxColumn Charge;
        private System.Windows.Forms.DataGridViewTextBoxColumn admissionno;
        private System.Windows.Forms.DataGridViewTextBoxColumn fullname;
        private System.Windows.Forms.DataGridViewTextBoxColumn TermName;
        private System.Windows.Forms.DataGridViewTextBoxColumn sclass;
        private System.Windows.Forms.DataGridViewTextBoxColumn Section;
        private System.Windows.Forms.DataGridViewTextBoxColumn term;
        private System.Windows.Forms.LinkLabel linkLabel3;
        private System.Windows.Forms.ComboBox cmbSection;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.LinkLabel linkLabel4;
        private System.Windows.Forms.ComboBox cmbSectionNext;
        private System.Windows.Forms.LinkLabel linkLabel5;
        private System.Windows.Forms.LinkLabel linkLabel6;
        private System.Windows.Forms.ComboBox cmbClassNext;
        private System.Windows.Forms.ComboBox cmbTermNext;
    }
}