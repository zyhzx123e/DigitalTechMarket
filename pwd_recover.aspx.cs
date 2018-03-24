using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


//using System.Web.Mail;
//add EASendMail namespace//add EASendMail namespace
using System.Net.Mail;//send email
namespace digitTech
{
    public partial class Password_recover : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            string email = TextBox1.Text;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["shopingConnectionString1"].ConnectionString);
            string command = "select UserId,Pwd,Email from userDB ";
            SqlCommand sqlcmd = new SqlCommand(command, con);
          



            con.Open();
            if (con.State == ConnectionState.Open)
            {
                SqlDataReader dtr = sqlcmd.ExecuteReader();
                
                while (dtr.Read())
                {

  if (dtr[2].ToString().Equals(TextBox1.Text))
                    {

                    //*******************************

                        /*
                         Mudassar Ahmed Khan. . Send email using Gmail SMTP Mail Server in ASP.Net. [ONLINE] Available at: http://www.aspsnippets.com/Articles/Send-email-using-Gmail-SMTP-Mail-Server-in-ASPNet.aspx. [Accessed 19 November 2016].
                         */
                        string _id = "digitaltech.apu@gmail.com";
                        string _password = "digitaltech";
                    string subject = "DigitalTech -> Your userId and Password -Web-App Project- @2016 APU ";
                    string body = "DigitalTech<br/> UserId : <b>" + dtr[0].ToString() + "</b><br/>" + "Password : <b>" + dtr[1].ToString() + "</b><hr/> <br/> Now you can use the credential above to log in to DigitalTech<br/><hr/> <br/><DigitalTech>  Project Group Mates:<br/><br/>Abdulaziz Fadhi Ahmed [TP035863]<br/><br/> Khaled Mahmoud Arbab[TP037287]<br/><br/> Walid Ramadan Adam[TP037689]<br/><br/> Osamah Saeed Basaad[TP036528]<br/><br/><hr/>All Rights Reserved || DigitalTech &copy 2017 || Asia Pacific University || UC2F1605IT";
                    string smtpAddress = "smtp.gmail.com";
                    bool enableSSL = true;
      
      
                     try
                    {


                        using (MailMessage mail = new MailMessage())
                        {
                        
                            mail.From = new MailAddress(_id);
                            mail.Sender = new MailAddress(_id);
                            mail.To.Add(dtr[2].ToString());
                            mail.Subject = subject;
                            mail.Body = body;
                            mail.IsBodyHtml = true;
                            mail.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
                   
                            // Can set to false, if you are sending pure text.

                            /*
                           Mudassar Ahmed Khan. . Send email using Gmail SMTP Mail Server in ASP.Net. [ONLINE] Available at: http://www.aspsnippets.com/Articles/Send-email-using-Gmail-SMTP-Mail-Server-in-ASPNet.aspx. [Accessed 19 November 2016].
                           */
                            using (SmtpClient smtp = new SmtpClient(smtpAddress, 587))
                            {
                                smtp.Credentials =  new System.Net.NetworkCredential(_id, _password);
                                smtp.EnableSsl = enableSSL;
                                smtp.Send(mail);
                                smtp.Timeout = 100000;//WAIT FOR100seconds, if no response, then drop it
                            }
                        }





                        
                         
                         Label1.Text = "Email Sent,check your mailbox for user iD and Password";
                  
                     
                     
                     }
                    catch (Exception ex)
                    {
                         Label1.Text="Could not send email\n\n" + ex.ToString();
                    }


                  
                     break;
                    }
                    else
                    {
                        Label1.Text = "Email Id not valid";
                    }
                   
                }



            }





        }//BTN Function finish



    }
}