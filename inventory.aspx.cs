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

public partial class inventory : System.Web.UI.Page
{
    // public DataGrid gridview_inventory{get; set;}
    public string html_table{get;set;}
    //
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["shopingConnectionString1"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        // public DataGrid gridview_inventory{get; set;}
      
        if (!IsPostBack)
        {

            // Declare the query string.
            String queryString =
              "SELECT  id,productName as 'Supplier_Inventory_product_name' ,brand,catagory,desciption,price,rating,comments FROM product";
        
            // Run the query and bind the resulting DataSet
            // to the GridView control.
            DataSet ds = GetData(queryString);
            DataTable dt = new DataTable();
            if (ds.Tables.Count > 0)
            {
              gridview_inventory.DataSource = ds;
              gridview_inventory.DataBind();


                dt = ds.Tables[0];
            }
            else
            {
                msg.Text = "Unable to connect to the database.";
            }



     html_table = ConvertDataTableToHTML(dt);





        }
    }


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


    DataSet GetData(String queryString)
    {
       
        DataSet ds = new DataSet();
        
        try
        {
            // Connect to the database and run the query.
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
        string query = "Update product set catagory='" + cat_name.SelectedValue.ToString().Trim() + "',productName='" + txt_product_name.Text.Trim() + "',brand='" + txt_brand.Text.Trim() + "',desciption='" + txt_description.Text.Trim() + "',price='" + txt_price.Text.Trim() + "',rating='" + txt_rating.Text.Trim() + "' ,comments='" + txt_comments.Text.Trim() + "',quantity='"+qty.Text.Trim()+"' where id='" + item_id.SelectedValue.ToString().Trim() + "' ";

        con.Open();
        cmd.Connection = con;
        cmd.CommandText = query;
        cmd.ExecuteNonQuery();

        if (cmd.ExecuteNonQuery() > 0)
        {
            msg.Text = "Updated Successfully.";


        } con.Close();
    }

    protected void total_btn_Click(object sender, EventArgs e)
    {

        if (qty.Text != null || unit_price!=null)
        {
        double d = Double.Parse(qty.Text);
        double d1 = Double.Parse(unit_price.Text);
        double total_price = d * d1;

        total.Text = total_price.ToString();
            
        }
        
    }
    protected void total_TextChanged(object sender, EventArgs e)
    {
        if (Double.Parse(qty.Text) >= 0)
        {
            double d = Double.Parse(qty.Text);
            double d1 = Double.Parse(unit_price.Text);
            double total_price = d * d1;

            total.Text = total_price.ToString();

        }
    }
    protected void total_btn_Click1(object sender, EventArgs e)
    {
        if (qty.Text != null || unit_price != null)
        {
            double d = Double.Parse(qty.Text);
            double d1 = Double.Parse(unit_price.Text);
            double total_price = d * d1;

            total.Text = total_price.ToString();

        }
    }


 


   
    private void Generatereport(DataTable dt)
    {
        ReportViewer1.SizeToReportContent = true;
        ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/inventory_new.rdlc");
        ReportViewer1.LocalReport.DataSources.Clear();
        ReportDataSource _rsource = new ReportDataSource("DataSet2", dt);
        ReportViewer1.LocalReport.DataSources.Add(_rsource);
        ReportViewer1.LocalReport.Refresh();
    }

    protected void btnReport_Click(object sender, EventArgs e)
    {



        Response.Write("8888");
        ReportViewer1.ProcessingMode = ProcessingMode.Local;
        ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/inventory_new.rdlc");

        MyDigitalDevicesDataSet MyDigitalDevicesDataSet = new MyDigitalDevicesDataSet();
        String s = "SELECT  [id],[productName] as 'Supplier_Inventory_product_name' ,[brand],[catagory],[desciption] ,[price],[rating],[comments] FROM [product]";
        
        SqlDataAdapter da = new SqlDataAdapter(s, con);
        DataTable dtable = new DataTable();

        da.Fill(MyDigitalDevicesDataSet, MyDigitalDevicesDataSet.Tables["product"].TableName);

        dtable = MyDigitalDevicesDataSet.Tables["product"];
        //YouTube. 2016.  how to create  report in C# net using Dataset,visual studio - YouTube. [ONLINE] Available at: https://www.youtube.com/watch?v=uRICO1sZ3Hc. [Accessed 29 December 2016].


        Generatereport(dtable);
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        string s = @"~\img\product\" + FileUpload1.FileName;
        FileUpload1.PostedFile.SaveAs(Server.MapPath(s));
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["shopingConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        string query = "insert into product(catagory,productName,brand,desciption,price,rating,comments,image,quantity) values('" + cat_name.SelectedValue.ToString().Trim() + "','" + txt_product_name.Text.Trim() + "','" + txt_brand.Text.Trim() + "','" + txt_description.Text.Trim() + "','" + txt_price.Text.Trim() + "','" + txt_rating.Text.Trim() + "','" + txt_comments.Text.Trim() + "','" + s + "','" + qty.Text.Trim()+ "') ";

        con.Open();
        cmd.Connection = con;
        cmd.CommandText = query;
        cmd.ExecuteNonQuery();

        if (cmd.ExecuteNonQuery() > 0)
        {
            msg.Text = "Added new inventory items Successfully.";


        } con.Close();
    }
}