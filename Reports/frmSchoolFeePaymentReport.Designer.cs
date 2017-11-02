namespace SchoolGuru
{
    partial class frmSchoolFeePaymentReport
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
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label23 = new System.Windows.Forms.Label();
            this.cmbClassQuery = new System.Windows.Forms.ComboBox();
            this.btnFilter = new System.Windows.Forms.Button();
            this.cmbFeeTypeQuery = new System.Windows.Forms.ComboBox();
            this.cmbTermQuery = new System.Windows.Forms.ComboBox();
            this.label10 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.txtFeeAmount = new System.Windows.Forms.TextBox();
            this.txtFeePaid = new System.Windows.Forms.TextBox();
            this.label16 = new System.Windows.Forms.Label();
            this.DGV = new System.Windows.Forms.DataGridView();
            this.label15 = new System.Windows.Forms.Label();
            this.label13 = new System.Windows.Forms.Label();
            this.txtBalance = new System.Windows.Forms.TextBox();
            this.btnExport = new System.Windows.Forms.Button();
            this.student = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.sclass = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TermName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.term = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.feetype = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.datein = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.feeamount = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.paidamount = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DGV)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.btnExport);
            this.groupBox2.Controls.Add(this.label23);
            this.groupBox2.Controls.Add(this.cmbClassQuery);
            this.groupBox2.Controls.Add(this.btnFilter);
            this.groupBox2.Controls.Add(this.cmbFeeTypeQuery);
            this.groupBox2.Controls.Add(this.cmbTermQuery);
            this.groupBox2.Controls.Add(this.label10);
            this.groupBox2.Controls.Add(this.label9);
            this.groupBox2.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox2.ForeColor = System.Drawing.Color.Black;
            this.groupBox2.Location = new System.Drawing.Point(22, 12);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(974, 82);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "School Free Payment Report";
            // 
            // label23
            // 
            this.label23.AutoSize = true;
            this.label23.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label23.Location = new System.Drawing.Point(15, 33);
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
            this.cmbClassQuery.Location = new System.Drawing.Point(63, 33);
            this.cmbClassQuery.Name = "cmbClassQuery";
            this.cmbClassQuery.Size = new System.Drawing.Size(100, 24);
            this.cmbClassQuery.TabIndex = 41;
            // 
            // btnFilter
            // 
            this.btnFilter.BackColor = System.Drawing.Color.SteelBlue;
            this.btnFilter.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnFilter.ForeColor = System.Drawing.Color.Transparent;
            this.btnFilter.Location = new System.Drawing.Point(705, 25);
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
            this.cmbFeeTypeQuery.Location = new System.Drawing.Point(527, 30);
            this.cmbFeeTypeQuery.Name = "cmbFeeTypeQuery";
            this.cmbFeeTypeQuery.Size = new System.Drawing.Size(136, 24);
            this.cmbFeeTypeQuery.TabIndex = 7;
            // 
            // cmbTermQuery
            // 
            this.cmbTermQuery.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTermQuery.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbTermQuery.FormattingEnabled = true;
            this.cmbTermQuery.Location = new System.Drawing.Point(236, 30);
            this.cmbTermQuery.Name = "cmbTermQuery";
            this.cmbTermQuery.Size = new System.Drawing.Size(160, 24);
            this.cmbTermQuery.TabIndex = 5;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(454, 30);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(67, 16);
            this.label10.TabIndex = 4;
            this.label10.Text = "Fee Type";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(190, 27);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(40, 16);
            this.label9.TabIndex = 2;
            this.label9.Text = "Term";
            // 
            // txtFeeAmount
            // 
            this.txtFeeAmount.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtFeeAmount.ForeColor = System.Drawing.Color.Black;
            this.txtFeeAmount.Location = new System.Drawing.Point(11, 620);
            this.txtFeeAmount.Name = "txtFeeAmount";
            this.txtFeeAmount.ReadOnly = true;
            this.txtFeeAmount.Size = new System.Drawing.Size(112, 26);
            this.txtFeeAmount.TabIndex = 34;
            // 
            // txtFeePaid
            // 
            this.txtFeePaid.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtFeePaid.ForeColor = System.Drawing.Color.ForestGreen;
            this.txtFeePaid.Location = new System.Drawing.Point(230, 622);
            this.txtFeePaid.Name = "txtFeePaid";
            this.txtFeePaid.ReadOnly = true;
            this.txtFeePaid.Size = new System.Drawing.Size(102, 26);
            this.txtFeePaid.TabIndex = 33;
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Location = new System.Drawing.Point(8, 607);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(54, 13);
            this.label16.TabIndex = 29;
            this.label16.Text = "Total Due";
            // 
            // DGV
            // 
            this.DGV.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.DGV.BackgroundColor = System.Drawing.SystemColors.ActiveBorder;
            this.DGV.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.DGV.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.student,
            this.sclass,
            this.TermName,
            this.term,
            this.feetype,
            this.datein,
            this.feeamount,
            this.paidamount});
            this.DGV.Location = new System.Drawing.Point(12, 114);
            this.DGV.Name = "DGV";
            this.DGV.RowHeadersVisible = false;
            this.DGV.Size = new System.Drawing.Size(984, 478);
            this.DGV.TabIndex = 4;
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.ForeColor = System.Drawing.Color.ForestGreen;
            this.label15.Location = new System.Drawing.Point(227, 609);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(58, 13);
            this.label15.TabIndex = 31;
            this.label15.Text = "Total  Paid";
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.ForeColor = System.Drawing.Color.Red;
            this.label13.Location = new System.Drawing.Point(396, 607);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(76, 13);
            this.label13.TabIndex = 35;
            this.label13.Text = "Total Balance ";
            // 
            // txtBalance
            // 
            this.txtBalance.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtBalance.ForeColor = System.Drawing.Color.Red;
            this.txtBalance.Location = new System.Drawing.Point(399, 620);
            this.txtBalance.Name = "txtBalance";
            this.txtBalance.ReadOnly = true;
            this.txtBalance.Size = new System.Drawing.Size(109, 26);
            this.txtBalance.TabIndex = 36;
            // 
            // btnExport
            // 
            this.btnExport.BackColor = System.Drawing.Color.Transparent;
            this.btnExport.BackgroundImage = global::SchoolGuru.Properties.Resources.excel;
            this.btnExport.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btnExport.FlatAppearance.BorderSize = 0;
            this.btnExport.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnExport.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnExport.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnExport.Location = new System.Drawing.Point(917, 24);
            this.btnExport.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.btnExport.Name = "btnExport";
            this.btnExport.Size = new System.Drawing.Size(51, 40);
            this.btnExport.TabIndex = 42;
            this.btnExport.UseVisualStyleBackColor = false;
            this.btnExport.Click += new System.EventHandler(this.btnExport_Click);
            // 
            // student
            // 
            this.student.DataPropertyName = "student";
            this.student.HeaderText = "Student";
            this.student.Name = "student";
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
            // datein
            // 
            this.datein.DataPropertyName = "datein";
            this.datein.HeaderText = "Date In";
            this.datein.Name = "datein";
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
            // frmSchoolFeePaymentReport
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightGray;
            this.ClientSize = new System.Drawing.Size(1008, 664);
            this.Controls.Add(this.label13);
            this.Controls.Add(this.txtBalance);
            this.Controls.Add(this.DGV);
            this.Controls.Add(this.txtFeeAmount);
            this.Controls.Add(this.label15);
            this.Controls.Add(this.txtFeePaid);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.label16);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Name = "frmSchoolFeePaymentReport";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "School Fee Payment";
            this.Load += new System.EventHandler(this.frmSchoolFeePayment_Load);
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DGV)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox txtFeeAmount;
        private System.Windows.Forms.TextBox txtFeePaid;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.DataGridView DGV;
        private System.Windows.Forms.Button btnFilter;
        private System.Windows.Forms.Label label15;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.TextBox txtBalance;
        private System.Windows.Forms.Label label23;
        private System.Windows.Forms.ComboBox cmbClassQuery;
        private System.Windows.Forms.ComboBox cmbFeeTypeQuery;
        private System.Windows.Forms.ComboBox cmbTermQuery;
        internal System.Windows.Forms.Button btnExport;
        private System.Windows.Forms.DataGridViewTextBoxColumn student;
        private System.Windows.Forms.DataGridViewTextBoxColumn sclass;
        private System.Windows.Forms.DataGridViewTextBoxColumn TermName;
        private System.Windows.Forms.DataGridViewTextBoxColumn term;
        private System.Windows.Forms.DataGridViewTextBoxColumn feetype;
        private System.Windows.Forms.DataGridViewTextBoxColumn datein;
        private System.Windows.Forms.DataGridViewTextBoxColumn feeamount;
        private System.Windows.Forms.DataGridViewTextBoxColumn paidamount;
    }
}