using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

using Microsoft.Reporting.WebForms;
using Microsoft.Reporting.Common;
using Microsoft.Reporting;


public partial class user_manager : System.Web.UI.Page
{
  // public DataGrid gridview_user{get; set;}
    public string html_table{get;set;}

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["shopingConnectionString1"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
      // public DataGrid gridview_users{get; set;}
      
      

            // Declare the query string.
            String queryString =
              "SELECT TOP 1000 [FirstName],[LastName],[UserId],[Pwd],[Adress],[Mob],[Email] From [userDB]";
        
            // Run the query and bind the resulting DataSet
            // to the GridView control.
            DataSet ds = Get_Data(queryString);
            DataTable dt = new DataTable();
            if (ds.Tables.Count > 0)
            {
              //  gridview_users.DataSource = ds;
               // gridview_users.DataBind();


                dt = ds.Tables[0];
            }
            else
            {
                msg.Text = "Unable to connect to the database.";
            }



            html_table = ConvertDataTableToHTML(dt);


            if (!IsPostBack)
            {
                BindCustomerDropDown();
            }


        
    }


    private void BindCustomerDropDown()
    {
        ddlUsers.DataSource = GetData("SELECT * from userDB");
        ddlUsers.DataTextField = "UserId";
        ddlUsers.DataValueField = "UserId";
        ddlUsers.DataBind();
    }

    private DataTable GetData(string query)
    {
        string conString = ConfigurationManager.ConnectionStrings["shopingConnectionString1"].ConnectionString;
        SqlCommand cmd = new SqlCommand(query);
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;

                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    return dt;
                }
            }
        }
    }
    

  

    //*****************



    public static string ConvertDataTableToHTML(DataTable dt)
    {

        /*
      c# - Datatable to html Table - Stack Overflow. . c# - Datatable to html Table - Stack Overflow. [ONLINE] Available at: http://stackoverflow.com/questions/19682996/datatable-to-html-table. [Accessed 15 November 2016].
      */
        string html = "<table class='table table-inverse'>";
        //add header row
        html += "<tr>";
        for (int i = 0; i < dt.Columns.Count; i++)
            html += "<td>" + dt.Columns[i].ColumnName + "</td>";
        html += "</tr>";
        //add rows
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            html += "<tr>";
            for (int j = 0; j < dt.Columns.Count; j++)
                html += "<td>" + dt.Rows[i][j].ToString() + "</td>";
            html += "</tr>";
        }
        html += "</table>";
        return html;
    }


    DataSet Get_Data(String queryString)
    {
       
      
        DataSet ds = new DataSet();
        
        try
        {
            // Connect to the database and run the query.
            //SqlConnection connection = new SqlConnection("Data Source=JASON-ESCOBAR;Initial Catalog=shop;Integrated Security=True;Pooling=False;MultipleActiveResultSets=True");

            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["shopingConnectionString1"].ConnectionString);


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
    protected void Button_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["shopingConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        string query = "Update userDB set FirstName='" + first_name.Text.Trim() + "',LastName='" + last_name.Text.Trim() + "',UserId='" + ddlSubjects.Text.Trim() + "',Pwd='" + Password.Text.Trim() + "',Adress='" + address.Text.Trim() + "',Mob='" + contactNumber.Text.Trim() + "',Email='" + privateEmail.Text.Trim() + "' where UserId='" + ddlSubjects.Text.Trim() + "' ";

        con.Open();
        cmd.Connection = con;
        cmd.CommandText = query;
        cmd.ExecuteNonQuery();

        if (cmd.ExecuteNonQuery() > 0)
        {
            msg.Text = "Updated Successfully.";


        } con.Close();
    }

    protected void btnReport_Click(object sender, EventArgs e)
    {

        //**********************
        reportViewer1.ProcessingMode = ProcessingMode.Local;
        reportViewer1.LocalReport.ReportPath = Server.MapPath("~/Report.rdlc");

        MyDigitalDevicesDataSet digitalTechDataSet = new MyDigitalDevicesDataSet();
        String s = "SELECT [id],[uName],[pName],[brand],[img],[quantity],[price],userDB.FirstName,userDB.LastName,userDB.Mob,userDB.Adress,userDB.Email FROM [shoppingCart] inner join userDB on userDB.UserId=shoppingCart.uName where uName='" + ddlUsers.Text.Trim() + "';";
        SqlDataAdapter da = new SqlDataAdapter(s, con);
        DataTable dt = new DataTable();

        da.Fill(digitalTechDataSet, digitalTechDataSet.Tables[0].TableName);

        dt = digitalTechDataSet.Tables[0];
        //YouTube. 2016. crystal report,how to create crystal report in C# net using Dataset,visual studio - YouTube. [ONLINE] Available at: https://www.youtube.com/watch?v=uRICO1sZ3Hc. [Accessed 29 Dec 2016].
        ReportDataSource ReportDataSource = new ReportDataSource("shoppingCart", digitalTechDataSet.Tables[0]);
        this.reportViewer1.LocalReport.DataSources.Clear();
        this.reportViewer1.LocalReport.DataSources.Add(ReportDataSource);
        this.reportViewer1.LocalReport.Refresh();

        Generatereport(dt);

        //***

       // this.reportViewer1.ReportRefresh();
        //************************


    }


    private void Generatereport(DataTable dt)
    {
        reportViewer1.SizeToReportContent = true;
        reportViewer1.LocalReport.ReportPath = Server.MapPath("~/user_manager.rdlc");
        reportViewer1.LocalReport.DataSources.Clear();
        ReportDataSource _rsource = new ReportDataSource("DataSet1", dt);
        reportViewer1.LocalReport.DataSources.Add(_rsource);
        reportViewer1.LocalReport.Refresh();
    }

}