<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true"
    CodeFile="productDetail.aspx.cs" Inherits="digitTech.productDetail"  %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 187px;
        }
        #dl
        {
            margin-left:300px;
            }
<!---->
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <table id="dl">
   <tr>

        <td>
       <!-- OnSelectedIndexChanged="DataList1_SelectedIndexChanged" -->
    <asp:DataList ID="DataList2" runat="server" DataKeyField="id" 
        DataSourceID="SqlDataSource2" onitemdatabound="use" BackColor="transparent" 
           BorderColor="#f8f6b2" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
           GridLines="Horizontal">
        <AlternatingItemStyle BackColor="#F7F7F7" />
        <FooterStyle BackColor="#f8bc59" ForeColor="#7d1b0a" />
        <HeaderStyle BackColor="#7d1b0a" Font-Bold="True" ForeColor="#F7F7F7" />
        <ItemStyle BackColor="#f8f6b2" ForeColor="#7d1b0a" />
        <ItemTemplate>

            PRODUCT ID:
            
            <asp:Label ID="product_id" runat="server" Text='<%# Eval("id") %>' />
            <br />
            PRODUCT NAME:
            
            <asp:Label ID="productNameLabel" runat="server" Text='<%# Eval("productName") %>' />
           <br /><hr/><br/>
            BRAND:
            <asp:Label ID="brandLabel" runat="server" Text='<%# Eval("brand") %>' />
            <br />
            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image") %>' Height="250px" Width="200px" />
            <br />
            CATAGORY:
            <asp:Label ID="catagoryLabel" runat="server" Text='<%# Eval("catagory") %>' />
            <hr/><br/>
            PRICE: RM
            <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
           <br /><hr/><br/>
             Description:
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("desciption") %>' />
             <br />
             Rating:
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("rating") %>' />
             <br /><hr/><br/>
             Comments:
            <asp:Label ID="Label3" runat="server" Text='<%# Eval("comments") %>' />
            


            <br />
            <asp:ImageButton ID="ImageButton1" CausesValidation="false" runat="server" ImageUrl="~/img/buy_now.png" PostBackUrl='<%#"https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=digitaltech.apu@gmail.com&item_name="+Eval("brand")+" "+Eval("productName")+"&item_number=132&amount="+Eval("price")%>' />
            
        </ItemTemplate>
        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
    </asp:DataList>
       <br /><hr />
       <asp:Label ID="Label5" runat="server" Text='<%# Eval("id") %>' />
            <br />
          
           <asp:Label ID="Label6" runat="server"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:shopingConnectionString1 %>"
        SelectCommand="SELECT top 1 [id], [productName], [brand], [image], [catagory], [price], [desciption], [rating] ,[comments] FROM [product] where catagory=(select catagory from product where [productName]=@productName)  ORDER BY NEWID()">
        <SelectParameters>
            <asp:QueryStringParameter Name="productName" QueryStringField="pName" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>




    </td>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <!-- this is to achieve the comparison function-->
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp;|&nbsp;
      <h2 style="font-size:x-large; color:#f24a4a; ">  Compare with the suggested Product with same category</h2>&nbsp;|&nbsp;
   
       <td>
       <!-- OnSelectedIndexChanged="DataList1_SelectedIndexChanged" -->
    <asp:DataList ID="DataList1" runat="server" DataKeyField="id" 
        DataSourceID="SqlDataSource1" onitemdatabound="use" BackColor="White" 
           BorderColor="#f8f6b2" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
           GridLines="Horizontal">
        <AlternatingItemStyle BackColor="#F7F7F7" />
        <FooterStyle BackColor="#f8bc59" ForeColor="#7d1b0a" />
        <HeaderStyle BackColor="#7d1b0a" Font-Bold="True" ForeColor="#F7F7F7" />
        <ItemStyle BackColor="#f8f6b2" ForeColor="#7d1b0a" />


          <%--<
                  ASp Datalist ItemTemplate
                    web control in datalist
                      reference
                    
                    https://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.datalist.itemtemplate(v=vs.110).aspx
                    
                    />--%>
        <ItemTemplate>

            PRODUCT ID:
            
            <asp:Label ID="product_id" runat="server" Text='<%# Eval("id") %>' />
            <br />
            PRODUCT NAME:
            
            <asp:Label ID="productNameLabel" runat="server" Text='<%# Eval("productName") %>' />
         
            <br /><hr/><br/>
            BRAND:
            <asp:Label ID="brandLabel" runat="server" Text='<%# Eval("brand") %>' />
            <br />
            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image") %>' Height="250px" Width="200px" />
            <br />
            CATAGORY:
            <asp:Label ID="catagoryLabel" runat="server" Text='<%# Eval("catagory") %>' />
            <br />
            PRICE: RM
            <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
             <br />
            <hr/><br/>
             Description:
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("desciption") %>' />
             <br />
             Rating:
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("rating") %>' />
             <br /><br /><hr/><br/>
             Comments:
            <asp:Label ID="Label3" runat="server" Text='<%# Eval("comments") %>' />
            


            <br />
       
            <asp:ImageButton ID="ImageButton1" CausesValidation="false" runat="server" ImageUrl="~/img/buy_now.png" PostBackUrl='<%#"https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=digitaltech.apu@gmail.com&item_name="+Eval("brand")+" "+Eval("productName")+"&item_number=132-"+Eval("id")+"-"+Eval("productName")+"&amount="+Eval("price")%>' />
      <script language="c#" runat="server">
 
  

