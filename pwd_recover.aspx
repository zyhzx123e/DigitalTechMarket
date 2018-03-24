<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeFile="pwd_recover.aspx.cs" Inherits="digitTech.Password_recover" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <br/><hr/><br/>
        <center>
<table>
    
    
    <tr><td>Enter your email Idso we can send you your user id & password:</td><td>
        
        
        <asp:TextBox ID="TextBox1" CssClass=" bg-info" runat="server"></asp:TextBox></td>
    <td><asp:ImageButton ID="ImageButton3" runat="server" 
        AlternateText="Click to get password" onclick="ImageButton3_Click" 
        ImageUrl="~/img/str/buttons/btn_send.png" /><!-- -->
      </td> </tr>


 </table>

    </center>
    <br />

    <asp:Label ID="Label1" runat="server"></asp:Label>
</asp:Content>
