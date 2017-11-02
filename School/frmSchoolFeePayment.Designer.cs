namespace SchoolGuru
{
    partial class frmSchoolFeePayment
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.txtCategory = new System.Windows.Forms.TextBox();
            this.txtSection = new System.Windows.Forms.TextBox();
            this.txtClass = new System.Windows.Forms.TextBox();
            this.txtTerm = new System.Windows.Forms.TextBox();
            this.label21 = new System.Windows.Forms.Label();
            this.cmbSchool = new System.Windows.Forms.ComboBox();
            this.lblCategory = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.txtAdmissionDate = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtStudName = new System.Windows.Forms.TextBox();
            this.txtAdmNo = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label23 = new System.Windows.Forms.Label();
            this.cmbClassQuery = new System.Windows.Forms.ComboBox();
            this.btnFilter = new System.Windows.Forms.Button();
            this.cmbFeeTypeQuery = new System.Windows.Forms.ComboBox();
            this.cmbTermQuery = new System.Windows.Forms.ComboBox();
            this.label10 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.label22 = new System.Windows.Forms.Label();
            this.cmbClassPay = new System.Windows.Forms.ComboBox();
            this.label20 = new System.Windows.Forms.Label();
            this.label19 = new System.Windows.Forms.Label();
            this.cmbTermPay = new System.Windows.Forms.ComboBox();
            this.label8 = new System.Windows.Forms.Label();
            this.cmbFeeTypePay = new System.Windows.Forms.ComboBox();
            this.btnReceive = new System.Windows.Forms.Button();
            this.dtpPaydate = new System.Windows.Forms.DateTimePicker();
            this.txtComment = new System.Windows.Forms.TextBox();
            this.label17 = new System.Windows.Forms.Label();
            this.txtTotalPaid = new System.Windows.Forms.TextBox();
            this.label14 = new System.Windows.Forms.Label();
            this.cmbPayMode = new System.Windows.Forms.ComboBox();
            this.label12 = new System.Windows.Forms.Label();
            this.txtFeeAmount = new System.Windows.Forms.TextBox();
            this.txtFeePaid = new System.Windows.Forms.TextBox();
            this.label16 = new System.Windows.Forms.Label();
            this.label18 = new System.Windows.Forms.Label();
            this.DGV = new System.Windows.Forms.DataGridView();
            this.label15 = new System.Windows.Forms.Label();
            this.label13 = new System.Windows.Forms.Label();
            this.txtBalance = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.lstStudents = new System.Windows.Forms.ListView();
            this.admissionno = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.fullname = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.txtSearch = new System.Windows.Forms.TextBox();
            this.sclass = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TermName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.term = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.feetype = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.feeamount = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.paidamount = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.datein = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DGV)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.txtCategory);
            this.groupBox1.Controls.Add(this.txtSection);
            this.groupBox1.Controls.Add(this.txtClass);
            this.groupBox1.Controls.Add(this.txtTerm);
            this.groupBox1.Controls.Add(this.label21);
            this.groupBox1.Controls.Add(this.cmbSchool);
            this.groupBox1.Controls.Add(this.lblCategory);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Controls.Add(this.txtAdmissionDate);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.txtStudName);
            this.groupBox1.Controls.Add(this.txtAdmNo);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.ForeColor = System.Drawing.Color.Black;
            this.groupBox1.Location = new System.Drawing.Point(12, 26);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(467, 295);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Fee Payment";
            // 
            // txtCategory
            // 
            this.txtCategory.BackColor = System.Drawing.Color.WhiteSmoke;
            this.txtCategory.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCategory.ForeColor = System.Drawing.Color.Black;
            this.txtCategory.Location = new System.Drawing.Point(323, 138);
            this.txtCategory.Name = "txtCategory";
            this.txtCategory.ReadOnly = true;
            this.txtCategory.Size = new System.Drawing.Size(136, 22);
            this.txtCategory.TabIndex = 47;
            // 
            // txtSection
            // 
            this.txtSection.BackColor = System.Drawing.Color.WhiteSmoke;
            this.txtSection.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtSection.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSection.ForeColor = System.Drawing.Color.Black;
            this.txtSection.Location = new System.Drawing.Point(356, 211);
            this.txtSection.Name = "txtSection";
            this.txtSection.ReadOnly = true;
            this.txtSection.Size = new System.Drawing.Size(91, 22);
            this.txtSection.TabIndex = 46;
            // 
            // txtClass
            // 
            this.txtClass.BackColor = System.Drawing.Color.WhiteSmoke;
            this.txtClass.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtClass.ForeColor = System.Drawing.Color.Black;
            this.txtClass.Location = new System.Drawing.Point(131, 211);
            this.txtClass.Name = "txtClass";
            this.txtClass.ReadOnly = true;
            this.txtClass.Size = new System.Drawing.Size(136, 22);
            this.txtClass.TabIndex = 45;
            // 
            // txtTerm
            // 
            this.txtTerm.BackColor = System.Drawing.Color.WhiteSmoke;
            this.txtTerm.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTerm.ForeColor = System.Drawing.Color.Black;
            this.txtTerm.Location = new System.Drawing.Point(131, 259);
            this.txtTerm.Name = "txtTerm";
            this.txtTerm.ReadOnly = true;
            this.txtTerm.Size = new System.Drawing.Size(200, 22);
            this.txtTerm.TabIndex = 44;
            // 
            // label21
            // 
            this.label21.AutoSize = true;
            this.label21.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label21.Location = new System.Drawing.Point(20, 207);
            this.label21.Name = "label21";
            this.label21.Size = new System.Drawing.Size(88, 16);
            this.label21.TabIndex = 35;
            this.label21.Text = "Current Detail\r\n";
            // 
            // cmbSchool
            // 
            this.cmbSchool.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSchool.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbSchool.FormattingEnabled = true;
            this.cmbSchool.Location = new System.Drawing.Point(23, 30);
            this.cmbSchool.Name = "cmbSchool";
            this.cmbSchool.Size = new System.Drawing.Size(436, 28);
            this.cmbSchool.TabIndex = 34;
            // 
            // lblCategory
            // 
            this.lblCategory.AutoSize = true;
            this.lblCategory.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCategory.ForeColor = System.Drawing.Color.Black;
            this.lblCategory.Location = new System.Drawing.Point(258, 138);
            this.lblCategory.Name = "lblCategory";
            this.lblCategory.Size = new System.Drawing.Size(59, 20);
            this.lblCategory.TabIndex = 32;
            this.lblCategory.Text = "Category";
            this.lblCategory.UseCompatibleTextRendering = true;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.Color.Black;
            this.label5.Location = new System.Drawing.Point(131, 193);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(35, 19);
            this.label5.TabIndex = 26;
            this.label5.Text = "Class";
            this.label5.UseCompatibleTextRendering = true;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.ForeColor = System.Drawing.Color.Black;
            this.label6.Location = new System.Drawing.Point(128, 241);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(36, 15);
            this.label6.TabIndex = 28;
            this.label6.Text = "Term";
            // 
            // label7
            // 
            this.label7.AllowDrop = true;
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.ForeColor = System.Drawing.Color.Black;
            this.label7.Location = new System.Drawing.Point(353, 193);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(48, 15);
            this.label7.TabIndex = 27;
            this.label7.Text = "Section";
            // 
            // txtAdmissionDate
            // 
            this.txtAdmissionDate.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAdmissionDate.Location = new System.Drawing.Point(132, 138);
            this.txtAdmissionDate.Name = "txtAdmissionDate";
            this.txtAdmissionDate.ReadOnly = true;
            this.txtAdmissionDate.Size = new System.Drawing.Size(99, 22);
            this.txtAdmissionDate.TabIndex = 25;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(22, 142);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(103, 16);
            this.label3.TabIndex = 24;
            this.label3.Text = "Admission Date";
            // 
            // txtStudName
            // 
            this.txtStudName.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtStudName.Location = new System.Drawing.Point(132, 67);
            this.txtStudName.Name = "txtStudName";
            this.txtStudName.ReadOnly = true;
            this.txtStudName.Size = new System.Drawing.Size(299, 22);
            this.txtStudName.TabIndex = 6;
            // 
            // txtAdmNo
            // 
            this.txtAdmNo.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAdmNo.Location = new System.Drawing.Point(132, 98);
            this.txtAdmNo.Name = "txtAdmNo";
            this.txtAdmNo.ReadOnly = true;
            this.txtAdmNo.Size = new System.Drawing.Size(99, 22);
            this.txtAdmNo.TabIndex = 5;
            this.txtAdmNo.TextChanged += new System.EventHandler(this.txtAdmNo_TextChanged);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(20, 169);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(0, 16);
            this.label4.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(21, 70);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(96, 16);
            this.label2.TabIndex = 1;
            this.label2.Text = "Student Name:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(22, 104);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(95, 16);
            this.label1.TabIndex = 0;
            this.label1.Text = "Admission No:";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.label23);
            this.groupBox2.Controls.Add(this.cmbClassQuery);
            this.groupBox2.Controls.Add(this.btnFilter);
            this.groupBox2.Controls.Add(this.cmbFeeTypeQuery);
            this.groupBox2.Controls.Add(this.cmbTermQuery);
            this.groupBox2.Controls.Add(this.label10);
            this.groupBox2.Controls.Add(this.label9);
            this.groupBox2.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox2.ForeColor = System.Drawing.Color.Black;
            this.groupBox2.Location = new System.Drawing.Point(12, 321);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(467, 123);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Query  Transactions";
            // 
            // label23
            // 
            this.label23.AutoSize = true;
            this.label23.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label23.Location = new System.Drawing.Point(15, 30);
            this.label23.Name = "label23";
            this.label23.Size = new System.Drawing.Size(42, 16);
            this.label23.TabIndex = 41;
            this.label23.Text = "Class";
            // 
            // cmbClassQuery
            // 
            this.cmbClassQuery.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbClassQuery.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbClassQuery.FormattingEnabled = true;
            this.cmbClassQuery.Location = new System.Drawing.Point(132, 33);
            this.cmbClassQuery.Name = "cmbClassQuery";
            this.cmbClassQuery.Size = new System.Drawing.Size(100, 24);
            this.cmbClassQuery.TabIndex = 41;
            // 
            // btnFilter
            // 
            this.btnFilter.BackColor = System.Drawing.Color.SteelBlue;
            this.btnFilter.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnFilter.ForeColor = System.Drawing.Color.Transparent;
            this.btnFilter.Location = new System.Drawing.Point(352, 77);
            this.btnFilter.Name = "btnFilter";
            this.btnFilter.Size = new System.Drawing.Size(109, 32);
            this.btnFilter.TabIndex = 8;
            this.btnFilter.Text = "Filter";
            this.btnFilter.UseVisualStyleBackColor = false;
            this.btnFilter.Click += new System.EventHandler(this.btnFilter_Click);
            // 
            // cmbFeeTypeQuery
            // 
            this.cmbFeeTypeQuery.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbFeeTypeQuery.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbFeeTypeQuery.FormattingEnabled = true;
            this.cmbFeeTypeQuery.Location = new System.Drawing.Point(131, 82);
            this.cmbFeeTypeQuery.Name = "cmbFeeTypeQuery";
            this.cmbFeeTypeQuery.Size = new System.Drawing.Size(136, 24);
            this.cmbFeeTypeQuery.TabIndex = 7;
            // 
            // cmbTermQuery
            // 
            this.cmbTermQuery.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTermQuery.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbTermQuery.FormattingEnabled = true;
            this.cmbTermQuery.Location = new System.Drawing.Point(307, 33);
            this.cmbTermQuery.Name = "cmbTermQuery";
            this.cmbTermQuery.Size = new System.Drawing.Size(160, 24);
            this.cmbTermQuery.TabIndex = 5;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(15, 82);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(67, 16);
            this.label10.TabIndex = 4;
            this.label10.Text = "Fee Type";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(256, 33);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(40, 16);
            this.label9.TabIndex = 2;
            this.label9.Text = "Term";
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.label22);
            this.groupBox3.Controls.Add(this.cmbClassPay);
            this.groupBox3.Controls.Add(this.label20);
            this.groupBox3.Controls.Add(this.label19);
            this.groupBox3.Controls.Add(this.cmbTermPay);
            this.groupBox3.Controls.Add(this.label8);
            this.groupBox3.Controls.Add(this.cmbFeeTypePay);
            this.groupBox3.Controls.Add(this.btnReceive);
            this.groupBox3.Controls.Add(this.dtpPaydate);
            this.groupBox3.Controls.Add(this.txtComment);
            this.groupBox3.Controls.Add(this.label17);
            this.groupBox3.Controls.Add(this.txtTotalPaid);
            this.groupBox3.Controls.Add(this.label14);
            this.groupBox3.Controls.Add(this.cmbPayMode);
            this.groupBox3.Controls.Add(this.label12);
            this.groupBox3.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox3.ForeColor = System.Drawing.Color.Black;
            this.groupBox3.Location = new System.Drawing.Point(12, 463);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(984, 188);
            this.groupBox3.TabIndex = 2;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Payment Details:";
            // 
            // label22
            // 
            this.label22.AutoSize = true;
            this.label22.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label22.Location = new System.Drawing.Point(22, 48);
            this.label22.Name = "label22";
            this.label22.Size = new System.Drawing.Size(42, 16);
            this.label22.TabIndex = 40;
            this.label22.Text = "Class";
            // 
            // cmbClassPay
            // 
            this.cmbClassPay.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbClassPay.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbClassPay.FormattingEnabled = true;
            this.cmbClassPay.Location = new System.Drawing.Point(154, 45);
            this.cmbClassPay.Name = "cmbClassPay";
            this.cmbClassPay.Size = new System.Drawing.Size(129, 24);
            this.cmbClassPay.TabIndex = 36;
            // 
            // label20
            // 
            this.label20.AutoSize = true;
            this.label20.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label20.Location = new System.Drawing.Point(327, 105);
            this.label20.Name = "label20";
            this.label20.Size = new System.Drawing.Size(44, 16);
            this.label20.TabIndex = 39;
            this.label20.Text = "Notes";
            // 
            // label19
            // 
            this.label19.AutoSize = true;
            this.label19.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label19.Location = new System.Drawing.Point(20, 155);
            this.label19.Name = "label19";
            this.label19.Size = new System.Drawing.Size(67, 16);
            this.label19.TabIndex = 38;
            this.label19.Text = "Fee Type";
            // 
            // cmbTermPay
            // 
            this.cmbTermPay.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTermPay.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbTermPay.FormattingEnabled = true;
            this.cmbTermPay.Location = new System.Drawing.Point(154, 102);
            this.cmbTermPay.Name = "cmbTermPay";
            this.cmbTermPay.Size = new System.Drawing.Size(136, 24);
            this.cmbTermPay.TabIndex = 37;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(20, 110);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(40, 16);
            this.label8.TabIndex = 36;
            this.label8.Text = "Term";
            // 
            // cmbFeeTypePay
            // 
            this.cmbFeeTypePay.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbFeeTypePay.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbFeeTypePay.FormattingEnabled = true;
            this.cmbFeeTypePay.Location = new System.Drawing.Point(154, 152);
            this.cmbFeeTypePay.Name = "cmbFeeTypePay";
            this.cmbFeeTypePay.Size = new System.Drawing.Size(142, 24);
            this.cmbFeeTypePay.TabIndex = 9;
            // 
            // btnReceive
            // 
            this.btnReceive.BackColor = System.Drawing.Color.Green;
            this.btnReceive.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnReceive.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnReceive.ForeColor = System.Drawing.Color.Transparent;
            this.btnReceive.Location = new System.Drawing.Point(834, 65);
            this.btnReceive.Name = "btnReceive";
            this.btnReceive.Size = new System.Drawing.Size(144, 111);
            this.btnReceive.TabIndex = 6;
            this.btnReceive.Text = "&Receive Payment";
            this.btnReceive.UseVisualStyleBackColor = false;
            this.btnReceive.Click += new System.EventHandler(this.btnReceive_Click);
            // 
            // dtpPaydate
            // 
            this.dtpPaydate.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpPaydate.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpPaydate.Location = new System.Drawing.Point(600, 64);
            this.dtpPaydate.Name = "dtpPaydate";
            this.dtpPaydate.Size = new System.Drawing.Size(142, 22);
            this.dtpPaydate.TabIndex = 35;
            this.dtpPaydate.Value = new System.DateTime(2017, 7, 14, 0, 0, 0, 0);
            // 
            // txtComment
            // 
            this.txtComment.Location = new System.Drawing.Point(409, 91);
            this.txtComment.Multiline = true;
            this.txtComment.Name = "txtComment";
            this.txtComment.Size = new System.Drawing.Size(154, 80);
            this.txtComment.TabIndex = 32;
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label17.Location = new System.Drawing.Point(600, 45);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(96, 16);
            this.label17.TabIndex = 28;
            this.label17.Text = "Payment Date:";
            // 
            // txtTotalPaid
            // 
            this.txtTotalPaid.BackColor = System.Drawing.SystemColors.InactiveCaptionText;
            this.txtTotalPaid.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTotalPaid.ForeColor = System.Drawing.SystemColors.Info;
            this.txtTotalPaid.Location = new System.Drawing.Point(600, 137);
            this.txtTotalPaid.Name = "txtTotalPaid";
            this.txtTotalPaid.Size = new System.Drawing.Size(142, 31);
            this.txtTotalPaid.TabIndex = 26;
            this.txtTotalPaid.Text = "0.00";
            this.txtTotalPaid.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtTotalPaid.Enter += new System.EventHandler(this.txtTotalPaid_Enter);
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label14.Location = new System.Drawing.Point(597, 118);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(109, 16);
            this.label14.TabIndex = 9;
            this.label14.Text = "Payment Amount";
            // 
            // cmbPayMode
            // 
            this.cmbPayMode.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbPayMode.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbPayMode.FormattingEnabled = true;
            this.cmbPayMode.Items.AddRange(new object[] {
            "Select Payment Mode",
            "Cash",
            "M-pesa",
            "Cheque",
            "Credit Card",
            "Scholarship"});
            this.cmbPayMode.Location = new System.Drawing.Point(409, 45);
            this.cmbPayMode.Name = "cmbPayMode";
            this.cmbPayMode.Size = new System.Drawing.Size(154, 24);
            this.cmbPayMode.TabIndex = 6;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label12.Location = new System.Drawing.Point(327, 45);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(73, 16);
            this.label12.TabIndex = 3;
            this.label12.Text = "Pay Mode:";
            // 
            // txtFeeAmount
            // 
            this.txtFeeAmount.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtFeeAmount.ForeColor = System.Drawing.Color.Black;
            this.txtFeeAmount.Location = new System.Drawing.Point(492, 434);
            this.txtFeeAmount.Name = "txtFeeAmount";
            this.txtFeeAmount.ReadOnly = true;
            this.txtFeeAmount.Size = new System.Drawing.Size(112, 26);
            this.txtFeeAmount.TabIndex = 34;
            // 
            // txtFeePaid
            // 
            this.txtFeePaid.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtFeePaid.ForeColor = System.Drawing.Color.ForestGreen;
            this.txtFeePaid.Location = new System.Drawing.Point(711, 436);
            this.txtFeePaid.Name = "txtFeePaid";
            this.txtFeePaid.ReadOnly = true;
            this.txtFeePaid.Size = new System.Drawing.Size(102, 26);
            this.txtFeePaid.TabIndex = 33;
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Location = new System.Drawing.Point(489, 421);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(54, 13);
            this.label16.TabIndex = 29;
            this.label16.Text = "Total Due";
            // 
            // label18
            // 
            this.label18.AutoSize = true;
            this.label18.Location = new System.Drawing.Point(451, 549);
            this.label18.Name = "label18";
            this.label18.Size = new System.Drawing.Size(78, 13);
            this.label18.TabIndex = 27;
            this.label18.Text = "Payment Detail";
            // 
            // DGV
            // 
            this.DGV.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.DGV.BackgroundColor = System.Drawing.SystemColors.ActiveBorder;
            this.DGV.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.DGV.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.sclass,
            this.TermName,
            this.term,
            this.feetype,
            this.feeamount,
            this.paidamount,
            this.datein});
            this.DGV.Location = new System.Drawing.Point(492, 45);
            this.DGV.Name = "DGV";
            this.DGV.RowHeadersVisible = false;
            this.DGV.Size = new System.Drawing.Size(498, 350);
            this.DGV.TabIndex = 4;
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.ForeColor = System.Drawing.Color.ForestGreen;
            this.label15.Location = new System.Drawing.Point(708, 423);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(58, 13);
            this.label15.TabIndex = 31;
            this.label15.Text = "Total  Paid";
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.ForeColor = System.Drawing.Color.Red;
            this.label13.Location = new System.Drawing.Point(877, 421);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(46, 13);
            this.label13.TabIndex = 35;
            this.label13.Text = "Balance";
            // 
            // txtBalance
            // 
            this.txtBalance.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtBalance.ForeColor = System.Drawing.Color.Red;
            this.txtBalance.Location = new System.Drawing.Point(880, 434);
            this.txtBalance.Name = "txtBalance";
            this.txtBalance.ReadOnly = true;
            this.txtBalance.Size = new System.Drawing.Size(109, 26);
            this.txtBalance.TabIndex = 36;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.ForeColor = System.Drawing.Color.SteelBlue;
            this.label11.Location = new System.Drawing.Point(554, 17);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(133, 16);
            this.label11.TabIndex = 26;
            this.label11.Text = "Search Student >>";
            // 
            // lstStudents
            // 
            this.lstStudents.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.lstStudents.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.lstStudents.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.admissionno,
            this.fullname});
            this.lstStudents.FullRowSelect = true;
            this.lstStudents.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
            this.lstStudents.Location = new System.Drawing.Point(711, 33);
            this.lstStudents.MultiSelect = false;
            this.lstStudents.Name = "lstStudents";
            this.lstStudents.Size = new System.Drawing.Size(279, 158);
            this.lstStudents.TabIndex = 38;
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
            // txtSearch
            // 
            this.txtSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSearch.Location = new System.Drawing.Point(710, 14);
            this.txtSearch.Name = "txtSearch";
            this.txtSearch.Size = new System.Drawing.Size(279, 22);
            this.txtSearch.TabIndex = 39;
            this.txtSearch.TextChanged += new System.EventHandler(this.txtSearch_TextChanged);
            this.txtSearch.KeyDown += new System.Windows.Forms.KeyEventHandler(this.lstStudents_KeyDown);
            // 
            // sclass
            // 
            this.sclass.DataPropertyName = "sclass";
            this.sclass.HeaderText = "Class";
            this.sclass.Name = "sclass";
            // 
            // TermName
            // 
            this.TermName.DataPropertyName = "termname";
            this.TermName.HeaderText = "Term";
            this.TermName.Name = "TermName";
            // 
            // term
            // 
            this.term.DataPropertyName = "term";
            this.term.HeaderText = "term";
            this.term.Name = "term";
            this.term.Visible = false;
            // 
            // feetype
            // 
            this.feetype.DataPropertyName = "feetype";
            this.feetype.HeaderText = "FeeType";
            this.feetype.Name = "feetype";
            // 
            // feeamount
            // 
            this.feeamount.DataPropertyName = "feeamount";
            this.feeamount.HeaderText = "Fee Amount";
            this.feeamount.Name = "feeamount";
            // 
            // paidamount
            // 
            this.paidamount.DataPropertyName = "paidamount";
            this.paidamount.HeaderText = "Paid Amount";
            this.paidamount.Name = "paidamount";
            // 
            // datein
            // 
            this.datein.DataPropertyName = "datein";
            this.datein.HeaderText = "Date In";
            this.datein.Name = "datein";
            // 
            // frmSchoolFeePayment
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightGray;
            this.ClientSize = new System.Drawing.Size(1008, 664);
            this.Controls.Add(this.txtSearch);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.label13);
            this.Controls.Add(this.txtBalance);
            this.Controls.Add(this.DGV);
            this.Controls.Add(this.txtFeeAmount);
            this.Controls.Add(this.label15);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.txtFeePaid);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.label16);
            this.Controls.Add(this.label18);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.lstStudents);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Name = "frmSchoolFeePayment";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Class Fee Payment";
            this.Load += new System.EventHandler(this.frmSchoolFeePayment_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DGV)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtStudName;
        private System.Windows.Forms.TextBox txtAdmNo;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.ComboBox cmbPayMode;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.TextBox txtFeeAmount;
        private System.Windows.Forms.TextBox txtFeePaid;
        private System.Windows.Forms.TextBox txtComment;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.Label label17;
        private System.Windows.Forms.Label label18;
        private System.Windows.Forms.DateTimePicker dtpPaydate;
        private System.Windows.Forms.DataGridView DGV;
        private System.Windows.Forms.Button btnFilter;
        private System.Windows.Forms.Button btnReceive;
        private System.Windows.Forms.Label label15;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.ComboBox cmbFeeTypePay;
        private System.Windows.Forms.Label label20;
        private System.Windows.Forms.Label label19;
        private System.Windows.Forms.ComboBox cmbTermPay;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.TextBox txtBalance;
        private System.Windows.Forms.TextBox txtAdmissionDate;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.ListView lstStudents;
        private System.Windows.Forms.ColumnHeader admissionno;
        private System.Windows.Forms.ColumnHeader fullname;
        private System.Windows.Forms.TextBox txtSearch;
        private System.Windows.Forms.Label lblCategory;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.ComboBox cmbSchool;
        private System.Windows.Forms.Label label21;
        private System.Windows.Forms.TextBox txtTotalPaid;
        private System.Windows.Forms.Label label22;
        private System.Windows.Forms.ComboBox cmbClassPay;
        private System.Windows.Forms.Label label23;
        private System.Windows.Forms.ComboBox cmbClassQuery;
        private System.Windows.Forms.TextBox txtSection;
        private System.Windows.Forms.TextBox txtClass;
        private System.Windows.Forms.TextBox txtTerm;
        private System.Windows.Forms.ComboBox cmbFeeTypeQuery;
        private System.Windows.Forms.ComboBox cmbTermQuery;
        private System.Windows.Forms.TextBox txtCategory;
        private System.Windows.Forms.DataGridViewTextBoxColumn sclass;
        private System.Windows.Forms.DataGridViewTextBoxColumn TermName;
        private System.Windows.Forms.DataGridViewTextBoxColumn term;
        private System.Windows.Forms.DataGridViewTextBoxColumn feetype;
        private System.Windows.Forms.DataGridViewTextBoxColumn feeamount;
        private System.Windows.Forms.DataGridViewTextBoxColumn paidamount;
        private System.Windows.Forms.DataGridViewTextBoxColumn datein;
    }
}