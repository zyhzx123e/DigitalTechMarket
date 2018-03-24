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

        
        protected void Page_Load(object sender, DataListItemEventArgs e)
        {
            //

            if (System.Web.HttpContext.Current.Session["logged"] != "yes" || System.Web.HttpContext.Current.User.Identity.IsAuthenticated == false)
            {

                ImageButton pay_lbl = (ImageButton)e.Item.FindControl("ImageButton1");
                pay_lbl.Visible = false;
                Response.Redirect("~/login1.aspx");

            }
            if (!IsPostBack)
            {



            }

        }
        protected void use(object sender, DataListItemEventArgs e)
        {
            if (System.Web.HttpContext.Current.Session["logged"] != "yes" || System.Web.HttpContext.Current.User.Identity.IsAuthenticated == false)
            {

                ImageButton pay_label = (ImageButton)e.Item.FindControl("ImageButton1");
                pay_label.Visible = false;

                Response.Redirect("~/login1.aspx");
            }
            /*
             DataListItemEventArgs Class (System.Web.UI.WebControls). . DataListItemEventArgs Class (System.Web.UI.WebControls). [ONLINE] Available at: https://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.datalistitemeventargs(v=vs.110).aspx. [Accessed 14 November 2016].
             */
            Label prd = (Label)e.Item.FindControl("productNameLabel");
            ViewState["poductName"] = prd.Text;
            Label brd = (Label)e.Item.FindControl("brandLabel");
            ViewState["brand"] = brd.Text;
            Image img = (Image)e.Item.FindControl("Image1");
            ViewState["image"] = img.ImageUrl.ToString();
            Label prc = (Label)e.Item.FindControl("priceLabel");
            ViewState["price"] = prc.Text;

            /*
             
             What is View State and How it Works in ASP.Net. . What is View State and How it Works in ASP.Net. [ONLINE] Available at: http://www.c-sharpcorner.com/UploadFile/225740/what-is-view-state-and-how-it-works-in-Asp-Net53/. [Accessed 14 November 2016].
             */

            /* Label img = (Label)e.Item.FindControl("Image1");
             Label1.Text += img.Text;
                
         */
            
        }



       

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {


            if (System.Web.HttpContext.Current.Session["logged"] != "yes" || System.Web.HttpContext.Current.User.Identity.IsAuthenticated == false)
            {
                Response.Redirect("~/login1.aspx");
            }
            else
            {
                if (TextBox1.Text == "")
                {

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter the number of quantity of this product!')", true);
                }
                else
                {

                    int i = int.Parse(TextBox1.Text);

                    int p = int.Parse((string)ViewState["price"]);
                    string img = ViewState["image"].ToString();
                    string brand = ViewState["brand"].ToString();
                    string s2 = System.Web.HttpContext.Current.User.Identity.Name;
                    string s1 = Request.QueryString["pName"];




                    SqlConnection a = new SqlConnection(ConfigurationManager.ConnectionStrings["shopingConnectionString1"].ConnectionString);

                    a.Open();
                    string cartCmd = "insert into shoppingCart(pName,quantity,uName,brand,img,price) values('" + s1 + "','" + i + "','" + s2 + "','" + brand + "','" + img + "','" + p + "') ";
                    SqlCommand cmd = new SqlCommand(cartCmd, a);
                    cmd.ExecuteNonQuery();
                    a.Close();

                    Response.Redirect("cart.aspx?user=" + s2);
                }
            }
        }

        

    }
}