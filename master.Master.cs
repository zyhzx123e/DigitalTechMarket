using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Timers;
using System.Web.Security;




namespace digitTech
{
    public partial class master : System.Web.UI.MasterPage
    {
         SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["shopingConnectionString1"].ConnectionString);
        
        public Literal user_li { get; set; }
        public string place_user { get; set; }
        public string application { get; set; }
        public string users_online { get; set; }

       // public PlaceHolder PlaceHolder_user { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Page.User.Identity.IsAuthenticated
                //System.Web.HttpContext.Current.User.Identity.IsAuthenticated
                if (Session["logged"]=="yes")
                {
                    lb_placeholder.Visible = true;
                    cart_item_qty.Visible = true;
                    ImageButton1.Visible = false;
                    PlaceHolder_user.Visible = true;
                    if (Request.Cookies["role"].Value == "admin")
                    {
                        ImageButton6.Visible = false;
                        ImageButton5.Visible = false;
                        ImageButton4.Visible = false;
                        ImageButton2.Visible = true;
                        ImageButton3.Visible = true;


                    

                    }
                    else if (Request.Cookies["role"].Value == "supplier")
                    {
                        lb_placeholder.Visible = false;
                        cart_item_qty.Visible = false;
                        ImageButton6.Visible = true;
                        ImageButton5.Visible = false;
                        ImageButton4.Visible = false;
                        ImageButton2.Visible = false;
                        ImageButton3.Visible = false;


                        PlaceHolder_user.Visible = true;

                        

                    }
                    else if (Request.Cookies["role"].Value == "manager")
                    {
                        ImageButton5.Visible = true;//inventory
                        ImageButton4.Visible = true;//user manage
                        ImageButton2.Visible = false;
                        ImageButton3.Visible = false;

                        ImageButton6.Visible = true;

                        PlaceHolder_user.Visible = true;

                      



                    }
                    else
                    {
                        LoginStatus1.Visible = true;
                        ImageButton2.Visible = false;
                        ImageButton3.Visible = false;
                        ImageButton4.Visible = false;
                        ImageButton5.Visible = false;
                        ImageButton6.Visible = false;

                        PlaceHolder_user.Visible = true;
                        //**

                   




                    }



                }
                else
                {
                    
                    LoginStatus1.Visible = true;
                    ImageButton1.Visible = true;
                    ImageButton2.Visible = false;
                    ImageButton3.Visible = false;
                    ImageButton4.Visible = false;
                    ImageButton5.Visible = false;
                    ImageButton6.Visible = false;
                    Menu2.Visible = false;
                    PlaceHolder_user.Visible = false;

                    lb_placeholder.Visible = false;
                    cart_item_qty.Visible = false;

                }






            }



        }

       


        protected void item_in_cart(object sender, EventArgs e)
        {
            con.Open();
            string q1 = "SELECT count(quantity) as total from shoppingCart where uName='" + Session["session_user_id"].ToString() + "'";
        SqlCommand cmd2 = new SqlCommand(q1, con);

        SqlDataReader reader1 = cmd2.ExecuteReader();
        string item_qty_in_cart;

        if(reader1.Read())
        {
            item_qty_in_cart = reader1["total"].ToString();

            Session["item_in_the_cart"] = item_qty_in_cart;

                string first_name = Session["u_1st_name"].ToString();
                string second_name = Session["u_2nd_name"].ToString();
                string full_name = first_name + " " + second_name;
                //*******************


                //***********
            
                Literal lb = new Literal();
                Literal cart_item = new Literal();

                lb.Text = "Welcome <a style='color:yellow;' href='/Account.aspx'> <span>" + full_name + "</span></a>  ";
                cart_item.Text = " <h5 style='color:blue;' > -> You have <a href='cart.aspx'  style='color:red;'> <span>" + item_qty_in_cart+ "</span> items</a> in the your shopping cart </h5>";


                lb_placeholder.Controls.Add(lb);
                cart_item_qty.Controls.Add(cart_item);

             }
        con.Close();
               
        }

        
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void home_link_click(object sender, EventArgs e)
        {

            if (System.Web.HttpContext.Current.Session["logged"] == "yes")
            {
                //logged in
                Response.Redirect("~/default.aspx");
            }
            else { 
            //logged out
                Response.Redirect("~/default_non.aspx");
            }


        }

        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.User = null;
            System.Web.Security.FormsAuthentication.SignOut();
            System.Web.HttpContext.Current.Session["logged"] = "no";

            LoginStatus1.Visible = true;
            ImageButton2.Visible = false;
            ImageButton3.Visible = false;
            ImageButton4.Visible = false;
            ImageButton5.Visible = false;
            ImageButton6.Visible = false;
            lb_placeholder.Visible = false;
            cart_item_qty.Visible = false;

            PlaceHolder_user.Visible = true;
        }





      



}
}