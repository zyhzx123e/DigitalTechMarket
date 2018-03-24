<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeFile="login1.aspx.cs" Inherits="digitTech.login1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
        <link rel="stylesheet" type="text/css" href="css/1.css"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      
    <br /><hr /><br />
    <asp:ImageButton ID="shop" runat="server" ImageUrl="~/img/view_first.png"
                        CssClass="add" PostBackUrl="~/default_non.aspx" CausesValidation="False" 
                            Visible="True" />
   <center><h1><b>Welcome to DigitalTech</b></h1></center>

    <br /><br />
    
   <center><h5> User Name &nbsp
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
</h5></center>

    <br />
<center><h5>Password &nbsp

    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
</h5></center>
    <br />

    <center>
<asp:ImageButton ID="ImageButton3" runat="server" AlternateText="sign in" 
    onclick="ImageButton3_Click" ImageUrl="~/img/str/buttons/signin.png" />

        </center>

<br />
<asp:Label ID="Label1" runat="server"></asp:Label>


 

     <center>
    <a runat="server" href="~/pwd_recover.aspx" style={color:red;} >Forgot passward?...Click Me>></a>
          </center>
    <br />


</asp:Content>
