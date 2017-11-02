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



namespace SchoolGuru
{   

 
    class TimeManager
    {
        public string BeforeMidNight(DateTime indate)
        {
    
            DateTime beforemidnight = new DateTime(indate.Year, indate.Month, indate.Day, 23, 59, 59);       
             return beforemidnight.ToString("yyyy-MM-dd HH:mm:ss");
        }

        public string AfterMidNight(DateTime indate)
        {

          DateTime aftermidnight= new DateTime(indate.Year, indate.Month, indate.Day, 0, 0, 0);

          return aftermidnight.ToString("yyyy-MM-dd HH:mm:ss");

        }


        public string RandomItemId()
        {

            Random rand = new Random(DateTime.Now.Millisecond);
            int r = rand.Next();


            return r.ToString();

        }


       
        public DateTime FirstDayOfMonth () {


                 DateTime first = new DateTime(System.DateTime.Now.Year, System.DateTime.Now.Month, 1);

                 return first;

        }



        public string UniqueID()
        {
            Random rand = new Random(DateTime.Now.Millisecond);
            int r = rand.Next();
            string uniqueid =  r.ToString() + DateTime.Now.Millisecond;
            return uniqueid;

        }

        public string NowToString()
        {
            string datetime = System.DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            return datetime;

        }

        public string TimeToString(DateTime dt)
        {
            string datetime = dt.ToString("yyyy-MM-dd HH:mm:ss");
            return datetime;

        }



        public string NowToAmericanString()
        {
            string datetime = System.DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");
            return datetime;

        }





    }
}
