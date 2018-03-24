<%@ Page Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeFile="order_list.aspx.cs" Inherits="order_list" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
   



<body style="background-image:url(img/tangjunaru.jpg)" onload=display_ct();>
 
    <div>
    
          <!--start here -->

   <center>  <h2 ><a href="~/default.aspx" runat="server"> DigitalTech Order from DigitalTech to Supplier</a><br /><br /><br /></h2> </center>
        <br /><hr /> <center>
          <a href="default.aspx">        

          <a href="~/default.aspx"> 
              
              </a>
                  </center>
    <hr />
    <div id="main"><center>
        <div class="col-lg-12">
           

 <hr /> 
            <asp:GridView ID="gridview_order_list" AutoGenerateColumns="true" runat="server" Width="686px" OnSelectedIndexChanged="gridview_order_list_SelectedIndexChanged">
                </asp:GridView> 
             <h4>
                 <div style="color:rgba(4, 10, 97, 0.90); font-weight: bold; text-align:right"; id='ct'></div></h4>
			<br />

            <div  class="form-group form-inline">



                product ID:
                 <asp:TextBox ID="product_id"  CssClass="form-control" runat="server"></asp:TextBox>
       
            </div>

            <div class="form-group form-inline">
               Product Name:
                  <asp:TextBox ID="product_name"  CssClass="form-control" runat="server"></asp:TextBox>
       
            </div>



            <div class="form-group form-inline">
                Brand Name:
                 <asp:TextBox ID="brand_name" placeholder="eg. Acer, Asus"  CssClass="form-control" runat="server"></asp:TextBox>
       
            </div>


            <div class="form-group form-inline">
                Image :<asp:FileUpload ID="FileUploader" CssClass="btn-primary" runat="server" OnDataBinding="FileUploader_DataBinding" />
&nbsp;<asp:TextBox ID="img_path" placeholder="eg. Dell, Toshiba"  CssClass="form-control" runat="server"></asp:TextBox>
                 <asp:Button ID="img_btn" runat="server" CssClass="btn-warning" Text="Upload this img" OnClick="img_btn_Click"  />
              
                
                <br />
            </div>

            <div class="form-group form-inline">
                Cateogry:
                <asp:DropDownList ID="category" runat="server" DataSourceID="SqlDataSource4" DataTextField="catagory" DataValueField="catagory">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                    ConnectionString="<%$ ConnectionStrings:shopingConnectionString1 %>" 
                    SelectCommand="SELECT catagory FROM product"></asp:SqlDataSource>
          
                  </div>

            <div class="form-group form-inline">
                Price
                
                <asp:TextBox ID="unit_price"  CssClass="form-control" runat="server"></asp:TextBox>
       
                  <asp:RangeValidator ID="RangeValidator1" runat="server" 
               ControlToValidate="unit_price" ErrorMessage="must fill value 0-1,000,000" 
               MaximumValue="1000000" MinimumValue="0" Display="Dynamic" Type="Integer"></asp:RangeValidator>
           <br />
                
                  </div>

       
            
            <div class="form-group form-inline">
                Quantity
                
                <asp:TextBox ID="qty"  CssClass="form-control" runat="server" Text="0"></asp:TextBox>
       
                
                 <asp:RangeValidator ID="RangeValidator2" runat="server" 
               ControlToValidate="qty" ErrorMessage="must fill value 1-1000" 
               MaximumValue="1000" MinimumValue="0" Display="Dynamic" Type="Integer"></asp:RangeValidator>
           <br />
                

                  </div>


     
            <br /><hr />
            <div class="form-group">
                <asp:Label ID="msg" runat="server"></asp:Label>
                <asp:Button ID="Button" CssClass="btn-info" runat="server"  Text="Add Product" OnClick="Button_Click" />
                <br />
                <br />
                <br />
               
            </div>
            <hr />
             <center><h4>Generating Order's List Report</h4></center>

        <asp:DropDownList ID="ddlUsers" runat="server">
</asp:DropDownList>
        <center>
<asp:Button ID="btnReport" runat="server" CssClass="btn-warning" Text="Generate Supplier Order Report" OnClick="btnReport_Click" />
      
            
               <rsweb:reportviewer ID="ReportViewer1" runat="server" style="margin-left: 0px" Width="724px" BorderColor="#009900" BorderStyle="Solid" InternalBorderWidth="3px">
        </rsweb:reportviewer>

        </div></center>
    </div>


        
    <!-- wrap starts here -->
<div id="wrap">

  <!-- footer starts -->      
  <div id="footer-wrap"><div id="footer">        
      <br />
     <h5>
      &copy; 2016  <a href="#">DigitalTech</a> | All Rights Reserved

            &nbsp;&nbsp;&nbsp;&nbsp;

      <em>Design by <a href="https://github.com/abdulaziz-developer-APU-UC2F1605IT">Abdulaziz</a> </em>
</h5>
         
   
      
  </div></div>
  <!-- footer ends-->  

<!-- wrap ends here -->
</div>




    </div>
    
</body>
    </asp:Content>
