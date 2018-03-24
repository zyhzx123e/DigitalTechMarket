using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace digitTech
{
    public partial class ManageUser : System.Web.UI.Page
    {


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["shopingConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        
//
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                // Declare the query string.
                String queryString =
                  "SELECT TOP 1000 [FirstName],[LastName],[UserId],[Pwd],[Adress],[Mob],[Email] From [userDB]";

                // Run the query and bind the resulting DataSet
                // to the GridView control.
                DataSet ds = GetData(queryString);
                if (ds.Tables.Count > 0)
                {
                    gridview_users.DataSource = ds;
                    gridview_users.DataBind();
                }
                else
                {
                    msg.Text = "Unable to connect to the database.";
                }

            } 
        }


        DataSet GetData(String queryString)
        {
            //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["shopingConnectionString1"].ConnectionString);


            // Retrieve the connection string stored in the Web.config file.
            String connectionString = ConfigurationManager.ConnectionStrings["shopingConnectionString1"].ConnectionString;

            DataSet ds = new DataSet();

            try
            {
                // Connect to the database and run the query.
                SqlConnection connection = new SqlConnection(connectionString);
                SqlDataAdapter adapter = new SqlDataAdapter(queryString, connection);

                // Fill the DataSet.
                adapter.Fill(ds);

            }
            catch (Exception ex)
            {

                // The connection failed. Display an error message.
                msg.Text = "Unable to connect to the database.";

            }

            return ds;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string query = "Update userDB set FirstName='" + first_name.Text.Trim() + "',LastName='" + last_name.Text.Trim() + "',UserId='" + ddlSubjects.Text.Trim() + "',Pwd='" + Password.Text.Trim() + "',Adress='" + address.Text.Trim() + "',Mob='" + contactNumber.Text.Trim() + "',Email='" + privateEmail.Text.Trim() + "' where UserId='" + ddlSubjects.Text.Trim()+ "' ";

            con.Open();
            cmd.Connection = con;
            cmd.CommandText = query;
            cmd.ExecuteNonQuery();

            if (cmd.ExecuteNonQuery() > 0)
            {
                msg.Text = "Updated Successfully.";


            } con.Close();






        }


    }
}