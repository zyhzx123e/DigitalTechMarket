using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace digitTech
{
    public partial class Account : System.Web.UI.Page
    { 
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["shopingConnectionString1"].ConnectionString);

                if (Session["session_user_id"] != null)
                {

                    /*
                     c# -difference between a Session and a Cookie - Stack Overflow. 2014. c# - What is the difference between a Session and a Cookie? - Stack Overflow. [ONLINE] Available at: http://stackoverflow.com/questions/623815/what-is-the-difference-between-a-session-and-a-cookie.
                     * [Accessed 11 November 2016].
                     */
                    string usr = Session["session_user_id"].ToString();// can use cookies to achieve same function: -> Request.Cookies["uname"].Value;
                    string cmd = "select * from userDB ";
                    con.Open();
                    SqlCommand command = new SqlCommand(cmd, con);

                    if (con.State == ConnectionState.Open)
                    {
                        SqlDataReader dtr = command.ExecuteReader();
                        while (dtr.Read())
                        {
                            if (dtr[2].ToString().Equals(usr))
                            {
                                //automatically display the user info to the page
                                //user could then edit their own info
                                TextBox1.Text = dtr["FirstName"].ToString();
                                TextBox2.Text = dtr["LastName"].ToString();
                                TextBox7.Text = dtr["UserId"].ToString();
                                TextBox4.Text = dtr["Pwd"].ToString();
                                TextBox5.Text = dtr["Adress"].ToString();
                                TextBox6.Text = dtr["Mob"].ToString();
                                TextBox3.Text = dtr["Mob"].ToString();

                            }//1,2,3,7,4,5,6
                            else continue;
                        }
                    }
                    con.Close();
                }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["shopingConnectionString1"].ConnectionString);
            
            string id = Session["session_user_id"].ToString();
            string usr = Request.Cookies["uname"].Value;
            msg.Text = usr;

 con1.Open();
            string cmd = "update userDB set FirstName='" + TextBox1.Text.Trim() + "',LastName='" + TextBox2.Text.Trim() + "',Email='" + TextBox3.Text.Trim() + "',UserId='" + TextBox7.Text.Trim() + "',Pwd='" + TextBox4.Text.Trim() + "',Adress='" + TextBox5.Text.Trim() + "',Mob=" + TextBox6.Text.Trim() + " where UserId='" + usr + "' ";
            SqlCommand command1 = new SqlCommand();
            command1.Connection = con1;
            command1.CommandText = cmd;
            command1.ExecuteNonQuery();
           
            if (command1.ExecuteNonQuery()>0)
            {
          
                msg.Text = "8888  Congratulations! " + TextBox1.Text + " " + TextBox2.Text + ", Your info have been updated!";
            }
              
            con1.Close();


        }

       
        
    }
}