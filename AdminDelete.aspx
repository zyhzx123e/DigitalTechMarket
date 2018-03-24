<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeFile="AdminDelete.aspx.cs" Inherits="digitTech.AdminDelete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
#margin_left{ margin-left:200px;}
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="margin_left">
    <!--
        Eval & Bind
        one for two way, one is only one way displaying
        
        http://www.aspsnippets.com/Articles/Difference-between-Eval-and-Bind-functions-in-ASPNet.aspx

        http://stackoverflow.com/questions/1778221/understanding-asp-net-eval-and-bind
        -->
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="id" DataSourceID="SqlDataSource1" BackColor="orange" 
        BorderColor="#f8f6b2" BorderStyle="None" CellPadding="3" 
        >

        <AlternatingRowStyle BackColor="#F7F7F7" />

        <Columns>
            <asp:CommandField ButtonType="Button" ControlStyle-CssClass="btn-danger" ShowDeleteButton="True" />

            <asp:BoundField DataField="productName" HeaderText="PRODUCTNAME" 
                SortExpression="productName" />
            <asp:BoundField DataField="brand" HeaderText="BRAND" SortExpression="brand" />



            <asp:TemplateField HeaderText="IMAGE" SortExpression="image">
              
                <ItemTemplate >
                
                    <asp:Image ID="Image1" runat="server"  ImageUrl='<%# Bind("image") %>'  Height="50" Width="120"/>
                </ItemTemplate>
            </asp:TemplateField>




            <asp:BoundField DataField="catagory" HeaderText="CATEGORY" 
                SortExpression="catagory" />
        </Columns>


        <FooterStyle BackColor="#f8bc59" ForeColor="#7d1b0a" />
        <HeaderStyle BackColor="#7d1b0a" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#f8f6b2" ForeColor="#7d1b0a" HorizontalAlign="Right" />
        <RowStyle BackColor="#f8f6b2" ForeColor="#7d1b0a" />

        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#bff9d2" />
        <SortedAscendingHeaderStyle BackColor="#b4e9af" />
        <SortedDescendingCellStyle BackColor="#f8e9af" />
        <SortedDescendingHeaderStyle BackColor="#f8cbaf" />
    </asp:GridView></div>




    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:shopingConnectionString1 %>" 
        ProviderName="<%$ ConnectionStrings:shopingConnectionString1.ProviderName %>" 
        
        SelectCommand="SELECT [productName], [brand], [image], [catagory], [id] FROM [product]" 
        DeleteCommand="DELETE FROM [product] WHERE [id] = @id" 
       >
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int64" />
        </DeleteParameters>
       
      
    </asp:SqlDataSource>

</asp:Content>
