<%@ Page Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeFile="inventory.aspx.cs" Inherits="inventory" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
   



<body style="background-image:url(img/borneo.jpg)" onload=display_ct();>
    
    <div>
    
          <!--start here -->

   <center>   <a href="~/default.aspx" runat="server"> <h2 >DigitalTech Supplier Inventory List<br /><br /><br /></h2></a> </center>
        <br /><hr />
        
        <center>
          <a href="default.aspx">        

          <a href="~/default.aspx"> 
              
              </a>
                  </center>
    <hr />
    <div id="main"><center>
        <div class="col-lg-12">


            


            <!--
                
                -->




            <div  class="form-group form-inline">
                Item ID:
                <asp:DropDownList ID="item_id" runat="server" DataSourceID="SqlDataSource2" DataTextField="id" DataValueField="id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString="<%$ ConnectionStrings:shopingConnectionString1 %>" 
                    SelectCommand="SELECT id FROM product"></asp:SqlDataSource>
          
            </div>

            <div class="form-group form-inline">
               Product Category:
                 <asp:DropDownList ID="cat_name" runat="server" DataSourceID="SqlDataSource1" DataTextField="catagory" DataValueField="catagory">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:shopingConnectionString1 %>" 
                    SelectCommand="SELECT distinct catagory FROM product"></asp:SqlDataSource>
          
            </div>



            <div class="form-group form-inline">
                Product Name:
               <asp:TextBox ID="txt_product_name"  CssClass="form-control" runat="server" Text="fill in product name"></asp:TextBox>
       
            </div>


            <div class="form-group form-inline">
                Brand Name:
               <asp:TextBox ID="txt_brand"  CssClass="form-control" runat="server" Text="fill in brand name"></asp:TextBox>
       
               
            </div>

             <div class="form-group form-inline">
                Description:
                 <asp:TextBox ID="txt_description"  CssClass="form-control" runat="server" Text="description of product" TextMode="MultiLine"></asp:TextBox>
       
            </div>

              <div class="form-group form-inline">
                Price:
               <asp:TextBox ID="txt_price"  CssClass="form-control" runat="server" Text="fill in price"></asp:TextBox>
       
               
            </div>

            <div class="form-group form-inline">
                Rating:
               <asp:TextBox ID="txt_rating"  CssClass="form-control" runat="server" Text="fill in rate"></asp:TextBox>
       
               
            </div>

            <div class="form-group form-inline">
                Comments:
               <asp:TextBox ID="txt_comments"  CssClass="form-control" runat="server" Text="fill in comments"></asp:TextBox>
       
               
            </div>
            

            <div class="form-group form-inline">
                Quantity
                
                <asp:TextBox ID="qty"  CssClass="form-control" runat="server" Text="0"></asp:TextBox>
       
                
                 <asp:RangeValidator ID="RangeValidator1" runat="server" 
               ControlToValidate="qty" ErrorMessage="must fill value 1-1000" 
               MaximumValue="1000" MinimumValue="0" Display="Dynamic" Type="Integer"></asp:RangeValidator>
           <br />
                
                  </div>

       
            <div class="form-group form-inline">
                Unit Price
              <asp:TextBox  ID="unit_price" CssClass="form-control" runat="server" Text="0">0</asp:TextBox>
      
           <asp:RangeValidator ID="RangeValidator2" runat="server" 
               ControlToValidate="unit_price" ErrorMessage="must fill value >0" 
               MaximumValue="9999999" MinimumValue="0" Display="Dynamic" Type="Integer"></asp:RangeValidator>
           <br />
                   </div>

            <div class="form-group form-inline">
               Total Price
              <asp:TextBox  ID="total" CssClass="form-control" runat="server" OnTextChanged="total_TextChanged"></asp:TextBox>
           <asp:Button ID="total_btn" runat="server" CssClass="btn-warning" Text="Calculate Total" OnClick="total_btn_Click1"  />
                <br />
                  </div>
              <div class="form-group form-inline">

            <asp:FileUpload ID="FileUpload1"  runat="server" />
                 </div>

     
            <br /><hr />
            <div class="form-group">
                <asp:Label ID="msg" runat="server"></asp:Label>
                <asp:Button ID="Button" runat="server" CssClass="btn-info" Text="Update" OnClick="Button_Click" />
                <asp:Button ID="Button1" runat="server" CssClass="btn-warning" OnClick="Button1_Click" Text="Add new Inventory Item" />
                <br />
                <br />
                <br />
                <h4>
                 

            <!--
                
                --> <h4>
               <div style="color:rgba(4, 10, 97, 0.90); font-weight: bold; text-align:right"; id='ct'></div></h4>
			<br />

            <asp:GridView ID="gridview_inventory" AutoGenerateColumns="true" runat="server" Width="686px">
                </asp:GridView> 
            </div>





        </div></center>


        <br />
        <hr />
             <center><h4>Generating Inventory Report</h4></center>

        <center>
<asp:Button ID="btnReport" runat="server" CssClass="btn-warning" Text="Generate Customer Inventory Report" OnClick="btnReport_Click" />
       
            <br />
        <rsweb:reportviewer ID="ReportViewer1" runat="server" style="margin-left: 0px" Width="724px" InternalBorderWidth="2px">
        </rsweb:reportviewer>


            <br />


        </div>


        
    <!-- wrap starts here -->
<div id="wrap">

  <!-- footer starts -->      
  <div id="footer-wrap"><div id="footer">        
      <br />
     <h5>
      &copy; 2016 <a href="#">DigitalTech</a> | All Rights Reserved

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
