using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Windows;

using Microsoft.Reporting.WebForms;
using Microsoft.Reporting.Common;
using Microsoft.Reporting;


public partial class order_list : System.Web.UI.Page
{
    // public DataGrid gridview_inventory{get; set;}  UPDATE Table SET Field=CONCAT(Field,'your extra html');
    public string html_table{get;set;}

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["shopingConnectionString1"].ConnectionString);

    //
    protected void Page_Load(object sender, EventArgs e)
    {
         
       

            // Declare the query string.
            String queryString =
              "SELECT  [productName] as 'order_product_name' ,[brand],[catagory],[desciption] ,[quantity] as 'order_quantity' FROM [product]";
        
            // Run the query and bind the resulting DataSet
            // to the GridView control.
            DataSet ds = GetData(queryString);
            DataTable dt = new DataTable();
            if (ds.Tables.Count > 0)
            {
                  gridview_order_list.DataSource = ds;
                  gridview_order_list.DataBind();


              dt = ds.Tables[0];
            }
            else
            {
                msg.Text = "Unable to connect to the database.";
            }



      //  html_table = ConvertDataTableToHTML(dt);





        
    }


    public static string ConvertDataTableToHTML(DataTable dt)
    {
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


    DataSet GetData(String queryString)
    {
        //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["shopingConnectionString1"].ConnectionString);

       // String connectionString=System.Web.Configuration.WebConfigurationManager.ConnectionStrings["shopingConnectionString1"].ConnectionString;
        // Retrieve the connection string stored in the Web.config file.
       // String connectionString = ConfigurationManager.ConnectionStrings["shopingConnectionString1"].ConnectionString;

      
        DataSet ds = new DataSet();
        
        try
        {
            // Connect to the database and run the query.
            SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|\\shoping.mdf;Integrated Security=True;MultipleActiveResultSets=True");

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
        string query = "insert into product(id,productName,brand,image,catagory,price,quantity) values(" + product_id.Text.Trim() + ",'" + product_name.Text.Trim() + "','" + brand_name.Text.Trim() + "','" + img_path.Text.Trim() + "','" + category.Text.Trim() + "'," + unit_price.Text.Trim() + ","+qty.Text.Trim()+");";

        con.Open();
        cmd.Connection = con;
        cmd.CommandText = query;
        cmd.ExecuteNonQuery();

        if (cmd.ExecuteNonQuery() > 0)
        {
            msg.Text = "Added an new order from supplier Successfully. The supplier will update it shortly!";


        } con.Close();
    }


     public string DefaultFileName = "~/img/"; //---- is the folder where files are uploaded to



 
    protected void FileUploader_DataBinding(object sender, EventArgs e)
    {
        if (FileUploader.HasFile)
            try
            {
                FileUploader.SaveAs(Server.MapPath(DefaultFileName) +
                     FileUploader.FileName);
                img_path.Text = FileUploader.PostedFile.FileName;


            }
            catch (Exception ex)
            {
                img_path.Text = "ERROR: " + ex.Message.ToString();
            }
        else
        {
            img_path.Text = "You have not specified a file.";
        }

    
    }
    protected void img_btn_Click(object sender, EventArgs e)
    {
        if (FileUploader.HasFile)
            try
            {
                FileUploader.SaveAs(Server.MapPath(DefaultFileName) +
                     FileUploader.FileName);
                img_path.Text = FileUploader.PostedFile.FileName;


            }
            catch (Exception ex)
            {
                img_path.Text = "ERROR: " + ex.Message.ToString();
            }
        else
        {
            img_path.Text = "You have not specified a file.";
        }

    }



    protected void btnReport_Click(object sender, EventArgs e)
    {
        //**********************
        ReportViewer1.ProcessingMode = ProcessingMode.Local;
        ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/order_list.rdlc");

        MyDigitalDevicesDataSet MyDigitalDevicesDataSet = new MyDigitalDevicesDataSet();
        String s = "SELECT [productName]  ,[image],[brand],[catagory],[desciption] ,[quantity]  FROM [product]";
        SqlDataAdapter da = new SqlDataAdapter(s, con);
        DataTable dt = new DataTable();

        da.Fill(MyDigitalDevicesDataSet, MyDigitalDevicesDataSet.Tables["product"].TableName);

        dt = MyDigitalDevicesDataSet.Tables["product"];
        //YouTube. 2016. crystal report,how to create crystal report in C# net using Dataset,visual studio - YouTube. [ONLINE] Available at: https://www.youtube.com/watch?v=uRICO1sZ3Hc. [Accessed 29 December 2016].
       

        Generatereport(dt);

    }


    private void Generatereport(DataTable dt)
    {
        ReportViewer1.SizeToReportContent = true;
        ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/order_list.rdlc");
        ReportViewer1.LocalReport.DataSources.Clear();
        ReportDataSource _rsource = new ReportDataSource("DataSet1", dt);
        ReportViewer1.LocalReport.DataSources.Add(_rsource);
        ReportViewer1.LocalReport.Refresh();
    }
    protected void gridview_order_list_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}