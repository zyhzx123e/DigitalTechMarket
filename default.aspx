<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true"
    CodeFile="default.aspx.cs" Inherits="digitTech._default_non"  %>
   

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
 

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" EnableViewState="false">
     <!---
        datalist asp control with display items from database for digital items in shop
        reference from

        Coached By Scott Mitchell
        https://www.asp.net/web-forms/overview/data-access/displaying-data-with-the-datalist-and-repeater/displaying-data-with-the-datalist-and-repeater-controls-cs
        
        By Erik Reitan
         https://www.asp.net/web-forms/overview/getting-started/getting-started-with-aspnet-45-web-forms/display_data_items_and_details

        http://stackoverflow.com/questions/22202372/get-selected-product-from-a-datalist-in-visual-studio-and-sql
        --->
    <table width=100% >
   <asp:PlaceHolder ID="lb_placeholder" runat="server"></asp:PlaceHolder>   
         

           <tr> <center>
             <td> <asp:ImageButton ID="ImageButton88" runat="server" ImageUrl='~/img/str/buttons/home.png'   PostBackUrl="~/default.aspx" />
  </td>
             
             
             <td> <asp:Menu runat="server">
             <Items>
                 <asp:MenuItem ImageUrl="~/img/str/buttons/search.gif" Text="Search what you want in DigitalTech" ToolTip="Search Digital Devices by keyword"
                                    Value="search" NavigateUrl="~/search.aspx"></asp:MenuItem>
             </Items>
             </asp:Menu></td> </center>  </tr>

         
  
         <tr><td><%--<asp:Image ID="Image4" runat="server" ImageUrl="~/img/str/buttons/lap.bmp" />--%>
        
          <!---
        datalist asp control with display items from database for digital items in shop
        reference from

        Coached By Scott Mitchell
        https://www.asp.net/web-forms/overview/data-access/displaying-data-with-the-datalist-and-repeater/displaying-data-with-the-datalist-and-repeater-controls-cs
        
        By Erik Reitan
         https://www.asp.net/web-forms/overview/getting-started/getting-started-with-aspnet-45-web-forms/display_data_items_and_details

        http://stackoverflow.com/questions/22202372/get-selected-product-from-a-datalist-in-visual-studio-and-sql
        --->
        <asp:DataList ID="DataList1"  runat="server" DataSourceID="SqlDataSource1" 
            BackColor="Transparent" ItemStyle-BackColor="Transparent"   
             BorderStyle="None"  CellPadding="3"   RepeatColumns="7" >
  
            <ItemTemplate>

               
                 
               <asp:ImageButton ID="ImageButton2" runat="server" ToolTip='<%# Eval("p") %>'  ImageUrl='<%# Eval("image") %>' Width="70" Height="70"   PostBackUrl='<%#"productDetail.aspx?pName="+Eval("productName") %>'  />
         
                  &emsp;&emsp;<br />
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("b") %>' />&emsp;
                <asp:Label ID="productNameLabel" runat="server" Text='<%# Eval("p") %>' /><br />
                RM<asp:Label ID="productNameLabel11" runat="server" Text='<%# Eval("price") %>' /> <br /> 
               </ItemTemplate>
        
               </asp:DataList>






        <!--datasource-->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:shopingConnectionString1 %>"
            
            SelectCommand="SELECT top 70 id,upper(productName) as p,productName,upper(brand) as b,image,price FROM [product]  order by id desc ">  
            
        </asp:SqlDataSource>




        <asp:Label ID="Label3" runat="server"></asp:Label>
        </td>














    </tr></table>
</asp:Content>
