<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="MY_Service.Admin.Admin" %>

<!DOCTYPE html>

<html lang="en" class="no-js" xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,700' rel='stylesheet' type='text/css' />
	<link rel="stylesheet" href="css/reset.css" /> <!-- CSS reset -->
    
	<link rel="stylesheet" href="css/style.css" /> <!-- Resource style -->
	<script src="js/modernizr.js"></script> <!-- Modernizr -->
    
   
	<title>Admin</title>
    
    <script src="../login-form/js/jquery-3.2.1.min.js"></script>
    <script src="js/content.js"></script>
    <script>
        function myFunction() {
            $(sessionStorage["UNAME"] == "")
            location.replace("../Pages/Home.aspx");
        }
    </script>
</head>
<body>
	<header class="cd-main-header"style="background-color:lightgray">
		<a href="../Pages/Home.aspx" class="cd-logo" target="_parent"><img src="../Images/My Service Logo.png" height="50" alt="Logo" /></a
		<nav class="cd-nav">
			<ul class="cd-top-nav" style="text-align:right">
				<li><a href="../Pages/The%20Team.aspx" target="frameId">Support</a></li>
				<li class="has-children account">
					<a ><asp:Label ID="Uname" runat="server"></asp:Label>
						<img src="img/white user.png" alt="avatar" />
						<li>
                <asp:Label ID="lbl_logout" runat="server" onclick="myFunction()" Style="padding-top: 10px;cursor:pointer">Logout</asp:Label></ li>
					</a>
				</li>
			</ul>
		</nav>
	</header> <!-- .cd-main-header -->

	<main class="cd-main-content">
		<nav class="cd-side-nav">
			<ul>
				<li class="cd-label ">Main Menu</li>
				<li class="has-children overview">
					<a href="../Pages/workInUnderProcess.aspx" target="frameId" class="overview">Overview</a>
                    <%--<ul>
						<li><a href="../Pages/workInUnderProcess.aspx" target="frameId">All Data</a></li>
						<li><a href="../Pages/workInUnderProcess.aspx" target="frameId">Category 1</a></li>
						<li><a href="../Pages/workInUnderProcess.aspx" target="frameId">Category 2</a></li>
					</ul>--%>
				</li>
				<li class="has-children notifications">
					<a href="../Pages/workInUnderProcess.aspx" target="frameId">Notifications</a>
					
					<%--<ul>
						<li><a href="../Pages/workInUnderProcess.aspx" target="frameId">All Notifications</a></li>
						<li><a href="../Pages/workInUnderProcess.aspx" target="frameId">Friends</a></li>
						<li><a href="../Pages/workInUnderProcess.aspx" target="frameId">Other</a></li>
					</ul>--%>
				</li>

				<li class="has-children comments">
					<a href="Reviews.aspx" target="frameId">Comments</a>
				</li>
			</ul>

			<ul>
				<li class="cd-label">Details</li>
				<li class="has-children bookmarks">
					<a href="Category.aspx" target="frameId">Categories</a>
				</li>
				<li class="has-children images">
					<a href="../Pages/workInUnderProcess.aspx" target="frameId">Images</a>
					
					<%--<ul>
						<li><a href="../Pages/workInUnderProcess.aspx" target="frameId">All Images</a></li>
						<li><a href="../Pages/workInUnderProcess.aspx" target="frameId">Edit Image</a></li>
					</ul>--%>
				</li>

				<li class="has-children users">
					<a href="userData.aspx" target="frameId">Users</a>
					
					<ul>
						<li><a href="userData.aspx" target="frameId">All Users</a></li>
						<li><a href="viewCustomers.aspx" target="frameId">Customers</a></li>
						<li><a href="viewProvider.aspx" target="frameId">Provides</a></li>
					</ul>
				</li>
			</ul>

<%--			<ul>
				<li class="cd-label">Action</li>
				<li class="action-btn"><a href="../Pages/workInUnderProcess.aspx" target="frameId">+ Button</a></li>
			</ul>--%>
		</nav>

		<div id="content" class="content-wrapper">
            
			<iframe id="frameId" name="framId" style="width:100%;height:600px;display:block;overflow:hidden" ></iframe>

		</div> <!-- .content-wrapper -->
	</main> <!-- .cd-main-content -->
<script src="js/jquery-2.1.4.js"></script>
<script src="js/jquery.menu-aim.js"></script>
<script src="js/main.js"></script> <!-- Resource jQuery -->
</body>
</html>