using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.Specialized;
using Npgsql;
using Microsoft.VisualBasic;
using System.Windows.Forms;
using System.Data;
using System.IO;
using System.Diagnostics;
using System.Text.RegularExpressions;


namespace SchoolGuru

{      
    
  

   public partial  class School
    {
   
      


       public DataSet dsSchoolParameter(string dtbl)
       {
           DataSet ds = new DataSet();
        
          try
            {
                SQLConn.sqL = "select id, departmentname from department ";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);
                DataTable dt = new DataTable();
                dt.TableName = "dept";
                dt.Columns.Add("id", typeof(string));
                dt.Columns.Add("departmentname", typeof(string));
                SQLConn.da.Fill(dt);
                dt.Rows.Add(new Object[] { "-1", "Select Dept" });
                ds.Tables.Add(dt);
                if (dtbl == "dept") return ds;


              ///Class
              ///
               dt= new DataTable();

               SQLConn.sqL = "select  1 as id, classname   from schoolclass group by schoolclass.classname ";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
               SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);
               dt.TableName = "class";
               dt.Columns.Add("id", typeof(string));
               dt.Columns.Add("classname", typeof(string));
              SQLConn.da.Fill(dt);
              dt.Rows.Add(new Object[] { "-1", "Select Class" });
  
               ds.Tables.Add(dt);
               if (dtbl == "class") return ds;

               ///ClassSEction
               ///
               dt = new DataTable();

               SQLConn.sqL = "select distinct  concat( classname || section ) as classection, id from schoolclass ";
               SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
               SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);

               dt.TableName = "classection";
               dt.Columns.Add("id", typeof(string));
               dt.Columns.Add("classection", typeof(string));


               SQLConn.da.Fill(dt);
               dt.Rows.Add(new Object[] { "-1", "Select Class" });

               ds.Tables.Add(dt);
               if (dtbl == "classection") return ds;
        

