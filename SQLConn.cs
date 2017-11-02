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


    static class SQLConn
    {
        //    public String DBcon = "Data Source=DESKTOP-A18UBRB;Initial Catalog=ERP;Integrated Security=True";
        public static string USERNAME;
        public static string USERTYPE;
        public static string USERID;
        public static DataSet dsSchool;
        public static NpgsqlDataAdapter da;
        public static NpgsqlDataReader dr;
        public static NpgsqlConnection conn;
        public static NpgsqlCommand cmd = null;
        public static string sqL;
        public static string DBcon;
        public static string AppName = Application.ProductName;
        public static string server = Interaction.GetSetting(SQLConn.AppName, "DBSection", "server");
        public static string port = Interaction.GetSetting(SQLConn.AppName, "DBSection", "port");
       public static  string   username = Interaction.GetSetting(SQLConn.AppName, "DBSection", "username");
        public static string   password = Interaction.GetSetting(SQLConn.AppName, "DBSection", "password");
        public static string  database = Interaction.GetSetting(SQLConn.AppName, "DBSection", "database");
                
          public static void ConnOpen()
        {

            DBcon = String.Format("Server={0};Port={1}; User Id={2};Password={3};Database={4};", server, port, username, password, database);

         
              conn = new NpgsqlConnection(DBcon);
  
            conn.Open();
             
        }

        public static void ConnClose()
        {

            conn = new NpgsqlConnection(DBcon);
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
        }

        public static  bool IsServerConnected()
        {

      
          if (string.IsNullOrEmpty(server)) return false;
        DBcon= String.Format("Server={0};Port={1}; User Id={2};Password={3};Database={4};", server, port, username, password, database);


            try
            {


   
            using (conn = new NpgsqlConnection(DBcon))
            {
                
                    conn.Open();
                    int r = 0;
          
                     SQLConn.cmd= SQLConn.conn.CreateCommand();
               SQLConn.cmd.CommandText = "SELECT *  FROM user_registration";
             
             SQLConn.dr= SQLConn.cmd.ExecuteReader();
              int rows = 0;

              if (SQLConn.dr.HasRows)
                  while (SQLConn.dr.Read())
                      rows++;

    
              if (rows > 0)   return true;
              else     return false;        
            }
                }
                catch (NpgsqlException)
                {
                    return false;
                }
            
        }



    }

 



    }
     







