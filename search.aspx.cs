using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace digitTech
{
    public partial class search : System.Web.UI.Page
    {


     

        protected void Page_Load(object sender, EventArgs e)
        {


        }
        protected void btn_search_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/search.aspx?pName=" + txt_product.Text.Trim() + "&catagory=" + txt_product.Text.Trim() + "&brand=" + txt_product.Text.Trim() + "&desciption=" + txt_product.Text.Trim() + "");
        }
}
}