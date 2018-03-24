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

            if(!IsPostBack){

                if (Session["logged"] != null)
                {
                    if (!Session["logged"].ToString().Equals("yes"))
                    {
                        Response.Redirect("~/default_non.aspx");

                    }
                }

            }
           
        }


        protected void sd(object source, DataListCommandEventArgs e)
        {
            
        }

        protected void onclick(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
           

            Response.Redirect("productDetail.aspx?pName=" + lb.Text);
        }

        protected void sd(object sender, DataListItemEventArgs e)
        {
            
        }

       

       
    }
}