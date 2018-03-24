<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeFile="computer.aspx.cs"  Inherits="digitTech.computer" %>
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
      <asp:ImageButton ID="ImageButton88" runat="server" ImageUrl='~/img/str/buttons/home.png'   PostBackUrl="default_non.aspx" />
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal"
        BackColor="Transparent" ItemStyle-BackColor="Transparent" RepeatColumns="4" >

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
                <!-- -->
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("b") %>'></asp:Label>&emsp;
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("pn") %>'></asp:Label><br />
                   RM<asp:Label ID="productNameLabel11" runat="server" Text='<%# Eval("price") %>' /> <br /> 
                  <br /><br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </ItemTemplate>
  </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:shopingConnectionString1 %>"
            SelectCommand="SELECT id,image,upper(productName) as pn,productName,upper(brand) as b,price FROM [product] WHERE ([catagory] = @catagory) order by id desc ">
            <SelectParameters>
                <asp:Parameter DefaultValue="computer" Name="catagory" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

    <!--
        
        RowStyle property  in a GridView control

        referenced from:
        https://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.gridview.rowstyle(v=vs.110).aspx
        

        populate data from db for repeated template by displaying Data with the DataList and Repeater Controls 
        https://www.asp.net/web-forms/overview/data-access/displaying-data-with-the-datalist-and-repeater/displaying-data-with-the-datalist-and-repeater-controls-cs
       


        Sample Shop list code , author:amiT jaiN
        http://csharpdotnetfreak.blogspot.com/2009/05/aspnet-creating-shopping-cart-example.html
         -->


</asp:Content>
