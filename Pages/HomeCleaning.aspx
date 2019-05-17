<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeCleaning.aspx.cs" Inherits="MY_Service.Pages.HomeCleaning" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <script src="../About%20us%20material/js/bootstrap.js"></script>
    <script src="../About%20us%20material/js/bootstrap.min.js"></script>
    <script src="../About%20us%20material/js/html5lightbox.js"></script>
    <script src="../About%20us%20material/js/jquery-1.11.3.min.js"></script>
    <script src="../About%20us%20material/js/jquery.counterup.min.js"></script>
    <script src="../About%20us%20material/js/jquery.mixitup.js"></script>
    <script src="../About%20us%20material/js/jquery.nav.js"></script>
    <script src="../About%20us%20material/js/jquery.scrollUp.js"></script>
    <script src="../About%20us%20material/js/jquery.sticky.js"></script>
    <script src="../About%20us%20material/js/lightbox.js"></script>
    <script src="../About%20us%20material/js/main.js"></script>
    <script src="../About%20us%20material/js/owl.carousel.min.js"></script>
    <script src="../About%20us%20material/js/waypoints.min.js"></script>
    <script src="../About%20us%20material/js/wow.min.js"></script>



    <title>Home Cleaning</title>
    <link rel="shortcut icon" href="../Images/My Service Logo.png" />
    <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <link href="../About%20us%20material/css/animate.min.css" rel="stylesheet" />
    <link href="../About%20us%20material/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../About%20us%20material/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../About%20us%20material/css/icon.css" rel="stylesheet" />
    <link href="../About%20us%20material/css/image.css" rel="stylesheet" />
    <link href="../About%20us%20material/css/lightbox.css" rel="stylesheet" />
    <link href="../About%20us%20material/css/owl.carousel.css" rel="stylesheet" />
    <link href="../About%20us%20material/css/owl.transitions.css" rel="stylesheet" />
    <link href="../About%20us%20material/css/preloader.css" rel="stylesheet" />
    <link href="../About%20us%20material/css/responsive.css" rel="stylesheet" />
    <link href="../About%20us%20material/css/style.css" rel="stylesheet" />
    <link href="../About%20us%20material/css/tab.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" method="post" runat="server">
        <div style="background-color: lightgray">
            
         <div style="list-style:none"><li>
        <a href="Customer.aspx">
            <img id="logo" src="../Images/My Service Logo.png" height="80" style="padding:15px" alt="MY Service" /></a></li>
        <li style="text-align:right;margin-top:-20px;margin-right:20px;color:#1e5e66">
        <a href="Customer.aspx" style="font-size:20px;text-decoration:none;color:#1e5e66;margin-right:10px;">Home</a>
            <asp:Label ID="Uname" runat="server" style="font-weight:bold;margin-right:20px;font-size:20px"></asp:Label>
        </li>
        <br />
        </div>
            <center>
          <div style="background-color:#1e5e66"><br /> <h1 style="color:lightgray">HOME CLEANING</h1><hr /></div>
            <section id="team">
			<div class="container">
				<div class="row">
					<div class="title">
						<h2>Select Your package</h2>
						<p>Enjoy your Service<br>By Sitting at home</p>
					</div>
					<div class="col-md-3 col-sm-4 col-xs-5">
						<div class="block wow fadeInLeft" data-wow-delay=".3s">
							<img src="../About%20us%20material/img/service%20package.png" alt="package 1 image"/>
							<div class="team-overlay">
                                 <b>Package : 10,000/-</b>
								<p>Number of Rooms : 2<br />Include Washroom : Yes<br />Include Hall & Kitchen : Yes</p>
							</div>
                            <h3>Package : 10,000</h3>
						</div>
					</div>
					<div class="col-md-3  col-sm-4 col-xs-5">
						<div class="block wow fadeInLeft" data-wow-delay=".6s">
							<img src="../About%20us%20material/img/service%20package.png" alt="package 2 image"/>
							<div class="team-overlay">
								<b>Package : 20,000/-</b>
								<p>Number of Rooms : 4<br />Include Washroom : Yes<br />Include Hall & Kitchen : Yes<br />Include Parking : Yes</p>
							</div>
                            <h3>Package : 20,000</h3>
						</div>
					</div>
					<div class="col-md-3  col-sm-4 col-xs-5">
						<div class="block wow fadeInLeft" data-wow-delay=".9s">
							<img src="../About%20us%20material/img/service%20package.png" alt="package 3 image"/>
							<div class="team-overlay" style="padding-top:20px">
								<b>Package : 30,000/-</b>
								<p>Number of Rooms : 6<br />Include Washroom : Yes<br />Include Hall & Kitchen : Yes<br />Include Parking : Yes<br />Include Garden + Backyard : Yes</p>
							</div>
                            <h3>Package : 30,000</h3>
						</div>
					</div>
                    <div class="col-md-3  col-sm-4 col-xs-5">
						<div class="block wow fadeInLeft" data-wow-delay=".9s">
							<img src="../About%20us%20material/img/service%20package.png" alt="Custome package"/>
							<div class="team-overlay">
								<b>Package : Custom</b>
								<p>Charges depends on your required Service<br />According to Service Provider</p>
							</div>
                            <h3>Package : Custom</h3>
						</div>
					</div>
				</div>
			</div>
		</section>
            <h2 style="color:#1e5e66">Choose Package : </h2><br />
                <asp:DropDownList ID="package" runat="server" style="height:30px;width:20%;border-radius:20px;text-align-last:center" AutoPostBack="true" OnSelectedIndexChanged="package_SelectedIndexChanged">
                <asp:ListItem Value="0">Choose Package</asp:ListItem>
                <asp:ListItem Value="1">RS. 10,000/-</asp:ListItem>
                <asp:ListItem Value="2">RS. 20,000/-</asp:ListItem>
                <asp:ListItem Value="3">RS. 30,000/-</asp:ListItem>
                <asp:ListItem Value="4">!! Custome !!</asp:ListItem>
            </asp:DropDownList><br />
            <asp:Label ID="packageDes" runat="server" /><br /><br />
            <h2 style="color:#1e5e66"> Address : </h2><br /><asp:TextBox ID="address" runat="server" Rows="6" TextMode="MultiLine" Style="width:30%;border-color:#1e5e66;border-width:20px;border-bottom-left-radius:20px;border-top-right-radius:20px;font-size:30px" /><br />
            <asp:Label ID="err_address"  runat="server" style="color:red" /><br />
            <h1 style="color:#1e5e66">Service Date :</h1><br />
            <asp:Calendar ID="srdt" runat="server" Style="background-color:#1e5e66;box-shadow:0 0 5px 5px; height:30% ;width:30%"/><br />
                <asp:Label  ID="err_date" runat="server" Style="color:red"/><br/>
            <br /><asp:Button ID="Submit" runat="server" Text="Get Service" OnClick="Submit_Click" Style="border-color:#1e5e66;border-width:10px;border-bottom-left-radius:20px;border-top-right-radius:20px;font-size:15px;box-shadow:0 0 2px 2px;height:50px;width:130px" /><br /><br />
        </center>
        </div>
    </form>
</body>
</html>
