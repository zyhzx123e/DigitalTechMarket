using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace digitTech
{
    public partial class mobile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
//
        }
        protected string url(int i)
        {
            

            return "productDetail_non.aspx?pName="+i;
        }
    }
}