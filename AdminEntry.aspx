<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" EnableViewState="true" Trace="true"  CodeFile="AdminEntry.aspx.cs" Inherits="digitTech.AdminEntry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 272px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   

    <table cellspacing=4 cellpadding=2 width=100%>
        <tr>

            <td class="style1">Select product CATEGORY</td>
            <td>
               
                 
                <asp:DropDownList ID="catText" runat="server" AutoPostBack="True" Width="81px" 
                    Height="19px">
                    <asp:ListItem Value="mobile">mobile</asp:ListItem>
                    <asp:ListItem Value="computer">computer</asp:ListItem>
                    <asp:ListItem Value="other">other</asp:ListItem>
                    <asp:ListItem Value="gadgets">gadgets</asp:ListItem>
                    <asp:ListItem Value="miscellaneous">miscellaneous</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style1">Enter product BRAND</td>
            <td>
                <asp:DropDownList ID="brandText" runat="server" DataSourceID="SqlDataSource1" 
                    DataTextField="brand" DataValueField="brand">
                </asp:DropDownList>

                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:shopingConnectionString1 %>" 
        SelectCommand="SELECT [brand] FROM [brand] ">
        
    </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style1">Enter product NAME</td>
            <td>
                <asp:TextBox ID="nameText" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nameText" 
                    ErrorMessage="Please fill the name of product"   ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        
        
        
        <tr>
            <td class="style1">Enter product PRICE</td>
            <td>
                <asp:TextBox ID="priceText" runat="server"></asp:TextBox>
                <asp:RangeValidator ID="RangeValidator1" ForeColor="Red" runat="server" MinimumValue="1" ErrorMessage="Must enter a numeric value" ControlToValidate="priceText" MaximumValue="999999" Type="Integer"></asp:RangeValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="Must enter some price" ControlToValidate="priceText"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <!---->

          <tr>
            <td class="style1">Enter product Description</td>
            <td>
                <asp:TextBox ID="description" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" runat="server" ErrorMessage="Must enter some descriptions" ControlToValidate="description"></asp:RequiredFieldValidator>
            </td>
        </tr>

         <tr>
            <td class="style1">Enter product Rating</td>
            <td>
                <asp:TextBox ID="rating" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" runat="server" ErrorMessage="Must enter a rating" ControlToValidate="rating"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td class="style1">Enter some comments</td>
            <td>
                <asp:TextBox ID="comments" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" runat="server" ErrorMessage="Must enter some comments" ControlToValidate="comments"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <!---->
        <tr>
            <td class="style1">Browse product IMAGE </td>
            <td>
                <asp:FileUpload ID="FileUpload1"  runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="FileUpload1" ErrorMessage="show image path"></asp:RequiredFieldValidator>
            </td>
        </tr>


</table>




    <br />
    <asp:Button ID="Button1" runat="server" CssClass=" btn-danger" onclick="Button1_Click" Text="Add this product" />

    





    <asp:Label ID="msg" runat="server"></asp:Label>

    





    <br />
   

    

</asp:Content>
