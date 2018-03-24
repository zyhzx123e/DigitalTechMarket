using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using System.Threading;
using System.Data;


namespace digitTech
{
    public partial class Register : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

            if (Page.IsValid)
            {
                string Email, UserId;
                Email = TextBox3.Text;
                UserId = TextBox7.Text;
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["shopingConnectionString1"].ConnectionString);
                  con.Open();
                  string valCmd = "select UserId,Email from userDB where UserId='" + TextBox7.Text.Trim() + "' or Email='" + TextBox3.Text.Trim() + "' ";
                SqlCommand CMD = new SqlCommand(valCmd, con);
                //validation
                if (CMD.ExecuteScalar() == null)
                {
                    string cmd = "insert into userDB values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox7.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox3.Text + "') ";
                    SqlCommand Cmd = new SqlCommand(cmd, con);

                    Cmd.ExecuteNonQuery();


                   SqlCommand Cmd11 = new SqlCommand();
                   Cmd11.Connection = con;
                    Cmd11.CommandText = "insert into login values('" + TextBox7.Text + "','" + TextBox4.Text + "','user')";
 

                    Cmd11.ExecuteNonQuery();

                    Response.Cookies["uname"].Value = TextBox7.Text;
                    Response.Cookies["pwd"].Value = TextBox4.Text;
                    Response.Cookies["role"].Value = "user";
                  
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox ", "alert('Congrats " + Response.Cookies["uname"].Value + " You have successfully registered as DigitalTech member, now you can start to purchase your favorite digital devices')", true);

                    msg.Text = "Congrats " + Response.Cookies["uname"].Value + " You have successfully registered as DigitalTech member, now you can start to purchase your favorite digital devices";
              
                    Thread.Sleep(3000);

 Response.Redirect("~/login1.aspx");
                con.Close();

                }
                else
                {
                    msg.Text = "Sorry, The UserId or Email has already been registered! Please use another one!";
                }
               




            }


        }

      
      


       
        
    
    }
}