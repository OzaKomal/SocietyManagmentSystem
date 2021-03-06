﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

namespace SocietyManagementSystem.LoginDetails
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        
        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string username = Login1.UserName;
            string pwd = Login1.Password;
            string isadmin = Login1.RememberMeSet.ToString();

            string s;
            s =  WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                
            SqlConnection con = new SqlConnection(s);
            con.Open();
            string sqlUserName;
            SqlCommand cmd;
            if (isadmin == "True")
            {
                string admin = "True";
                sqlUserName = "SELECT Username,Password,isAdmin FROM Member_details WHERE Username ='" + username + "' AND Password ='" + pwd + "' AND isAdmin='" + admin + "'";
                cmd = new SqlCommand(sqlUserName, con);
                string CurrentName;
                CurrentName = (string)cmd.ExecuteScalar();



                if (CurrentName != null)
                {
                    Session["UserAuthentication"] = username;
                    Session.Timeout = 1;
                    Response.Redirect("~/Admin/AdminHome.aspx");
                }
                else
                {
                    Session["UserAuthentication"] = "";
                }
            }

            if (isadmin == "False")
            {
                string admin = "False";
                sqlUserName = "SELECT Username,Password,isAdmin FROM Member_details WHERE Username ='" + username + "' AND Password ='" + pwd + "' AND isAdmin='" + admin + "'";
                cmd = new SqlCommand(sqlUserName, con);
                string CurrentName;
                CurrentName = (string)cmd.ExecuteScalar();



                if (CurrentName != null)
                {
                    Session["UserAuthentication"] = username;
                    Session.Timeout = 1;
                    Response.Redirect("~/User/MemberHome.aspx");
                }
                else
                {
                    Session["UserAuthentication"] = "";
                }
            }
                
            
                
            
            
            
        }

            
    }
       
}
    
