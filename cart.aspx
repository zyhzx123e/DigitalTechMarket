<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="digitTech.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
.GridView1{ margin-left:200px;}
#price{ margin-left:200px;}
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Reference :
    http://stackoverflow.com/questions/18244871/how-to-display-confirmation-message-with-gridview-showdeletebutton-commandfield
    http://stackoverflow.com/questions/12194650/asp-net-adding-attribute-to-gridview-commandfield-delete-button
    https://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.commandfield.showdeletebutton(v=vs.110).aspx    -->
    <table width="100%">
        <tr><td>
   <!--
        Eval & Bind
        one for two way, one is only one way displaying
        
        http://www.aspsnippets.com/Articles/Difference-between-Eval-and-Bind-functions-in-ASPNet.aspx

        http://stackoverflow.com/questions/1778221/understanding-asp-net-eval-and-bind
        -->
    <asp:GridView ID="GridView1" CssClass="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="id" DataSourceID="SqlDataSource1" 
        EmptyDataText="No Digital devices in the Cart" 

        onrowdatabound="GridView1_RowDataBound" 
        onrowdeleted="GridView1_RowDeleted" BackColor="#0" 
        BorderColor="#f8f6b2" BorderStyle="None" BorderWidth="3px" CellPadding="3" GridLines="Horizontal" 
        >
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:CommandField ButtonType="Button" ControlStyle-CssClass="btn-info" ShowDeleteButton="True" />
            <asp:BoundField DataField="pName" HeaderText="PRODUCT" SortExpression="pName" />
            <asp:BoundField DataField="brand" HeaderText="BRAND" SortExpression="brand" />

            <asp:TemplateField HeaderText="img" SortExpression="img">
              
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Width="150px" Height="80px" ImageUrl='<%# Bind("img")  %>' />
                </ItemTemplate>

            </asp:TemplateField>

            <asp:BoundField DataField="quantity" HeaderText="QUANTITY" 
                SortExpression="quantity" />


            <asp:BoundField DataField="price" HeaderText="COST" SortExpression="price" />
        </Columns>

        <FooterStyle BackColor="#f8bc59" ForeColor="#7d1b0a" />
        <HeaderStyle BackColor="#ff3d24" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#f8f6b2" ForeColor="#7d1b0a" HorizontalAlign="Right" />
        <RowStyle BackColor="#f8f6b2" ForeColor="#7d1b0a" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />





         </asp:GridView>

             <!--referenced https://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.gridview.rowstyle(v=vs.110).aspx-->
  


    </td>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:shopingConnectionString1 %>" 
        SelectCommand="SELECT * FROM [shoppingCart] WHERE ([uName] = @uName)" 
       
        
        DeleteCommand="DELETE FROM [shoppingCart] WHERE [id] = @id" >
      
        
        
        <SelectParameters>
            <asp:CookieParameter CookieName="uname" Name="uName" Type="String" />
        </SelectParameters>

         <DeleteParameters>
            <asp:Parameter Name="id" Type="Int64" />
        </DeleteParameters>
       
        
        
    </asp:SqlDataSource>
        <!--Reference :
    http://stackoverflow.com/questions/18244871/how-to-display-confirmation-message-with-gridview-showdeletebutton-commandfield
    http://stackoverflow.com/questions/12194650/asp-net-adding-attribute-to-gridview-commandfield-delete-button
    https://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.commandfield.showdeletebutton(v=vs.110).aspx    -->
    <td> 
    <div id="price">Total Cost<asp:TextBox ID="TextBox2" runat="server" 
            BorderColor="#CC3300" Enabled="False" 
        Font-Bold="True" ForeColor="Red"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <br /> 
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<%--<asp:ImageButton ID="ImageButton3" runat="server" AlternateText="check out" 
        onclick="ImageButton3_Click1" ToolTip="click for check out" ImageUrl="~/img/str/buttons/checkout.jpg"  />--%>
    <br />

    <asp:HyperLink ID="HyperLink88" runat="server"  >Pay</asp:HyperLink>
    </div>
   </td> </tr>
    </table>
</asp:Content>
