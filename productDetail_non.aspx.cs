using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace digitTech
{
    public partial class productDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
//
            
        }

        /*
            DataListItemEventArgs Class (System.Web.UI.WebControls). . DataListItemEventArgs Class (System.Web.UI.WebControls). [ONLINE] Available at: https://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.datalistitemeventargs(v=vs.110).aspx. [Accessed 14 November 2016].
            */
        protected void use(object sender, DataListItemEventArgs e)
        {


            /*
             
            What is View State and How it Works in ASP.Net. . What is View State and How it Works in ASP.Net. [ONLINE] Available at: http://www.c-sharpcorner.com/UploadFile/225740/what-is-view-state-and-how-it-works-in-Asp-Net53/. [Accessed 14 November 2016].
            */
            Label prd = (Label)e.Item.FindControl("productNameLabel");
            ViewState["poductName"] = prd.Text;
            Label brd = (Label)e.Item.FindControl("brandLabel");
            ViewState["brand"] = brd.Text;
            Image img = (Image)e.Item.FindControl("Image1");
            ViewState["image"] = img.ImageUrl.ToString();
            Label prc = (Label)e.Item.FindControl("priceLabel");
            ViewState["price"] = prc.Text;
        
            
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("login1.aspx");

        }

        

    }
}