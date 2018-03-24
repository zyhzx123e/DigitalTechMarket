using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Data.SqlClient;

namespace digitTech
{
    public partial class _default_non : System.Web.UI.Page
    {

      

        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.User = null;
            System.Web.Security.FormsAuthentication.SignOut();
            //ImageButton ib = (ImageButton)Page.Master.FindControl("ImageButton2");
         


        }


        protected void sd(object source, DataListCommandEventArgs e)
        {
            
        }

        protected void onclick(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
           

            Response.Redirect("productDetail_non.aspx?pName=" + lb.Text);
        }

        protected void sd(object sender, DataListItemEventArgs e)
        {
            
        }

       

       
    }
}