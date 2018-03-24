<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeFile="search_non.aspx.cs" Inherits="digitTech.search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <br />
    <hr/>
<center><asp:TextBox ID="txt_product" class="tftextinput" width="788px" height ="30px" CssClass="btn bg-default" runat="server" BorderColor="Maroon" BackColor="#999966" Font-Bold="True" Font-Size="13" ForeColor="Yellow" placeholder="Search keyword of digital devices in DigitalTech"></asp:TextBox> 
      </center> 
    <br /> <center><asp:Button ID="btn_search" CssClass="btn btn-primary" runat="server" class="tfbutton" type="submit" Text="Search!!" OnClick="btn_search_Click" Width="100px" Height="40px" Font-Size="11" /><br/><hr/>
      </center> 


    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal"
            RepeatColumns="4" >
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("id") %>' Visible='false'></asp:Label>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image") %>' Height="250px" Width="225px" />&emsp;&emsp;&emsp;&emsp;
                <br />
                <!--reference from
                    https://forums.asp.net/t/1640235.aspx?How+to+pass+a+QueryString+in+ASP+NET+s+SelectCommand+from+Code+Front+ -->
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("b") %>'></asp:Label>&emsp;
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("productName") %>'></asp:Label><br />
                   RM<asp:Label ID="productNameLabel11" runat="server" Text='<%# Eval("price") %>' /> <br /> 
                 <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='~/img/detail.png'    PostBackUrl='<%#"productDetail_non.aspx?pName="+Eval("productName") %>' />
          
                 <br /><br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </ItemTemplate>
  </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:shopingConnectionString1 %>"
          SelectCommand="SELECT id,image,productName,catagory ,upper(brand) as b,desciption,price FROM [product] WHERE ([productName] like '%'+@productName+'%' ) or ([catagory] like '%'+@catagory+'%') or ([brand] like '%'+@brand+'%' ) or ([desciption] like '%'+@desciption+'%') order by id desc">
             <SelectParameters>
                   
                     <asp:QueryStringParameter Name="productName" DbType = "String"  QueryStringField="pName"  />
   <asp:QueryStringParameter Name="catagory" DbType = "String"  QueryStringField="catagory"  />
   <asp:QueryStringParameter Name="brand" DbType = "String"  QueryStringField="brand"  />
   <asp:QueryStringParameter Name="desciption" DbType = "String"  QueryStringField="desciption"  />


             </SelectParameters>

          



        </asp:SqlDataSource>


  <!--
              
              The Official Forums for Microsoft ASP.NET. . Using "LIKE" and a parameter in SqlDataSource | The ASP.NET Forums. [ONLINE] Available at: https://forums.asp.net/t/1227671.aspx?Using+LIKE+and+a+parameter+in+SqlDataSource. [Accessed 29 November 2016].
              -->

</asp:Content>
