using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace digitTech
{

    public partial class AdminEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {   string s =@"~\img\product\"+FileUpload1.FileName;
            FileUpload1.PostedFile.SaveAs(Server.MapPath(s));
            SqlConnection a=new SqlConnection(ConfigurationManager.ConnectionStrings["shopingConnectionString1"].ConnectionString);
            String cmd = "insert into product(productName,brand,image,catagory,price,desciption,rating,comments) values('"+nameText.Text+"','"+brandText.Text+"','"+s+"','"+catText.Text+"','"+priceText.Text+"','"+description.Text.Trim()+"','"+rating.Text.Trim()+"','"+comments.Text.Trim()+"')";

			
			
			/*
			
			 string imgName = fluPicture.FileName;  
         string imgPath = "images/" + imgName;
         int imgSize = fluPicture.PostedFile.ContentLength;
         if (fluPicture.PostedFile != null && fluPicture.PostedFile.FileName != "") 
         {            
                
            fluPicture.SaveAs(Server.MapPath(imgPath));  
            imgPicture.ImageUrl = "~/" + imgPath;  
         }  
			
			
			
			
			*/
            /*
            upload a file and save in server folder | The ASP.NET Forums. [ONLINE] Available at: https://forums.asp.net/t/1840106.aspx?how+to+upload+a+file+and+save+in+server+folder. [Accessed 13 November 2016].
             */
            SqlCommand b = new SqlCommand(cmd, a);
          /*  b.Parameters.Add("@pn",nameText.Text);
            b.Parameters.Add("@br",brandText.Text);
            b.Parameters.Add("@img",s);
            b.Parameters.Add("@cat","lappy");
            b.Parameters.Add("@pr",priceText.Text);
            */
            a.Open();
            b.ExecuteNonQuery();
            a.Close();
            msg.Text = "You have just added one product named" + nameText.Text + "";

        } 
    }
}