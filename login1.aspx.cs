using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;


namespace digitTech
{
    public partial class login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            int flag = 0;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["shopingConnectionString1"].ConnectionString);
            string s = "select * from login";
            SqlCommand com = new SqlCommand(s, con);
  string query = "SELECT FirstName, LastName, Adress, Mob, Email FROM userDB where UserId='" + TextBox1.Text+"'";
   SqlCommand cmd1 = new SqlCommand(query, con);

            con.Open();

            if (con.State == ConnectionState.Open)
            {


        SqlDataReader reader = cmd1.ExecuteReader();

       SqlDataReader dtr= com.ExecuteReader();
                while (dtr.Read())
                {


                    if (dtr[0].ToString().Equals(TextBox1.Text) && dtr[1].ToString().Equals(TextBox2.Text))
                    {


                      

        while (reader.Read())
        {
            System.Web.HttpContext.Current.Session["u_1st_name"] = reader["FirstName"];
            System.Web.HttpContext.Current.Session["u_2nd_name"] = reader["LastName"];
            System.Web.HttpContext.Current.Session["address"] = reader["Adress"];
            System.Web.HttpContext.Current.Session["mobile"] = reader["Mob"];
            System.Web.HttpContext.Current.Session["email"] = reader["Email"];
            System.Web.HttpContext.Current.Session["logged"] = "yes";//log in checker
        }/*
          * 
          * asp.net - Use session variable in asp using c# - Stack Overflow. . asp.net - how to use session variable in asp using c# - Stack Overflow. [ONLINE] Available at: http://stackoverflow.com/questions/5282677/how-to-use-session-variable-in-asp-using-c-sharp. [Accessed 13 November 2016].
          * 
          * 
          * 
          * 
          */
        string q1 = "SELECT count(quantity) as total from shoppingCart where uName='" + TextBox1.Text + "'";
        SqlCommand cmd2 = new SqlCommand(q1, con);

        SqlDataReader reader1 = cmd2.ExecuteReader();

        while (reader1.Read())
        {


            System.Web.HttpContext.Current.Session["item_qty_in_cart"] = reader1["total"];


        }



       
        Session["session_user_id"] = TextBox1.Text;
        Session["session_user_role"] = dtr[2].ToString();

        /*
         ASP.NET Cookies Overview. 2016. ASP.NET Cookies Overview. [ONLINE] Available at: https://msdn.microsoft.com/en-us/library/ms178194.aspx. [Accessed 03 December 2016].
Add to My References
         */
        Response.Cookies["uname"].Value = TextBox1.Text;
                       
                        Response.Cookies["pwd"].Value = TextBox2.Text;
                        Response.Cookies["role"].Value = dtr[2].ToString();
                        FormsAuthentication.RedirectFromLoginPage(TextBox1.Text, false);
                        Response.Redirect("~/default.aspx"); 
                    }
                    else
                    {
                        Label1.Text = "your credential is incorrect";
                    }
                   

                }
            }
        }

      


    }
}