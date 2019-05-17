<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Provider.aspx.cs" Inherits="MY_Service.Pages.Provider" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="../Providers%20material/js/bootstrap.min.js"></script>
    <script src="../Providers%20material/js/jquery-1.11.1.min.js"></script>

    <script src="../Providers%20material/js/main.js"></script>
    <script src="../Providers%20material/js/owl.carousel.min.js"></script>
    
    <script src="../Providers%20material/js/typed.js"></script>
    <script src="../Providers%20material/js/typewriter.js"></script>
  
    <script>
        function myFunction() {
            $(sessionStorage["UNAME"] = "")
            location.replace("../Pages/Home.aspx");
 }
    </script>
     
<title></title>
  
    <link href="../Providers%20material/css/cardio.css" rel="stylesheet" />
</head>
<body style="background-color:lightgray">
    <form id="form1" runat="server">
        <div>
            <ul style="list-style:none">
            <a href="Home.aspx"><img id="logo" src="../Images/My%20Service%20Logo.png" height="80" width="130" alt="MY Service" /></a>
            <ul style="color:#1e5e66;text-align:right;font-size:25px">Welcome -
                <asp:Label ID="Uname" Font-Bold="true" runat="server" style="color:#1e5e66"></asp:Label>
                    <asp:Label ID="lbl_logout" runat="server" onclick="myFunction()" Style="cursor:pointer">Logout</asp:Label></ul>
                </ul>
                <hr />
            <%--<div style="padding-left:88%" >
            <asp:Button ID="btn_update" runat="server" Text="Update Service" Style=" border-color:#1e5e66;border-width:10px;border-bottom-left-radius:20px;border-top-right-radius:20px;font-size:15px;box-shadow:0 0 2px 2px;height:50px;width:150px" />
                </div>--%>
            <center>

                
            <div class="container">
                <div class="header-text">
                    <div class="row">
						<div class="col-md-12 text-center">
							<h3 class="white typed" style="color:#1e5e66">Register Your Service Now !!!!!</h3>
						</div>
					</div>
				</div>
			</div>



                <asp:Label ID="stats" runat="server" ForeColor="Red"></asp:Label><br />
             <ul style="list-style:none">
                 <li >
               <h5>Provider / company name : </h5>
                     </li>
                 <li>
               <asp:TextBox ID="prov_name" runat="server" style="height:30px;width:20%;border-radius:20px;text-align:center;font-size:20px"/><br /><br />
                     </li>
                 <li>
              <h5> address :</h5>
                     </li>
                 <li>
                      <asp:TextBox ID="prov_address" runat="server" style="height:30px;width:20%;text-align:center;border-radius:20px;font-size:20px"/><br /><br />
                     </li>
                 <li>
           <h5> Category :</h5>
                     </li>
                 <li>
                      <asp:DropDownList ID="category" OnSelectedIndexChanged="category_SelectedIndexChanged" style="height:30px;width:20%;text-align-last:center;border-radius:20px;font-size:20px" AutoPostBack="true" runat="server">
                <asp:ListItem Value="0">Choose Category</asp:ListItem>
            </asp:DropDownList><br /><br />
                     </li>
                 <li>
           <h5> Sub-Category :</h5>
                  </li>
                 <li>
                     <asp:DropDownList ID="subCategory" runat="server" style="height:30px;width:20%;border-radius:20px;font-size:20px;text-align-last:center">
                <asp:ListItem Value="0">Choose Sub-Category</asp:ListItem>
            </asp:DropDownList><br /><br />
                     </li>
                 <li>
                     <asp:Button ID="btn_apply" runat="server" Text="Apply Service" OnClick="btn_apply_Click" Style=" border-color:#1e5e66;border-width:10px;border-bottom-left-radius:20px;border-top-right-radius:20px;font-size:15px;box-shadow:0 0 2px 2px;height:50px;width:130px"/></center>
                 </li>
           
        </div>
    </form>
</body>
</html>
