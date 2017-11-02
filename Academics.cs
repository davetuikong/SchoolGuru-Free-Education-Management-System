using System;
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
   public  partial class Academics
    {



       public  DataTable GetClassSubjects(string schoolclass)
       {


         try
            {
                SQLConn.sqL = "SELECT  subjectcode, subjectname from subject Where classname='"+schoolclass+"'";

                SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
                SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);
                DataTable dt = new DataTable();

                dt.Columns.Add("subjectcode", typeof(string));
                dt.Columns.Add("subjectname", typeof(string));
                dt.Rows.Add(new Object[] { "-1", "Select Subject" });
                SQLConn.da.Fill(dt);
                return dt;  
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return null;
            }
            finally
            {
                SQLConn.ConnClose();
                SQLConn.cmd.Dispose();
            }
        }




       public DataTable GetExams(int schoolclass, int schoolterm)
       {
           try
           {
               SQLConn.sqL = "SELECT  id, examname, startdate, enddate  from exam Where 1=1  ";

               if (schoolclass >0) SQLConn.sqL += "  AND schoolclass=  '" + schoolclass + "'   ";

             if(schoolterm>0)     SQLConn.sqL += "  AND schoolterm= '" + schoolterm+ "'";


      
               SQLConn.cmd = new NpgsqlCommand(SQLConn.sqL, SQLConn.conn);
               SQLConn.da = new NpgsqlDataAdapter(SQLConn.cmd);
               DataTable dt = new DataTable();

               dt.Columns.Add("id", typeof(int));
               dt.Columns.Add("examname", typeof(string));
               dt.Columns.Add("startdate", typeof(string));
               dt.Columns.Add("enddate", typeof(string));
               SQLConn.da.Fill(dt);
               return dt;

           }
           catch (Exception ex)
           {
               MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
               return null;
           }
           finally
           {


               SQLConn.ConnClose();
               SQLConn.cmd.Dispose();
           }
       }




    }
}
