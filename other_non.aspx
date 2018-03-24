<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeFile="other.aspx.cs" Inherits="digitTech.other" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 241px;
            height: 209px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:ImageButton ID="ImageButton88" runat="server" ImageUrl='~/img/str/buttons/home.png'   PostBackUrl="default_non.aspx" />
    

     <!---
       data populated using datalist in asp code sample reference

        Coached By Scott Mitchell
        https://www.asp.net/web-forms/overview/data-access/displaying-data-with-the-datalist-and-repeater/displaying-data-with-the-datalist-and-repeater-controls-cs
        
        By Erik Reitan
         https://www.asp.net/web-forms/overview/getting-started/getting-started-with-aspnet-45-web-forms/display_data_items_and_details

        http://stackoverflow.com/questions/22202372/get-selected-product-from-a-datalist-in-visual-studio-and-sql
        --->
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal"
            RepeatColumns="4" BackColor="Transparent" ItemStyle-BackColor="Transparent" 
    BorderStyle="None" BorderWidth="1px" CellPadding="3"  >
           
         
          <%--<
                  ASp Datalist ItemTemplate
                    web control in datalist
                      reference
                    
                    https://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.datalist.itemtemplate(v=vs.110).aspx
                    
                    />--%>
           <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("id") %>' Visible='false'></asp:Label>
                 <asp:ImageButton ID="ImageButton2" runat="server" ToolTip='<%# Eval("productName") %>'  ImageUrl='<%# Eval("image") %>' Width="250" Height="225"   PostBackUrl='<%#"productDetail.aspx?pName="+Eval("productName") %>'  />
       
                <br />
                   RM<asp:Label ID="productNameLabel11" runat="server" Text='<%# Eval("price") %>' /> <br /> 
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("productName") %>'></asp:Label>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </ItemTemplate>



  </asp:DataList>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:shopingConnectionString1 %>" 
       SelectCommand="SELECT * FROM [product] WHERE ([catagory] = @catagory) order by id desc "> 
       
         
         <SelectParameters>
            <asp:Parameter DefaultValue="other" Name="catagory" Type="String" />
        </SelectParameters>
        
        
    </asp:SqlDataSource>

     <!---
       data populated using datalist in asp code sample reference

        Coached By Scott Mitchell
        https://www.asp.net/web-forms/overview/data-access/displaying-data-with-the-datalist-and-repeater/displaying-data-with-the-datalist-and-repeater-controls-cs
        
        By Erik Reitan
         https://www.asp.net/web-forms/overview/getting-started/getting-started-with-aspnet-45-web-forms/display_data_items_and_details

        http://stackoverflow.com/questions/22202372/get-selected-product-from-a-datalist-in-visual-studio-and-sql
        --->
 
</asp:Content>
