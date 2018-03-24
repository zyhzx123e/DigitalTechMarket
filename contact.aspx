<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="digitTech.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="shortcut icon" href="img/myDigitalDevices.ico">
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="stylesheet" type="text/css" href="css/1.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Image ID="Image1" runat="server" ImageUrl="~/img/sunset.jpg" 
            Width="192px" />
    <h1> Contact us if you are facing any problem regarding the DigitalTech shopping services and give us feedback for the effectiveness.
</h1>
 
    <!-- -->
     <br><hr><br>
		  <div id="contentleft">
		  <form action="index.html" method="get">
			<ul>
			  <li>
				<label for="name">Enter Your Name</label>
				<input id="name" name="name" runat="server"/>
				<label for="E-mail">Enter Your E-mail</label>
				<input id="email" name="E-mail" runat="server"/>
			  </li>
			
			  <li>
				<label for="comments">Question about DigitalTech ,We'll E-mail you back.</label>
				<textarea id="comments" runat="server" name="comments" rows="24" cols="60">Question about anything of DigitalTech...</textarea>
			  </li>
			   
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button runat="server" type="submit" CssClass="btn-info" Text="Submit" onclick="contact_info"  value="submit"/>

                  <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                
                  <a href="contact.aspx"></a>
			</ul>		  
		  </div>
		  <div id="contentright">
		  
		  
		  <form action="contact.aspx" method="get">
			<ul>
			  <li>
				<label style="color:white" for="css">Do You Like DigitalTech?</label>
				<input type="checkbox" value="Yes" name="Yes" id="Yes" />	
				
			  </li>
			  <br /><br />
			  <li style="font-family:Calibri; color:white">
				<label for="">Favorite brand?</label>
<style type="text/css">
    .RadioButtonList1 { list-style:none; margin: 0; padding: 0;}
    .RadioButtonList1.horizontal li { display: inline;}

    .RadioButtonList1 label{
        display:inline;
    }
</style>
                  <asp:RadioButtonList ID="RadioButtonList1" runat="server" Font-Names="Calibri">
                  
    <asp:ListItem Text ="Apple" Value="Apple" />
    <asp:ListItem Text ="Asus" Value="Asus" />
    <asp:ListItem Text ="Vertu" Value="Vertu" />
    <asp:ListItem Text ="Samsung" Value="Samsung" />

                      <asp:ListItem Text ="Huawei" Value="Huawei" />
    <asp:ListItem Text ="Lenovo" Value="Lenovo" />
    <asp:ListItem Text ="XiaoMi" Value="XiaoMi" />
    <asp:ListItem Text ="LG" Value="LG" />
                      <asp:ListItem Text ="Toshiba" Value="Toshiba" />
    <asp:ListItem Text ="Nokia" Value="Nokia" />
    <asp:ListItem Text ="Sony" Value="Sony" />
    <asp:ListItem Text ="Dell" Value="Dell" />

                  </asp:RadioButtonList>
			
			  </li><br /><br />
			  <li>
                 
                  <asp:Button runat="server" type="submit" CssClass="btn-info" Text="Submit" onclick="choose_info"  value="submit"/>

                  <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
			  </li>
			
               
                  <hr />
			  
			  <li style="font-size:15px" >
			   <h6 style="font-size:15px" style="color:white">Our cooperated Organization Shopping portal :</h6>
			   <br />
			   <div >
			   <p class="href1"><a href="http://www.taobao.com" target="_blank" style="color: #33FF00"> Tao Bao</a></p>
			   <p class="href"><a href="http://www.ebay.com" target="_blank" style="color: #33FF33">Ebay</a></p>
			   <p class="href3"><a href="http://www.mudah.com.my" target="_blank" style="color: #33FF66">Mudah</a></p>
			   <p class="href4"><a href="http://www.shop.com" target="_blank" style="color: #33FF99">shop.com</a></p>
			  
			   </div>
			  
			  
			  
			  
			  
			  </li>
			</ul>
		  </div>
		  
		  <br>
    <!---->
 

<b>Email us with comments about DigitalTech</b><br />
digitaltech.apu@gmail.com<br />


    <hr />
   Leader: Abdulaziz<br />
    Project Group Mates:<br/>
    <br/>Abdulaziz Fadhi Ahmed [TP035863]<br/>
    <br/> Khaled Mahmoud Arbab[TP037287]<br/>
    <br/> Walid Ramadan Adam[TP037689]<br/>
    <br/> Osamah Saeed Basaad[TP036528]<br/>
    
    <hr/>
   
     <br/>Asia Pacific University || UC2F1605IT<br/>
   DigitalTech &copy 2017 | All Rights Reserved


</asp:Content>

