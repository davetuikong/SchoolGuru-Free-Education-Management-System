namespace SchoolGuru
{
    partial class frmStudentEnrollment
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmStudentEnrollment));
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.grpNextOfKin = new System.Windows.Forms.GroupBox();
            this.label16 = new System.Windows.Forms.Label();
            this.panel3 = new System.Windows.Forms.Panel();
            this.btnSaveDetails = new System.Windows.Forms.Button();
            this.btnDel = new System.Windows.Forms.Button();
            this.btnUpdate = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label15 = new System.Windows.Forms.Label();
            this.lblFather = new System.Windows.Forms.Label();
            this.label23 = new System.Windows.Forms.Label();
            this.txtOrganization = new System.Windows.Forms.TextBox();
            this.label21 = new System.Windows.Forms.Label();
            this.txtGuardian = new System.Windows.Forms.TextBox();
            this.label22 = new System.Windows.Forms.Label();
            this.txtPhone = new System.Windows.Forms.TextBox();
            this.txtEmail = new System.Windows.Forms.TextBox();
            this.txtAddress = new System.Windows.Forms.TextBox();
            this.lblMobile = new System.Windows.Forms.Label();
            this.sponCombo = new System.Windows.Forms.ComboBox();
            this.txtFather = new System.Windows.Forms.TextBox();
            this.txtMother = new System.Windows.Forms.TextBox();
            this.lblMother = new System.Windows.Forms.Label();
            this.lblSponsor = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.txtSearch = new System.Windows.Forms.TextBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.lblCounty = new System.Windows.Forms.Label();
            this.cmbCounty = new System.Windows.Forms.ComboBox();
            this.sname = new System.Windows.Forms.TextBox();
            this.fname = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.dtpDOB = new System.Windows.Forms.DateTimePicker();
            this.txtAdmNo = new System.Windows.Forms.TextBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.label7 = new System.Windows.Forms.Label();
            this.btn_browse = new System.Windows.Forms.Button();
            this.dtpAdmissionDate = new System.Windows.Forms.DateTimePicker();
            this.nationCombo = new System.Windows.Forms.ComboBox();
            this.label8 = new System.Windows.Forms.Label();
            this.label14 = new System.Windows.Forms.Label();
            this.gendCombo = new System.Windows.Forms.ComboBox();
            this.reCombo = new System.Windows.Forms.ComboBox();
            this.label9 = new System.Windows.Forms.Label();
            this.label13 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.grpSchoolDetail = new System.Windows.Forms.GroupBox();
            this.cmbSchool = new System.Windows.Forms.ComboBox();
            this.cmbStatus = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.cmbCategory = new System.Windows.Forms.ComboBox();
            this.lblCategory = new System.Windows.Forms.Label();
            this.cmbTerm = new System.Windows.Forms.ComboBox();
            this.cmbSection = new System.Windows.Forms.ComboBox();
            this.btnSaveSchool = new System.Windows.Forms.Button();
            this.cmbClass = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.btnAddNew = new System.Windows.Forms.Button();
            this.lstStudents = new System.Windows.Forms.ListView();
            this.admissionno = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.fullname = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.errorProvider1 = new System.Windows.Forms.ErrorProvider(this.components);
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.groupBox1.SuspendLayout();
            this.grpNextOfKin.SuspendLayout();
            this.panel3.SuspendLayout();
            this.groupBox3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.grpSchoolDetail.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.grpNextOfKin);
            this.groupBox1.Controls.Add(this.txtSearch);
            this.groupBox1.Controls.Add(this.groupBox3);
            this.groupBox1.Controls.Add(this.grpSchoolDetail);
            this.groupBox1.Controls.Add(this.btnAddNew);
            this.groupBox1.Controls.Add(this.lstStudents);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.ForeColor = System.Drawing.Color.Black;
            this.groupBox1.Location = new System.Drawing.Point(7, 13);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(1218, 663);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Student Enrollment";
            // 
            // grpNextOfKin
            // 
            this.grpNextOfKin.Controls.Add(this.label16);
            this.grpNextOfKin.Controls.Add(this.panel3);
            this.grpNextOfKin.Controls.Add(this.textBox1);
            this.grpNextOfKin.Controls.Add(this.label15);
            this.grpNextOfKin.Controls.Add(this.lblFather);
            this.grpNextOfKin.Controls.Add(this.label23);
            this.grpNextOfKin.Controls.Add(this.txtOrganization);
            this.grpNextOfKin.Controls.Add(this.label21);
            this.grpNextOfKin.Controls.Add(this.txtGuardian);
            this.grpNextOfKin.Controls.Add(this.label22);
            this.grpNextOfKin.Controls.Add(this.txtPhone);
            this.grpNextOfKin.Controls.Add(this.txtEmail);
            this.grpNextOfKin.Controls.Add(this.txtAddress);
            this.grpNextOfKin.Controls.Add(this.lblMobile);
            this.grpNextOfKin.Controls.Add(this.sponCombo);
            this.grpNextOfKin.Controls.Add(this.txtFather);
            this.grpNextOfKin.Controls.Add(this.txtMother);
            this.grpNextOfKin.Controls.Add(this.lblMother);
            this.grpNextOfKin.Controls.Add(this.lblSponsor);
            this.grpNextOfKin.Controls.Add(this.label12);
            this.grpNextOfKin.Location = new System.Drawing.Point(17, 344);
            this.grpNextOfKin.Name = "grpNextOfKin";
            this.grpNextOfKin.Size = new System.Drawing.Size(641, 335);
            this.grpNextOfKin.TabIndex = 3;
            this.grpNextOfKin.TabStop = false;
            this.grpNextOfKin.Text = "Next Of Kin";
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label16.ForeColor = System.Drawing.Color.Black;
            this.label16.Location = new System.Drawing.Point(450, 79);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(58, 15);
            this.label16.TabIndex = 116;
            this.label16.Text = "&Guardian";
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.btnSaveDetails);
            this.panel3.Controls.Add(this.btnDel);
            this.panel3.Controls.Add(this.btnUpdate);
            this.panel3.ForeColor = System.Drawing.Color.Lavender;
            this.panel3.Location = new System.Drawing.Point(137, 253);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(283, 55);
            this.panel3.TabIndex = 2;
            // 
            // btnSaveDetails
            // 
            this.btnSaveDetails.BackColor = System.Drawing.Color.DimGray;
            this.btnSaveDetails.Enabled = false;
            this.btnSaveDetails.FlatAppearance.BorderSize = 0;
            this.btnSaveDetails.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnSaveDetails.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSaveDetails.ForeColor = System.Drawing.Color.Transparent;
            this.btnSaveDetails.Location = new System.Drawing.Point(19, 21);
            this.btnSaveDetails.Name = "btnSaveDetails";
            this.btnSaveDetails.Size = new System.Drawing.Size(68, 23);
            this.btnSaveDetails.TabIndex = 10;
            this.btnSaveDetails.Text = "&Save";
            this.btnSaveDetails.UseVisualStyleBackColor = false;
            this.btnSaveDetails.Click += new System.EventHandler(this.btnSaveDetails_Click);
            // 
            // btnDel
            // 
            this.btnDel.BackColor = System.Drawing.Color.DimGray;
            this.btnDel.Enabled = false;
            this.btnDel.FlatAppearance.BorderSize = 0;
            this.btnDel.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDel.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDel.ForeColor = System.Drawing.Color.White;
            this.btnDel.Location = new System.Drawing.Point(191, 21);
            this.btnDel.Name = "btnDel";
            this.btnDel.Size = new System.Drawing.Size(68, 23);
            this.btnDel.TabIndex = 4;
            this.btnDel.Text = "&Delete";
            this.btnDel.UseVisualStyleBackColor = false;
            this.btnDel.Click += new System.EventHandler(this.btn_Del_Click);
            // 
            // btnUpdate
            // 
            this.btnUpdate.BackColor = System.Drawing.Color.DimGray;
            this.btnUpdate.Enabled = false;
            this.btnUpdate.FlatAppearance.BorderSize = 0;
            this.btnUpdate.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnUpdate.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnUpdate.ForeColor = System.Drawing.Color.White;
            this.btnUpdate.Location = new System.Drawing.Point(106, 21);
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.Size = new System.Drawing.Size(68, 23);
            this.btnUpdate.TabIndex = 2;
            this.btnUpdate.Text = "&Update";
            this.btnUpdate.UseVisualStyleBackColor = false;
            this.btnUpdate.Click += new System.EventHandler(this.btn_Update_Click);
            // 
            // textBox1
            // 
            this.textBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox1.Location = new System.Drawing.Point(453, 97);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(113, 21);
            this.textBox1.TabIndex = 115;
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label15.ForeColor = System.Drawing.Color.Black;
            this.label15.Location = new System.Drawing.Point(294, 79);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(42, 15);
            this.label15.TabIndex = 114;
            this.label15.Text = "&Father";
            // 
            // lblFather
            // 
            this.lblFather.AutoSize = true;
            this.lblFather.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFather.ForeColor = System.Drawing.Color.Black;
            this.lblFather.Location = new System.Drawing.Point(25, 79);
            this.lblFather.Name = "lblFather";
            this.lblFather.Size = new System.Drawing.Size(42, 15);
            this.lblFather.TabIndex = 113;
            this.lblFather.Text = "&Father";
            // 
            // label23
            // 
            this.label23.AutoSize = true;
            this.label23.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label23.ForeColor = System.Drawing.Color.Black;
            this.label23.Location = new System.Drawing.Point(396, 181);
            this.label23.Name = "label23";
            this.label23.Size = new System.Drawing.Size(43, 15);
            this.label23.TabIndex = 112;
            this.label23.Text = "&Phone";
            // 
            // txtOrganization
            // 
            this.txtOrganization.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtOrganization.Location = new System.Drawing.Point(24, 143);
            this.txtOrganization.Name = "txtOrganization";
            this.txtOrganization.Size = new System.Drawing.Size(191, 21);
            this.txtOrganization.TabIndex = 111;
            // 
            // label21
            // 
            this.label21.AutoSize = true;
            this.label21.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label21.ForeColor = System.Drawing.Color.Black;
            this.label21.Location = new System.Drawing.Point(21, 125);
            this.label21.Name = "label21";
            this.label21.Size = new System.Drawing.Size(77, 15);
            this.label21.TabIndex = 109;
            this.label21.Text = "&Organization";
            // 
            // txtGuardian
            // 
            this.txtGuardian.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtGuardian.Location = new System.Drawing.Point(300, 97);
            this.txtGuardian.Name = "txtGuardian";
            this.txtGuardian.Size = new System.Drawing.Size(126, 21);
            this.txtGuardian.TabIndex = 108;
            // 
            // label22
            // 
            this.label22.AutoSize = true;
            this.label22.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label22.ForeColor = System.Drawing.Color.Black;
            this.label22.Location = new System.Drawing.Point(564, -29);
            this.label22.Name = "label22";
            this.label22.Size = new System.Drawing.Size(58, 15);
            this.label22.TabIndex = 107;
            this.label22.Text = "&Guardian";
            // 
            // txtPhone
            // 
            this.txtPhone.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPhone.Location = new System.Drawing.Point(399, 199);
            this.txtPhone.Name = "txtPhone";
            this.txtPhone.Size = new System.Drawing.Size(129, 21);
            this.txtPhone.TabIndex = 106;
            // 
            // txtEmail
            // 
            this.txtEmail.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtEmail.Location = new System.Drawing.Point(226, 199);
            this.txtEmail.Name = "txtEmail";
            this.txtEmail.Size = new System.Drawing.Size(159, 21);
            this.txtEmail.TabIndex = 101;
            // 
            // txtAddress
            // 
            this.txtAddress.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAddress.Location = new System.Drawing.Point(24, 199);
            this.txtAddress.Multiline = true;
            this.txtAddress.Name = "txtAddress";
            this.txtAddress.Size = new System.Drawing.Size(191, 48);
            this.txtAddress.TabIndex = 104;
            // 
            // lblMobile
            // 
            this.lblMobile.AutoSize = true;
            this.lblMobile.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMobile.ForeColor = System.Drawing.Color.Black;
            this.lblMobile.Location = new System.Drawing.Point(21, 181);
            this.lblMobile.Name = "lblMobile";
            this.lblMobile.Size = new System.Drawing.Size(51, 15);
            this.lblMobile.TabIndex = 103;
            this.lblMobile.Text = "&Address";
            // 
            // sponCombo
            // 
            this.sponCombo.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.CustomSource;
            this.sponCombo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.sponCombo.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sponCombo.FormattingEnabled = true;
            this.sponCombo.Items.AddRange(new object[] {
            "Both Parents",
            "Guardian",
            "Father",
            "Organization",
            "Mother"});
            this.sponCombo.Location = new System.Drawing.Point(24, 43);
            this.sponCombo.Name = "sponCombo";
            this.sponCombo.Size = new System.Drawing.Size(200, 23);
            this.sponCombo.TabIndex = 97;
            // 
            // txtFather
            // 
            this.txtFather.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtFather.Location = new System.Drawing.Point(24, 97);
            this.txtFather.Name = "txtFather";
            this.txtFather.Size = new System.Drawing.Size(116, 21);
            this.txtFather.TabIndex = 98;
            // 
            // txtMother
            // 
            this.txtMother.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMother.Location = new System.Drawing.Point(157, 97);
            this.txtMother.Name = "txtMother";
            this.txtMother.Size = new System.Drawing.Size(123, 21);
            this.txtMother.TabIndex = 100;
            // 
            // lblMother
            // 
            this.lblMother.AutoSize = true;
            this.lblMother.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMother.ForeColor = System.Drawing.Color.Black;
            this.lblMother.Location = new System.Drawing.Point(154, 79);
            this.lblMother.Name = "lblMother";
            this.lblMother.Size = new System.Drawing.Size(46, 15);
            this.lblMother.TabIndex = 99;
            this.lblMother.Text = "&Mother";
            // 
            // lblSponsor
            // 
            this.lblSponsor.AutoSize = true;
            this.lblSponsor.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSponsor.ForeColor = System.Drawing.Color.Black;
            this.lblSponsor.Location = new System.Drawing.Point(29, 25);
            this.lblSponsor.Name = "lblSponsor";
            this.lblSponsor.Size = new System.Drawing.Size(53, 15);
            this.lblSponsor.TabIndex = 96;
            this.lblSponsor.Text = "&Sponsor";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label12.ForeColor = System.Drawing.Color.Black;
            this.label12.Location = new System.Drawing.Point(223, 181);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(39, 15);
            this.label12.TabIndex = 37;
            this.label12.Text = "&Email";
            // 
            // txtSearch
            // 
            this.txtSearch.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.Suggest;
            this.txtSearch.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.CustomSource;
            this.txtSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSearch.ForeColor = System.Drawing.SystemColors.ScrollBar;
            this.txtSearch.Location = new System.Drawing.Point(691, 18);
            this.txtSearch.Name = "txtSearch";
            this.txtSearch.Size = new System.Drawing.Size(229, 22);
            this.txtSearch.TabIndex = 4;
            this.txtSearch.Text = "Search Student #";
            this.txtSearch.TextChanged += new System.EventHandler(this.txtStudentSearch_TextChanged);
            this.txtSearch.Enter += new System.EventHandler(this.txtStudentSearch_Enter);
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.lblCounty);
            this.groupBox3.Controls.Add(this.cmbCounty);
            this.groupBox3.Controls.Add(this.sname);
            this.groupBox3.Controls.Add(this.fname);
            this.groupBox3.Controls.Add(this.label6);
            this.groupBox3.Controls.Add(this.dtpDOB);
            this.groupBox3.Controls.Add(this.txtAdmNo);
            this.groupBox3.Controls.Add(this.pictureBox1);
            this.groupBox3.Controls.Add(this.label7);
            this.groupBox3.Controls.Add(this.btn_browse);
            this.groupBox3.Controls.Add(this.dtpAdmissionDate);
            this.groupBox3.Controls.Add(this.nationCombo);
            this.groupBox3.Controls.Add(this.label8);
            this.groupBox3.Controls.Add(this.label14);
            this.groupBox3.Controls.Add(this.gendCombo);
            this.groupBox3.Controls.Add(this.reCombo);
            this.groupBox3.Controls.Add(this.label9);
            this.groupBox3.Controls.Add(this.label13);
            this.groupBox3.Controls.Add(this.label10);
            this.groupBox3.Controls.Add(this.label11);
            this.groupBox3.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox3.ForeColor = System.Drawing.Color.Black;
            this.errorProvider1.SetIconAlignment(this.groupBox3, System.Windows.Forms.ErrorIconAlignment.MiddleLeft);
            this.groupBox3.Location = new System.Drawing.Point(17, 59);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(641, 268);
            this.groupBox3.TabIndex = 1;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Student Information";
            // 
            // lblCounty
            // 
            this.lblCounty.AutoSize = true;
            this.lblCounty.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCounty.ForeColor = System.Drawing.Color.Black;
            this.lblCounty.Location = new System.Drawing.Point(296, 201);
            this.lblCounty.Name = "lblCounty";
            this.lblCounty.Size = new System.Drawing.Size(44, 15);
            this.lblCounty.TabIndex = 46;
            this.lblCounty.Text = "&County";
            // 
            // cmbCounty
            // 
            this.cmbCounty.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.CustomSource;
            this.cmbCounty.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbCounty.FormattingEnabled = true;
            this.cmbCounty.Items.AddRange(new object[] {
            "Nairobi",
            "Kisumu",
            "Kericho",
            "Nandi",
            "Bungoma",
            "Kwale",
            "Kilifi",
            "Mombasa",
            "Taita Taveta",
            "Bomet",
            "Uasin Ngishu",
            "Nakuru",
            "Nyeri",
            "Nyandarua",
            "Muranga"});
            this.cmbCounty.Location = new System.Drawing.Point(296, 219);
            this.cmbCounty.Name = "cmbCounty";
            this.cmbCounty.Size = new System.Drawing.Size(99, 23);
            this.cmbCounty.TabIndex = 45;
            // 
            // sname
            // 
            this.sname.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sname.Location = new System.Drawing.Point(162, 112);
            this.sname.Name = "sname";
            this.sname.Size = new System.Drawing.Size(110, 21);
            this.sname.TabIndex = 44;
            // 
            // fname
            // 
            this.fname.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.fname.Location = new System.Drawing.Point(26, 112);
            this.fname.Name = "fname";
            this.fname.Size = new System.Drawing.Size(113, 21);
            this.fname.TabIndex = 43;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.ForeColor = System.Drawing.Color.Black;
            this.label6.Location = new System.Drawing.Point(21, 29);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(55, 15);
            this.label6.TabIndex = 28;
            this.label6.Text = "&ADM/NO";
            // 
            // dtpDOB
            // 
            this.dtpDOB.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpDOB.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpDOB.Location = new System.Drawing.Point(296, 113);
            this.dtpDOB.Name = "dtpDOB";
            this.dtpDOB.Size = new System.Drawing.Size(96, 20);
            this.dtpDOB.TabIndex = 42;
            // 
            // txtAdmNo
            // 
            this.txtAdmNo.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAdmNo.Location = new System.Drawing.Point(25, 51);
            this.txtAdmNo.Name = "txtAdmNo";
            this.txtAdmNo.Size = new System.Drawing.Size(162, 21);
            this.txtAdmNo.TabIndex = 29;
            this.txtAdmNo.TextChanged += new System.EventHandler(this.txtAdmno_TextChanged);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Black;
            this.pictureBox1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pictureBox1.Location = new System.Drawing.Point(419, 34);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(189, 161);
            this.pictureBox1.TabIndex = 26;
            this.pictureBox1.TabStop = false;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.ForeColor = System.Drawing.Color.Black;
            this.label7.Location = new System.Drawing.Point(296, 34);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(93, 15);
            this.label7.TabIndex = 30;
            this.label7.Text = "Admission Date";
            // 
            // btn_browse
            // 
            this.btn_browse.BackColor = System.Drawing.Color.SandyBrown;
            this.btn_browse.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_browse.ForeColor = System.Drawing.Color.Black;
            this.btn_browse.Location = new System.Drawing.Point(469, 201);
            this.btn_browse.Name = "btn_browse";
            this.btn_browse.Size = new System.Drawing.Size(97, 32);
            this.btn_browse.TabIndex = 27;
            this.btn_browse.Text = "&Browse....";
            this.btn_browse.UseVisualStyleBackColor = false;
            // 
            // dtpAdmissionDate
            // 
            this.dtpAdmissionDate.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpAdmissionDate.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpAdmissionDate.Location = new System.Drawing.Point(296, 52);
            this.dtpAdmissionDate.Name = "dtpAdmissionDate";
            this.dtpAdmissionDate.Size = new System.Drawing.Size(95, 20);
            this.dtpAdmissionDate.TabIndex = 31;
            // 
            // nationCombo
            // 
            this.nationCombo.AutoCompleteCustomSource.AddRange(new string[] {
            "Kenyan",
            "Ugandan",
            "Tanzanian"});
            this.nationCombo.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.CustomSource;
            this.nationCombo.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.nationCombo.FormattingEnabled = true;
            this.nationCombo.Items.AddRange(new object[] {
            "Kenyan",
            "Ugandan",
            "Tanzanian"});
            this.nationCombo.Location = new System.Drawing.Point(24, 219);
            this.nationCombo.Name = "nationCombo";
            this.nationCombo.Size = new System.Drawing.Size(190, 23);
            this.nationCombo.TabIndex = 41;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.ForeColor = System.Drawing.Color.Black;
            this.label8.Location = new System.Drawing.Point(23, 147);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(48, 15);
            this.label8.TabIndex = 32;
            this.label8.Text = "&Gender";
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label14.ForeColor = System.Drawing.Color.Black;
            this.label14.Location = new System.Drawing.Point(23, 198);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(64, 15);
            this.label14.TabIndex = 40;
            this.label14.Text = "&Nationality";
            // 
            // gendCombo
            // 
            this.gendCombo.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.CustomSource;
            this.gendCombo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.gendCombo.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.gendCombo.FormattingEnabled = true;
            this.gendCombo.Items.AddRange(new object[] {
            "Female",
            "Male"});
            this.gendCombo.Location = new System.Drawing.Point(24, 165);
            this.gendCombo.Name = "gendCombo";
            this.gendCombo.Size = new System.Drawing.Size(72, 23);
            this.gendCombo.TabIndex = 33;
            // 
            // reCombo
            // 
            this.reCombo.AutoCompleteCustomSource.AddRange(new string[] {
            "Catholic",
            "Protestant",
            "Muslim",
            "Seventh Day"});
            this.reCombo.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.reCombo.FormattingEnabled = true;
            this.reCombo.Items.AddRange(new object[] {
            "Catholic",
            "Protestant",
            "Muslim",
            "Seventh Day"});
            this.reCombo.Location = new System.Drawing.Point(162, 165);
            this.reCombo.Name = "reCombo";
            this.reCombo.Size = new System.Drawing.Size(99, 23);
            this.reCombo.TabIndex = 39;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.ForeColor = System.Drawing.Color.Black;
            this.label9.Location = new System.Drawing.Point(22, 90);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(67, 15);
            this.label9.TabIndex = 34;
            this.label9.Text = "&First Name";
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label13.ForeColor = System.Drawing.Color.Black;
            this.label13.Location = new System.Drawing.Point(164, 147);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(53, 15);
            this.label13.TabIndex = 38;
            this.label13.Text = "&Religion";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.ForeColor = System.Drawing.Color.Black;
            this.label10.Location = new System.Drawing.Point(159, 90);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(58, 15);
            this.label10.TabIndex = 35;
            this.label10.Text = "&Surname";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.ForeColor = System.Drawing.Color.Black;
            this.label11.Location = new System.Drawing.Point(296, 90);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(39, 15);
            this.label11.TabIndex = 36;
            this.label11.Text = "&D.O.B";
            // 
            // grpSchoolDetail
            // 
            this.grpSchoolDetail.BackColor = System.Drawing.Color.Silver;
            this.grpSchoolDetail.Controls.Add(this.cmbSchool);
            this.grpSchoolDetail.Controls.Add(this.cmbStatus);
            this.grpSchoolDetail.Controls.Add(this.label2);
            this.grpSchoolDetail.Controls.Add(this.cmbCategory);
            this.grpSchoolDetail.Controls.Add(this.lblCategory);
            this.grpSchoolDetail.Controls.Add(this.cmbTerm);
            this.grpSchoolDetail.Controls.Add(this.cmbSection);
            this.grpSchoolDetail.Controls.Add(this.btnSaveSchool);
            this.grpSchoolDetail.Controls.Add(this.cmbClass);
            this.grpSchoolDetail.Controls.Add(this.label3);
            this.grpSchoolDetail.Controls.Add(this.label5);
            this.grpSchoolDetail.Controls.Add(this.label4);
            this.grpSchoolDetail.Controls.Add(this.label1);
            this.grpSchoolDetail.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grpSchoolDetail.ForeColor = System.Drawing.Color.Black;
            this.grpSchoolDetail.Location = new System.Drawing.Point(673, 59);
            this.grpSchoolDetail.Name = "grpSchoolDetail";
            this.grpSchoolDetail.Size = new System.Drawing.Size(316, 335);
            this.grpSchoolDetail.TabIndex = 0;
            this.grpSchoolDetail.TabStop = false;
            this.grpSchoolDetail.Text = "School Details";
            // 
            // cmbSchool
            // 
            this.cmbSchool.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSchool.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbSchool.FormattingEnabled = true;
            this.cmbSchool.Location = new System.Drawing.Point(18, 48);
            this.cmbSchool.Name = "cmbSchool";
            this.cmbSchool.Size = new System.Drawing.Size(284, 24);
            this.cmbSchool.TabIndex = 14;
            // 
            // cmbStatus
            // 
            this.cmbStatus.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbStatus.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbStatus.FormattingEnabled = true;
            this.cmbStatus.Location = new System.Drawing.Point(18, 249);
            this.cmbStatus.Name = "cmbStatus";
            this.cmbStatus.Size = new System.Drawing.Size(108, 24);
            this.cmbStatus.TabIndex = 13;
            // 
            // label2
            // 
            this.label2.AllowDrop = true;
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.Black;
            this.label2.Location = new System.Drawing.Point(15, 231);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(41, 15);
            this.label2.TabIndex = 12;
            this.label2.Text = "Status";
            // 
            // cmbCategory
            // 
            this.cmbCategory.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCategory.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbCategory.FormattingEnabled = true;
            this.cmbCategory.Location = new System.Drawing.Point(18, 95);
            this.cmbCategory.Name = "cmbCategory";
            this.cmbCategory.Size = new System.Drawing.Size(108, 24);
            this.cmbCategory.TabIndex = 11;
            // 
            // lblCategory
            // 
            this.lblCategory.AutoSize = true;
            this.lblCategory.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCategory.ForeColor = System.Drawing.Color.Black;
            this.lblCategory.Location = new System.Drawing.Point(18, 78);
            this.lblCategory.Name = "lblCategory";
            this.lblCategory.Size = new System.Drawing.Size(55, 19);
            this.lblCategory.TabIndex = 10;
            this.lblCategory.Text = "Category";
            this.lblCategory.UseCompatibleTextRendering = true;
            // 
            // cmbTerm
            // 
            this.cmbTerm.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTerm.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbTerm.FormattingEnabled = true;
            this.cmbTerm.Location = new System.Drawing.Point(18, 198);
            this.cmbTerm.Name = "cmbTerm";
            this.cmbTerm.Size = new System.Drawing.Size(284, 24);
            this.cmbTerm.TabIndex = 9;
            // 
            // cmbSection
            // 
            this.cmbSection.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSection.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbSection.FormattingEnabled = true;
            this.cmbSection.Location = new System.Drawing.Point(171, 145);
            this.cmbSection.Name = "cmbSection";
            this.cmbSection.Size = new System.Drawing.Size(131, 24);
            this.cmbSection.TabIndex = 8;
            // 
            // btnSaveSchool
            // 
            this.btnSaveSchool.BackColor = System.Drawing.Color.DimGray;
            this.btnSaveSchool.Enabled = false;
            this.btnSaveSchool.FlatAppearance.BorderSize = 0;
            this.btnSaveSchool.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnSaveSchool.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSaveSchool.ForeColor = System.Drawing.Color.Transparent;
            this.btnSaveSchool.Location = new System.Drawing.Point(118, 296);
            this.btnSaveSchool.Name = "btnSaveSchool";
            this.btnSaveSchool.Size = new System.Drawing.Size(68, 23);
            this.btnSaveSchool.TabIndex = 1;
            this.btnSaveSchool.Text = "&Save";
            this.btnSaveSchool.UseVisualStyleBackColor = false;
            this.btnSaveSchool.Click += new System.EventHandler(this.btnSaveSchool_Click);
            // 
            // cmbClass
            // 
            this.cmbClass.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbClass.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbClass.FormattingEnabled = true;
            this.cmbClass.Location = new System.Drawing.Point(18, 145);
            this.cmbClass.Name = "cmbClass";
            this.cmbClass.Size = new System.Drawing.Size(129, 24);
            this.cmbClass.TabIndex = 7;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.Black;
            this.label3.Location = new System.Drawing.Point(18, 126);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(35, 19);
            this.label3.TabIndex = 2;
            this.label3.Text = "Class";
            this.label3.UseCompatibleTextRendering = true;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.Color.Black;
            this.label5.Location = new System.Drawing.Point(15, 180);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(36, 15);
            this.label5.TabIndex = 4;
            this.label5.Text = "Term";
            // 
            // label4
            // 
            this.label4.AllowDrop = true;
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.Black;
            this.label4.Location = new System.Drawing.Point(150, 126);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(48, 15);
            this.label4.TabIndex = 3;
            this.label4.Text = "Section";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.Black;
            this.label1.Location = new System.Drawing.Point(15, 27);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(82, 15);
            this.label1.TabIndex = 0;
            this.label1.Text = "School Name";
            // 
            // btnAddNew
            // 
            this.btnAddNew.BackColor = System.Drawing.Color.Transparent;
            this.btnAddNew.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("btnAddNew.BackgroundImage")));
            this.btnAddNew.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btnAddNew.FlatAppearance.BorderSize = 0;
            this.btnAddNew.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAddNew.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAddNew.ForeColor = System.Drawing.Color.White;
            this.btnAddNew.Location = new System.Drawing.Point(944, 15);
            this.btnAddNew.Name = "btnAddNew";
            this.btnAddNew.Size = new System.Drawing.Size(31, 25);
            this.btnAddNew.TabIndex = 0;
            this.btnAddNew.UseVisualStyleBackColor = false;
            this.btnAddNew.Click += new System.EventHandler(this.btnAddNew_Click);
            // 
            // lstStudents
            // 
            this.lstStudents.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.lstStudents.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.lstStudents.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.admissionno,
            this.fullname});
            this.lstStudents.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lstStudents.FullRowSelect = true;
            this.lstStudents.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
            this.lstStudents.Location = new System.Drawing.Point(691, 40);
            this.lstStudents.MultiSelect = false;
            this.lstStudents.Name = "lstStudents";
            this.lstStudents.Size = new System.Drawing.Size(279, 158);
            this.lstStudents.TabIndex = 39;
            this.lstStudents.UseCompatibleStateImageBehavior = false;
            this.lstStudents.View = System.Windows.Forms.View.Details;
            this.lstStudents.Visible = false;
            this.lstStudents.KeyDown += new System.Windows.Forms.KeyEventHandler(this.lstStudents_KeyDown);
            this.lstStudents.MouseClick += new System.Windows.Forms.MouseEventHandler(this.lstStudents_MouseClick);
            // 
            // admissionno
            // 
            this.admissionno.Text = "Admission #";
            this.admissionno.Width = 100;
            // 
            // fullname
            // 
            this.fullname.Text = "Name";
            this.fullname.Width = 150;
            // 
            // errorProvider1
            // 
            this.errorProvider1.ContainerControl = this;
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // frmStudentEnrollment
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightGray;
            this.ClientSize = new System.Drawing.Size(1008, 695);
            this.Controls.Add(this.groupBox1);
            this.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.MaximizeBox = false;
            this.Name = "frmStudentEnrollment";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Student Enrollment";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.frmStudentEnrollment_FormClosed);
            this.Load += new System.EventHandler(this.frmStudentEnrollment_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.grpNextOfKin.ResumeLayout(false);
            this.grpNextOfKin.PerformLayout();
            this.panel3.ResumeLayout(false);
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.grpSchoolDetail.ResumeLayout(false);
            this.grpSchoolDetail.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox grpSchoolDetail;
        private System.Windows.Forms.ErrorProvider errorProvider1;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Button btnUpdate;
        private System.Windows.Forms.Button btnAddNew;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cmbTerm;
        private System.Windows.Forms.ComboBox cmbSection;
        private System.Windows.Forms.ComboBox cmbClass;
        private System.Windows.Forms.Button btnDel;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.GroupBox grpNextOfKin;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label15;
        private System.Windows.Forms.Label lblFather;
        private System.Windows.Forms.Label label23;
        private System.Windows.Forms.TextBox txtOrganization;
        private System.Windows.Forms.Label label21;
        private System.Windows.Forms.TextBox txtGuardian;
        private System.Windows.Forms.Label label22;
        private System.Windows.Forms.TextBox txtPhone;
        private System.Windows.Forms.TextBox txtEmail;
        private System.Windows.Forms.TextBox txtAddress;
        private System.Windows.Forms.Label lblMobile;
        private System.Windows.Forms.ComboBox sponCombo;
        private System.Windows.Forms.TextBox txtFather;
        private System.Windows.Forms.TextBox txtMother;
        private System.Windows.Forms.Label lblMother;
        private System.Windows.Forms.Label lblSponsor;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.TextBox sname;
        private System.Windows.Forms.TextBox fname;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.DateTimePicker dtpDOB;
        public System.Windows.Forms.TextBox txtAdmNo;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Button btn_browse;
        private System.Windows.Forms.DateTimePicker dtpAdmissionDate;
        private System.Windows.Forms.ComboBox nationCombo;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.ComboBox gendCombo;
        private System.Windows.Forms.ComboBox reCombo;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Button btnSaveDetails;
        private System.Windows.Forms.ComboBox cmbCategory;
        private System.Windows.Forms.Label lblCategory;
        private System.Windows.Forms.ComboBox cmbCounty;
        private System.Windows.Forms.Label lblCounty;
        private System.Windows.Forms.Button btnSaveSchool;
        private System.Windows.Forms.ComboBox cmbStatus;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtSearch;
        private System.Windows.Forms.ComboBox cmbSchool;
        private System.Windows.Forms.ListView lstStudents;
        private System.Windows.Forms.ColumnHeader admissionno;
        private System.Windows.Forms.ColumnHeader fullname;
    }
}