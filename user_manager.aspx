<%@ Page Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeFile="user_manager.aspx.cs" Inherits="user_manager" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
   

   
          <!--start here -->

   <center> 
       
        <h1 >
                    <br /> <a href="default.aspx"> DigitalTech User's Profile Management </a> <br />

        </h1>

            


       

            <div  class="form-group form-inline">
                First Name:
                <asp:TextBox ID="first_name"  CssClass="form-control" runat="server"></asp:TextBox>

            </div>

            <div class="form-group form-inline">
                Last Name:
                 <asp:TextBox ID="last_name"  CssClass="form-control" runat="server"></asp:TextBox>

            </div>



            <div class="form-group form-inline">
                Customer ID:
                <asp:DropDownList ID="ddlSubjects" runat="server" DataSourceID="sdsSubjects" DataTextField="UserId" DataValueField="UserId">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsSubjects" runat="server"
                    ConnectionString="<%$ ConnectionStrings:shopingConnectionString1 %>" 
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
                <asp:Button ID="Button" runat="server" CssClass="btn-warning" Text="Update Info" OnClick="Button_Click" />
                <br />
                <br />
                <br />
                <h4>
                 <div style="color:rgba(2, 19, 117, 0.92); font-weight: bold; text-align:right"; id='ct'></div></h4>
			<br /><hr /> 
              <!--<asp:GridView ID="gridview_users" AutoGenerateColumns="true" runat="server" Width="686px">
                </asp:GridView>  -->
            </div>
       </center>
        


        <center><h4>Generating Customer's Report</h4></center>

        <asp:DropDownList ID="ddlUsers" runat="server">
</asp:DropDownList>
        
<asp:Button ID="btnReport" runat="server" CssClass="btn-warning" Text="Generate Customer Report" OnClick="btnReport_Click" />
       
          <rsweb:ReportViewer ID="reportViewer1" runat="server" style="margin-left: 0px" Width="724px">
        </rsweb:ReportViewer>


</asp:Content>