              ///Term
               dt = new DataTable();
               SQLConn.sqL = "select id, termname from schoolterm";
               SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                 SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);

                 dt.TableName = "term";
                 dt.Columns.Add("id", typeof(string));
                 dt.Columns.Add("termname", typeof(string));

                  SQLConn.da.Fill(dt);
                  dt.Rows.Add(new Object[] { "-1", "Select Term" });
                ds.Tables.Add(dt);
                if (dtbl == "term") return ds;

                ///Sectiom
                dt = new DataTable();
                SQLConn.sqL = "select distinct sectionname, id from section ";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);

                dt.TableName = "section";
                dt.Columns.Add("id", typeof(string));
                dt.Columns.Add("sectionname", typeof(string));

                SQLConn.da.Fill(dt);
                dt.Rows.Add(new Object[] {"-1", "Select Section" });
                ds.Tables.Add(dt);
                if (dtbl == "section") return ds;


                ///School 
                dt = new DataTable();
                SQLConn.sqL = "select distinct schoolname, id from school ";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);
                 dt.TableName = "school";
                dt.Columns.Add("id", typeof(string));
                dt.Columns.Add("schoolname", typeof(string));
                MessageBox.Show(dt.Rows.Count.ToString());
                SQLConn.da.Fill(dt);
                dt.Rows.Add(new Object[] { "-1", "Select School" });
                ds.Tables.Add(dt);
                if (dtbl == "school") return ds;

                dt = new DataTable();        dt = new DataTable();
                SQLConn.sqL = "select id, feetypename from feetype ";
                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);
                dt.TableName = "feetype";
                dt.Columns.Add("id", typeof(string));
                dt.Columns.Add("feetypename", typeof(string));
                SQLConn.da.Fill(dt);
                dt.Rows.Add(new Object[] { "-1", "Select Fee Type" });

                ds.Tables.Add(dt);
                if (dtbl == "feetype") return ds;






                SQLConn.ConnClose();
                return ds;

            }
          catch (Exception ex)
          {
              MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
              return null;
          }




       }


       public void LoadDepartments(ComboBox cb)
       {

           cb.DataSource = SQLConn.dsSchool.Tables["departments"];
                cb.DisplayMember = "departmentname";
                cb.ValueMember = "id";     

       }

       public void FillComboSection(ComboBox cb)
       {
           try
           {




               cb.DataSource = SQLConn.dsSchool.Tables["section"];
               cb.DisplayMember = "sectionname";
               cb.ValueMember = "id";
               SQLConn.ConnClose();

           }
           catch (Exception ex)
           {
               MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
           }
       }
       


       public void FillComboClassSection(ComboBox cb)
       {
           try
           {


               cb.DataSource = SQLConn.dsSchool.Tables["classection"];
               cb.ValueMember = "id";
               cb.DisplayMember = "classection";
           }
           catch (Exception ex)
           {
               MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
           }
     
       }


       public void FillComboClass(ComboBox cb)
       {
           try
           {


               cb.DataSource = SQLConn.dsSchool.Tables["class"];
               cb.ValueMember = "id";
               cb.DisplayMember = "classname";
           }
           catch (Exception ex)
           {
               MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
           }

       }


       public void FillComboStudentCategory(ComboBox cb)
       {
           try
           {

              
               DataTable dt = new DataTable();

               dt.Columns.Add("id", typeof(int));
               dt.Columns.Add("category", typeof(string));
               dt.Rows.Add(new Object[] { -1, "Select Category" });
               dt.Rows.Add(new Object[] { 1, "Enrolled" });
               dt.Rows.Add(new Object[] { 2, "Deffered" });
               dt.Rows.Add(new Object[] { 3, "Suspended" });
               dt.Rows.Add(new Object[] { 4, "Expelled" });
               dt.Rows.Add(new Object[] { 5, "Transferred" });
               dt.Rows.Add(new Object[] {6, "Cleared" });

                  cb.DataSource = dt;
               cb.DisplayMember = "category";
               cb.ValueMember = "id";
               SQLConn.ConnClose();

           }
           catch (Exception ex)
           {
               MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
           }
       }


       public void FillComboStatus(ComboBox cb)
       {
           try
           {

               DataTable dt = new DataTable();

               dt.Columns.Add("id", typeof(int));
               dt.Columns.Add("status", typeof(string));
               dt.Rows.Add(new Object[] { -1, "Select Status" });
               dt.Rows.Add(new Object[] { 1, "Active" });
               dt.Rows.Add(new Object[] { 0, "Inactive" });
               cb.DataSource = dt;
               cb.DisplayMember = "status";
               cb.ValueMember = "id";
               SQLConn.ConnClose();

           }
           catch (Exception ex)
           {
               MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
           }
       }



       public void FillComboTerm(ComboBox cb)
       {
             cb.DataSource=  SQLConn.dsSchool.Tables["term"];
               cb.DisplayMember = "termname";
               cb.ValueMember = "id";
             
       }

        public void FillComboSchool(ComboBox cb)
       {
           cb.DataSource=  SQLConn.dsSchool.Tables["school"];
               cb.DisplayMember = "schoolname";
               cb.ValueMember = "id";
      

           
       }


       public void ResetCombos(Form  frm)
       {
           var c = GetAll(frm, typeof(ComboBox));
           foreach (ComboBox cb in c)
           {

               cb.SelectedValue = "-1";

           }



       }


       public IEnumerable<Control> GetAll(Control control, Type type)
       {
           var controls = control.Controls.Cast<Control>();

           return controls.SelectMany(ctrl => GetAll(ctrl, type))
                                     .Concat(controls)
                                     .Where(c => c.GetType() == type);
       }

       public void FillComboExamType(ComboBox cb)
       {
           try
           {

               SQLConn.ConnOpen();

               SQLConn.sqL = "select id, examtypename from examtype ";
               SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);


               SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);

               DataTable dt = new DataTable();

               dt.Columns.Add("id", typeof(string));
               dt.Columns.Add("examtypename", typeof(string));

               dt.Rows.Add(new Object[] { -1, "Select Exam Type" });


               SQLConn.da.Fill(dt);


               cb.DataSource = dt;
               cb.DisplayMember = "examtypename";
               cb.ValueMember = "id";
               SQLConn.ConnClose();

           }
           catch (Exception ex)
           {
               MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
           }
       }

           public void FillComboFeeType(ComboBox cb)
       {


           cb.DataSource = SQLConn.dsSchool.Tables["feetype"];
               cb.DisplayMember = "feetypename";
               cb.ValueMember = "id";
               SQLConn.ConnClose();

          
       }


       private int delALL(string val, string table) {
            try
            {
            SQLConn.ConnOpen();
               SQLConn.sqL = "Select admissionno from Hostel where AdmissionNo=@SearchAdmission";
               SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
           
                SQLConn.cmd.Parameters.Add(new NpgsqlParameter("@SearchAdmission", "AdmissionNo"));
                SQLConn.cmd.Parameters["@SearchAdmission"].Value = val;
                SQLConn.dr = SQLConn.cmd.ExecuteReader();
                

                SQLConn.ConnClose();
                return 0;
             
            }
                catch (NpgsqlException ex){

                 
                    MessageBox.Show(ex.ToString());
                       return 0;
                }


            
                }


       public DataTable SearchStudent( string srch )
       {
           DataTable dt = new DataTable();
           try
           {

               SQLConn.ConnOpen();


               SQLConn.sqL = "Select  concat (firstname, ' ', othername) as fullname , admissionno from  studentdetail Where admissionno ILike  '%" + srch + "%'  or  firstname ILike  '%" + srch + "%' " ;
               SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);

               SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);
               dt.Columns.Add("admissionno", typeof(string));
               dt.Columns.Add("fullname", typeof(string));

               SQLConn.da.Fill(dt);
               SQLConn.ConnClose();
               return dt;
       

           }
           catch (Exception ex)
           {
               MessageBox.Show(ex.ToString());
               return null;
           }
           finally
           {
               SQLConn.cmd.Dispose();
               SQLConn.ConnClose();
           }


       }

       public void FillComboStaff(ComboBox cb)
       {
           try
           {
               SQLConn.ConnOpen();
              SQLConn.sqL = "select id, staffname from staff ";
               SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
               SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);
               DataTable dt = new DataTable();
               dt.Columns.Add("id", typeof(int));
               dt.Columns.Add("staffname", typeof(string));
               dt.TableName = "sclass";
               dt.Rows.Add(new Object[] { -1, "Select Staff" });
               SQLConn.da.Fill(dt);
               cb.DataSource = dt;
               cb.DisplayMember = "staffname";
               cb.ValueMember = "id";
               SQLConn.ConnClose();

           }
           catch (Exception ex)
           {
               MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
           }
       }


       public void ToCsV(DataGridView dGV, string Filename)
       {

           string filename = Filename.Replace(' ', '_'); ;
           string stOutput = "";
           // Export titles:
           string sHeaders = "";

           for (int j = 0; j < dGV.Columns.Count; j++)
            
               sHeaders = sHeaders.ToString() + Convert.ToString(dGV.Columns[j].HeaderText) + "\t";
           stOutput += sHeaders + "\r\n";
           // Export data.
           for (int i = 0; i < dGV.RowCount - 1; i++)
           {
               string stLine = "";
               for (int j = 0; j < dGV.Rows[i].Cells.Count; j++)
                   stLine = stLine.ToString() + Convert.ToString(dGV.Rows[i].Cells[j].Value) + "\t";
               stOutput += stLine + "\r\n";
           }
           Encoding utf16 = Encoding.GetEncoding(1254);
           byte[] output = utf16.GetBytes(stOutput);
           FileStream fs = new FileStream(filename, FileMode.Create);
           BinaryWriter bw = new BinaryWriter(fs);
           bw.Write(output, 0, output.Length); //write the encoded file
           bw.Flush();
           bw.Close();
           fs.Close();
           Process.Start(filename);
       }  



       public void FillComboSubject(ComboBox cb ,string sclass)
       {
           try
           {
               SQLConn.ConnOpen();
               SQLConn.sqL = "select subjectcode, subjectname from subject  ";
               if (sclass != "") SQLConn.sqL += " WHERE  classname= '" + sclass + "'";
               SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
               SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);
               DataTable dt = new DataTable();
               dt.Columns.Add("subjectcode", typeof(string));
               dt.Columns.Add("subjectname", typeof(string));
   
               dt.Rows.Add(new Object[] { "-1", "Select Subject" });
               SQLConn.da.Fill(dt);
               cb.DataSource = dt;
               cb.DisplayMember = "subjectname";
               cb.ValueMember = "subjectcode";
               SQLConn.ConnClose();

           }
           catch (Exception ex)
           {
               MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
           }
       }



       public  StringCollection  FeeTypes()
       {
         StringCollection  SC= new StringCollection ();
            try
           {
           SQLConn.ConnOpen();

                  SQLConn.sqL = "Select feetypename from  feetype ";
                   //  MessageBox.Show(SQLConn.sqL);
                 SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
             
                       SQLConn.dr = SQLConn.cmd.ExecuteReader();
                       while (SQLConn.dr.Read() == true)
                       {
                           SC.Add(SQLConn.dr["feetypename"].ToString());
                       }
                       SQLConn.ConnClose();

                       return SC;
            }
            catch (NpgsqlException ex)
           {
               MessageBox.Show(ex.Message);
               return null;

           }

           finally
           {

               SQLConn.cmd.Dispose();

           }
      }


       public   Dictionary<string, string>   StudentDetails (string admission)
       {
           Dictionary<string, string> dic = new Dictionary<string, string>();
          try {
               SQLConn.ConnOpen();
               SQLConn.sqL = "select admissionno,  to_char(admissiondate, 'DD-MM-YYYY') as admissiondate,gender,firstname,othername,dob,email,religion,nationality,county,photo,sponsor,father,mother,guardian,organization,address,phone,status,category,sclass,section,term,termname, school from studentdetail LEFT JOIN schoolterm on schoolterm.id=studentdetail.term where admissionno='" + admission + "' ";
              
               
               SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
               SQLConn.dr = SQLConn.cmd.ExecuteReader();

               if (SQLConn.dr.Read())
               {
        
                  dic.Add("admissiono", SQLConn.dr["admissionno"].ToString());
                  dic.Add("admissiondate",SQLConn.dr["admissiondate"].ToString());
                  dic.Add("gender",SQLConn.dr["gender"].ToString());
                  dic.Add( "firstname", SQLConn.dr["firstname"].ToString());
                   dic.Add("othername" ,SQLConn.dr["othername"].ToString());
                  dic.Add( "dob", SQLConn.dr["dob"].ToString());
                  dic.Add( "email", SQLConn.dr["email"].ToString());
                  dic.Add("religion",  SQLConn.dr["religion"].ToString());
                   dic.Add("nationality",SQLConn.dr["nationality"].ToString());

                  dic.Add("sponsor",  SQLConn.dr["sponsor"].ToString());
                   dic.Add("father", SQLConn.dr["father"].ToString());
                  dic.Add("mother", SQLConn.dr["mother"].ToString());
                 dic.Add("guardian", SQLConn.dr["guardian"].ToString());
                 dic.Add( "organization",SQLConn.dr["organization"].ToString());

                 dic.Add("address", SQLConn.dr["address"].ToString());
                  dic.Add("phone",SQLConn.dr["phone"].ToString());

                  dic.Add( "school", SQLConn.dr["school"].ToString());
               dic.Add("category", SQLConn.dr["category"].ToString());

                dic.Add("status", SQLConn.dr["status"].ToString());
                 dic.Add("sclass", SQLConn.dr["sclass"].ToString());
                 dic.Add("section", SQLConn.dr["section"].ToString());
                dic.Add("term", SQLConn.dr["term"].ToString());
                dic.Add("termname", SQLConn.dr["termname"].ToString());
               }


               if (SQLConn.dr != null)
               {
                   SQLConn.dr.Close();
               }
               SQLConn.ConnClose();

               return dic;
           }
           catch (NpgsqlException ex)
           {
               MessageBox.Show(ex.Message);
               return null;

           }

           finally
           {

               SQLConn.cmd.Dispose();

           }

       }




       public Dictionary<string, double> ClassTermFee(string sclass, int term)
       {
           Dictionary<string, double> dic = new Dictionary<string, double>();
           try
           {
               SQLConn.ConnOpen();
               SQLConn.sqL = "select feetype, amount from feeschedule where sclass='" + sclass + "'  AND term= "+term+" ";


               SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
               SQLConn.dr = SQLConn.cmd.ExecuteReader();

               if (SQLConn.dr.Read())
               {

                   dic.Add(SQLConn.dr["feetype"].ToString(),Convert.ToDouble( SQLConn.dr["amount"].ToString()));
                           
               }


               if (SQLConn.dr != null)
               {
                   SQLConn.dr.Close();
               }
               SQLConn.ConnClose();

               return dic;
           }
           catch (NpgsqlException ex)
           {
               MessageBox.Show(ex.Message);
               return null;

           }

           finally
           {

               SQLConn.cmd.Dispose();

           }

       }

       public void SuggestStudent(ListView lstSuggestSalesItems, string srch)
       {
           try
           {

                  SQLConn.ConnOpen();

                  SQLConn.sqL = "Select  concat (firstname, ' ', othername) as fullname , admissionno from  studentdetail Where admissionno ILike  '%" + srch + "%'  or  firstname ILike  '%" + srch + "%' ";
                   //  MessageBox.Show(SQLConn.sqL);
                 SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
             
                       SQLConn.dr = SQLConn.cmd.ExecuteReader();


                       ListViewItem x = null;
                       lstSuggestSalesItems.Items.Clear();



                       while (SQLConn.dr.Read() == true)
                       {
                           x = new ListViewItem(SQLConn.dr["admissionno"].ToString());
                           x.SubItems.Add(SQLConn.dr["fullname"].ToString());
                           lstSuggestSalesItems.Items.Add(x);
                       }

                       SQLConn.ConnClose();
           }
           catch (Exception ex)
           {
               MessageBox.Show(ex.Message);
           }
           finally
           {
               SQLConn.cmd.Dispose();
               SQLConn.ConnClose();
           }
       }
      





    }
}
