using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace digitTech
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {

                if (Session["logged"] == null)
                {
                    Response.Redirect("login1.aspx");

                }

            }

           


        }


        protected void contact_info(object sender,EventArgs e) {



            string _id = "digitaltech.apu@gmail.com";
            string _password = "digitaltech";
            string subject = "DigitalTech -> " + name.Value.ToString() + " send you a msg -Web-App Project- @2016 APU ";
            string body = "DigitalTech<br/>Name:" + name.Value.ToString() + " <br/> Email Id <b>" + email.Value.ToString() + "<br/>has sent you msg:<br/> <b>" + comments.Value.ToString() + "</b><hr/> <br/> <br/><br/>Abdulaziz Fadhi Ahmed [TP035863]<br/><br/> Khaled Mahmoud Arbab[TP037287]<br/><br/> Walid Ramadan Adam[TP037689]<br/><br/> Osamah Saeed Basaad[TP036528]<br/><br/><hr/>All Rights Reserved || DigitalTech &copy 2017 || Asia Pacific University || UC2F1605IT";
            string smtpAddress = "smtp.gmail.com";
            bool enableSSL = true;
            /*
                         Mudassar Ahmed Khan. . Send email using Gmail SMTP Mail Server in ASP.Net. [ONLINE] Available at: http://www.aspsnippets.com/Articles/Send-email-using-Gmail-SMTP-Mail-Server-in-ASPNet.aspx. [Accessed 19 November 2016].
                         */

            try
            {


                using (MailMessage mail = new MailMessage())
                {

                    mail.From = new MailAddress(_id);
                    mail.Sender = new MailAddress(_id);
                    mail.To.Add("digitaltech.apu1@gmail.com");
                    mail.Subject = subject;
                    mail.Body = body;
                    mail.IsBodyHtml = true;
                    mail.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;

                    // Can set to false, if you are sending pure text.


                    using (SmtpClient smtp = new SmtpClient(smtpAddress, 587))
                    {
                        smtp.Credentials = new System.Net.NetworkCredential(_id, _password);
                        smtp.EnableSsl = enableSSL;
                        smtp.Send(mail);
                        smtp.Timeout = 100000;//WAIT FOR100seconds, if no response, then drop it
                    }
                }







                Label2.Text = "We have received your info, will contact you soon";



            }
            catch (Exception ex)
            {
                Label2.Text = "Could not send email\n\n" + ex.ToString();
            }


        
        }




        protected void choose_info(object sender,EventArgs e) {

            /*
             CodeProject. 2012. Send Mail / Contact Form using ASP.NET and C# - CodeProject. [ONLINE] Available at: https://www.codeproject.com/Tips/371417/Send-Mail-Contact-Form-using-ASP-NET-and-Csharp. [Accessed 15 December 2016].
             */

            string _id = "digitaltech.apu@gmail.com";
            string _password = "digitaltech";
            string subject = "DigitalTech -> " + name.Value.ToString() + " send you a favorite brand -Web-App Project- @2017 APU ";
            string body = "DigitalTech<br/>Name:" + name.Value.ToString() + " <br/> Email Id <b>" + email.Value.ToString() + "<br/>has selected his/her favorite brand:<br/> <b>" + RadioButtonList1.SelectedValue.ToString() + "</b><hr/> <br/> <br/><br/>Abdulaziz Fadhi Ahmed [TP035863]<br/><br/> Khaled Mahmoud Arbab[TP037287]<br/><br/> Walid Ramadan Adam[TP037689]<br/><br/> Osamah Saeed Basaad[TP036528]<br/><br/><hr/>All Rights Reserved || DigitalTech &copy 2017 || Asia Pacific University || UC2F1605IT";
            string smtpAddress = "smtp.gmail.com";
            bool enableSSL = true;


            try
            {


                using (MailMessage mail = new MailMessage())
                {

                    mail.From = new MailAddress(_id);
                    mail.Sender = new MailAddress(_id);
                    mail.To.Add("digitaltech.apu1@gmail.com");
                    mail.Subject = subject;
                    mail.Body = body;
                    mail.IsBodyHtml = true;
                    mail.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;

                    // Can set to false, if you are sending pure text.


                    /*
                     CodeProject. 2012. Send Mail / Contact Form using ASP.NET and C# - CodeProject. [ONLINE] Available at: https://www.codeproject.com/Tips/371417/Send-Mail-Contact-Form-using-ASP-NET-and-Csharp. [Accessed 15 December 2016].
                     */

                    using (SmtpClient smtp = new SmtpClient(smtpAddress, 587))
                    {
                        smtp.Credentials = new System.Net.NetworkCredential(_id, _password);
                        smtp.EnableSsl = enableSSL;
                        smtp.Send(mail);
                        smtp.Timeout = 100000;//WAIT FOR100seconds, if no response, then drop it
                    }
                }







                Label1.Text = "We have received your favorite brand, will upload some of those brand";



            }
            catch (Exception ex)
            {
                Label1.Text = "Problems...\n\n" + ex.ToString();
            }


        }


    }
}
