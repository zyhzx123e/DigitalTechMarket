using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace digitTech
{
    public partial class cart : System.Web.UI.Page
    {
        string url;
        decimal cartTotal = 0;
        string cart_all = "";
        protected void Page_Load(object sender, EventArgs e)
        {
           
            cartTotal = 0;

            if (!IsPostBack)
            {

                if (Session["logged"] == null)
                {
                    Response.Redirect("login1.aspx");

                }

            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                /*
                 RowDatabound event tips and tricks in Gridview control article and examples. . 2016. RowDatabound event tips and tricks in Gridview control article and examples. . [ONLINE] Available at: http://www.dotnetgallery.com/kb/resource17-RowDatabound-event-tips-and-tricks-in-Gridview-control.aspx.aspx. [Accessed 14 November 2016].
                 */
                decimal rowTotal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "price")) * Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "quantity"));
                cartTotal = cartTotal + rowTotal;

                string item_row = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "pName"))  + "x" + Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "quantity"));
                cart_all = cart_all +"-+-"+ item_row;
            }
            Response.Cookies["price"].Value = cartTotal.ToString();

            TextBox2.Text = cartTotal.ToString();

            HyperLink88.ImageUrl = "~/img/str/buttons/checkout.jpg";
            /*
             YouTube. . How to integrate Paypal into ASP.Net - YouTube. [ONLINE] Available at: https://www.youtube.com/watch?v=xYuMXF_T5NY. [Accessed 11 November 2016].
             */
            HyperLink88.NavigateUrl = "https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=digitaltech.apu@gmail.com&" + "&item_name=DigitalTech -> Your Total of Cart&item_number=709-" + cart_all + "&amount=" + cartTotal;
        }/*
         GitHub. . grails-paypal-plugin/PaypalControllerTests.groovy at master · mstine/grails-paypal-plugin · GitHub. [ONLINE] Available at: https://github.com/mstine/grails-paypal-plugin/blob/master/test/integration/org/grails/paypal/PaypalControllerTests.groovy. [Accessed 05 December 2016].
          * */

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            Response.Redirect("cart.aspx");
        }

    }
}