using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace digitTech
{
    public partial class other :  System.Web.UI.Page
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
    }
}