</script>
        </ItemTemplate>
          <%--<
                  ASp Datalist ItemTemplate
                    web control in datalist
                      reference
                    
                    https://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.datalist.itemtemplate(v=vs.110).aspx
                    
                    />--%>
        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
    </asp:DataList>
       <br /><hr />
       <asp:Label ID="_id" runat="server" Text='<%# Eval("id") %>' />
            <br />
           <script language="c#" runat="server">
          
               protected void comment_click1(object sender, EventArgs e)
               {

                   if (System.Web.HttpContext.Current.Session["logged"] != "yes" || System.Web.HttpContext.Current.User.Identity.IsAuthenticated == false)
                   {
                       Response.Redirect("~/login1.aspx");
                   }
                   else
                   {

                       string pname = ViewState["poductName"].ToString();
                       System.Data.SqlClient.SqlConnection a = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["shopingConnectionString1"].ConnectionString);


                       a.Open();
                       string s = "UPDATE product SET comments=CONCAT(comments,'," + comments.Text.Trim() + "') where productName='" + pname + "' ; ";
                       System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand();// use sql concact to append comments
                       cmd.Connection = a;
                       cmd.CommandText = s;

                       cmd.ExecuteNonQuery();
                       a.Close();
                       Label4.Text = "your comment have been submited";

                   }
               }

</script>


            Your Comments about this product:<%# Eval("productName") %>
            <asp:TextBox ID="comments" runat="server" TextMode="MultiLine"></asp:TextBox>
            <asp:Button ID="comment_btn" runat="server" Text="comment this" onclick="comment_click1" />
<asp:Label ID="Label4" runat="server"></asp:Label>
  
           
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:shopingConnectionString1 %>"
        SelectCommand="SELECT [id], [productName], [brand], [image], [catagory], [price], [desciption], [rating] ,[comments] FROM [product] WHERE ([productName] = @productName)">
       
        
         <SelectParameters>
            <asp:QueryStringParameter Name="productName" QueryStringField="pName" Type="String" />
      
               </SelectParameters>
    
    
    
    </asp:SqlDataSource>




    </td>
       
       <td class="style2">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</br></br>
    <%--<asp:Button ID="Button1" runat="server" Text="Add to Cart" OnClick="Button1_Click" />--%>
    QUANTITY<br /><asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
          <asp:RangeValidator ID="RangeValidator1" runat="server" 
               ControlToValidate="TextBox1" ErrorMessage="must fill value 1-1000" 
               MaximumValue="1000" MinimumValue="1" Display="Dynamic" Type="Integer"></asp:RangeValidator>
           <br />
    <asp:ImageButton ID="ImageButton2" runat="server"   
        ImageUrl="~/img/str/buttons/AddToCart.gif" onclick="ImageButton2_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;
   
    </td></tr></table>
   
   
   
    
    <br />
</asp:Content>
