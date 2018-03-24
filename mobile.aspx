<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeFile="mobile.aspx.cs" Inherits="digitTech.mobile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <!---
        datalist asp control with display items from database for digital items in shop
        reference from

        Coached By Scott Mitchell
        https://www.asp.net/web-forms/overview/data-access/displaying-data-with-the-datalist-and-repeater/displaying-data-with-the-datalist-and-repeater-controls-cs
        
        By Erik Reitan
         https://www.asp.net/web-forms/overview/getting-started/getting-started-with-aspnet-45-web-forms/display_data_items_and_details

        http://stackoverflow.com/questions/22202372/get-selected-product-from-a-datalist-in-visual-studio-and-sql
        --->
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal"
          BackColor="Transparent" ItemStyle-BackColor="Transparent"   RepeatColumns="4" BorderColor="#f8f6b2" 
    BorderStyle="None"  CellPadding="3"  >


          <%--<
                  ASp Datalist ItemTemplate
                    web control in datalist
                      reference
                    
                    https://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.datalist.itemtemplate(v=vs.110).aspx
                    
                    />--%>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("id") %>' Visible='false'></asp:Label>
               <asp:ImageButton ID="ImageButton2" runat="server" ToolTip='<%# Eval("productName") %>'  ImageUrl='<%# Eval("image") %>' Width="250" Height="225"   PostBackUrl='<%#"productDetail.aspx?pName="+Eval("productName") %>'  />
         &emsp;&emsp;&emsp;&emsp;
          
                <br />
                    RM<asp:Label ID="productNameLabel11" runat="server" Text='<%# Eval("price") %>' /> <br /> 
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("productName") %>'></asp:Label>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            </ItemTemplate>

  </asp:DataList>
        
     <!--
        
        RowStyle property  in a GridView control

        referenced from:
        https://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.gridview.rowstyle(v=vs.110).aspx
        

        populate data from db for repeated template by displaying Data with the DataList and Repeater Controls 
        https://www.asp.net/web-forms/overview/data-access/displaying-data-with-the-datalist-and-repeater/displaying-data-with-the-datalist-and-repeater-controls-cs
       


        Sample Shop list code , author:amiT jaiN
        http://csharpdotnetfreak.blogspot.com/2009/05/aspnet-creating-shopping-cart-example.html
         -->
    
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:shopingConnectionString1 %>"
            SelectCommand="SELECT [id],[image], [productName],[price] FROM [product] WHERE ([catagory] = @catagory) order by id desc ">
            <SelectParameters>
                <asp:Parameter DefaultValue="mobile" Name="catagory" Type="String" />
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
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
</asp:Content>
