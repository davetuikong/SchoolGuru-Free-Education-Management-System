namespace SchoolMaster
{
    partial class frmMarksLedger
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmMarksLedger));
            this.label3 = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.CmbClassSearch = new System.Windows.Forms.ComboBox();
            this.cmbBatchSearch = new System.Windows.Forms.ComboBox();
            this.cmbSchoolSearch = new System.Windows.Forms.ComboBox();
            this.label11 = new System.Windows.Forms.Label();
            this.Button1 = new System.Windows.Forms.Button();
            this.label8 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.btnReset = new System.Windows.Forms.Button();
            this.Timer1 = new System.Windows.Forms.Timer(this.components);
            this.panel15 = new System.Windows.Forms.Panel();
            this.button10 = new System.Windows.Forms.Button();
            this.panel2.SuspendLayout();
            this.panel15.SuspendLayout();
            this.SuspendLayout();
            // 
            // label3
            // 
            this.label3.BackColor = System.Drawing.Color.Indigo;
            this.label3.Font = new System.Drawing.Font("Segoe UI Semibold", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.White;
            this.label3.Location = new System.Drawing.Point(-1, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(611, 34);
            this.label3.TabIndex = 190;
            this.label3.Text = "Marks Ledger";
            this.label3.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // panel2
            // 
            this.panel2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel2.Controls.Add(this.CmbClassSearch);
            this.panel2.Controls.Add(this.cmbBatchSearch);
            this.panel2.Controls.Add(this.cmbSchoolSearch);
            this.panel2.Controls.Add(this.label11);
            this.panel2.Controls.Add(this.Button1);
            this.panel2.Controls.Add(this.label8);
            this.panel2.Controls.Add(this.label10);
            this.panel2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.panel2.Location = new System.Drawing.Point(3, 40);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(559, 72);
            this.panel2.TabIndex = 376;
            // 
            // CmbClassSearch
            // 
            this.CmbClassSearch.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.CmbClassSearch.Enabled = false;
            this.CmbClassSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.CmbClassSearch.FormattingEnabled = true;
            this.CmbClassSearch.Location = new System.Drawing.Point(339, 34);
            this.CmbClassSearch.Name = "CmbClassSearch";
            this.CmbClassSearch.Size = new System.Drawing.Size(115, 23);
            this.CmbClassSearch.TabIndex = 43;
            // 
            // cmbBatchSearch
            // 
            this.cmbBatchSearch.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbBatchSearch.Enabled = false;
            this.cmbBatchSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbBatchSearch.FormattingEnabled = true;
            this.cmbBatchSearch.Location = new System.Drawing.Point(211, 33);
            this.cmbBatchSearch.Name = "cmbBatchSearch";
            this.cmbBatchSearch.Size = new System.Drawing.Size(115, 23);
            this.cmbBatchSearch.TabIndex = 33;
            // 
            // cmbSchoolSearch
            // 
            this.cmbSchoolSearch.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.Suggest;
            this.cmbSchoolSearch.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems;
            this.cmbSchoolSearch.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSchoolSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbSchoolSearch.FormattingEnabled = true;
            this.cmbSchoolSearch.Location = new System.Drawing.Point(7, 31);
            this.cmbSchoolSearch.Name = "cmbSchoolSearch";
            this.cmbSchoolSearch.Size = new System.Drawing.Size(193, 23);
            this.cmbSchoolSearch.TabIndex = 42;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.Location = new System.Drawing.Point(336, 10);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(43, 15);
            this.label11.TabIndex = 41;
            this.label11.Text = "Class :";
            // 
            // Button1
            // 
            this.Button1.BackColor = System.Drawing.Color.OrangeRed;
            this.Button1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.Button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Button1.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.Button1.Location = new System.Drawing.Point(461, 31);
            this.Button1.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.Button1.Name = "Button1";
            this.Button1.Size = new System.Drawing.Size(87, 30);
            this.Button1.TabIndex = 37;
            this.Button1.Text = "&Search";
            this.Button1.UseVisualStyleBackColor = false;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(4, 8);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(51, 15);
            this.label8.TabIndex = 39;
            this.label8.Text = "School :";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(209, 9);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(57, 15);
            this.label10.TabIndex = 38;
            this.label10.Text = "Session :";
            // 
            // btnReset
            // 
            this.btnReset.BackColor = System.Drawing.Color.Crimson;
            this.btnReset.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnReset.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnReset.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnReset.Location = new System.Drawing.Point(10, 24);
            this.btnReset.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.btnReset.Name = "btnReset";
            this.btnReset.Size = new System.Drawing.Size(82, 30);
            this.btnReset.TabIndex = 0;
            this.btnReset.Text = "&Reset";
            this.btnReset.UseVisualStyleBackColor = false;
            // 
            // Timer1
            // 
            this.Timer1.Enabled = true;
            // 
            // panel15
            // 
            this.panel15.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel15.Controls.Add(this.button10);
            this.panel15.Controls.Add(this.btnReset);
            this.panel15.Location = new System.Drawing.Point(6, 119);
            this.panel15.Name = "panel15";
            this.panel15.Size = new System.Drawing.Size(195, 73);
            this.panel15.TabIndex = 377;
            // 
            // button10
            // 
            this.button10.BackColor = System.Drawing.Color.Indigo;
            this.button10.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button10.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button10.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.button10.Location = new System.Drawing.Point(103, 25);
            this.button10.Name = "button10";
            this.button10.Size = new System.Drawing.Size(82, 30);
            this.button10.TabIndex = 1;
            this.button10.Text = "Close";
            this.button10.UseVisualStyleBackColor = false;
            // 
            // frmMarksLedger
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.ClientSize = new System.Drawing.Size(630, 199);
            this.Controls.Add(this.panel15);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.label3);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmMarksLedger";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "MarksLedger";
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.panel15.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        public System.Windows.Forms.Label label3;
        internal System.Windows.Forms.Panel panel2;
        internal System.Windows.Forms.ComboBox CmbClassSearch;
        internal System.Windows.Forms.ComboBox cmbBatchSearch;
        internal System.Windows.Forms.ComboBox cmbSchoolSearch;
        internal System.Windows.Forms.Label label11;
        private System.Windows.Forms.Button Button1;
        internal System.Windows.Forms.Label label8;
        internal System.Windows.Forms.Label label10;
        internal System.Windows.Forms.Timer Timer1;
        private System.Windows.Forms.Button btnReset;
        internal System.Windows.Forms.Panel panel15;
        public System.Windows.Forms.Button button10;
    }
}