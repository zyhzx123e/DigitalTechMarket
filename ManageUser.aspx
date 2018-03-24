<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeFile="ManageUser.aspx.cs" Inherits="digitTech.ManageUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
   <script type="text/javascript" src="js/jquery-1.12.3.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
   <script type="text/javascript" src="js/jquery-1.12.3.js"></script>
      <!--start here -->
     <a href="default.aspx"> Manage the User within DigitalTech</a>
       <a href="~/default.aspx">  </a>
                  

     <h2>User's Profile</h2>
    <hr />
    <div class="row">
        <div class="col-lg-12">


            


            <!--
                
                 -->






            <div class="form-group">
                First Name:
                <asp:TextBox ID="first_name"  CssClass="form-control" runat="server"></asp:TextBox>

            </div>

            <div class="form-group">
                Last Name:
                 <asp:TextBox ID="last_name"  CssClass="form-control" runat="server"></asp:TextBox>

            </div>



            <div class="form-group form-inline">
                Customer ID:
                <asp:DropDownList ID="ddlSubjects" runat="server" DataSourceID="sdsSubjects" DataTextField="UserId" DataValueField="UserId">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsSubjects" runat="server"
                    SelectCommand="SELECT UserId FROM userDB"></asp:SqlDataSource>
          
            </div>


            <div class="form-group form-inline">
                Customer Password:
               <asp:TextBox ID="Password"  CssClass="form-control" runat="server"></asp:TextBox>

            </div>

            <div class="form-group form-inline">
                <asp:Label runat="server"  AssociatedControlID="privateEmail">Email</asp:Label>
                <asp:TextBox ID="privateEmail" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="form-group form-inline">
                <asp:Label runat="server"  AssociatedControlID="contactNumber">Contact Number</asp:Label>
                <asp:TextBox ID="contactNumber" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

       
            <div class="form-group form-inline">
                <asp:Label AssociatedControlID="address" runat="server">Address</asp:Label>
                <asp:TextBox TextMode="MultiLine" Rows="4" ID="address" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
     
            <br /><hr />
            <div class="form-group">
                <asp:Label ID="msg" runat="server"></asp:Label>
                <asp:Button ID="Button" CssClass="btn-warning" runat="server"  Text="Save" />
                <br />
                <br />


                <asp:GridView ID="gridview_users"  autogeneratecolumns="true"  runat="server" Width="403px">
                </asp:GridView>

            </div>
        </div>
    </div>










</asp:Content>

