<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="MY_Service.Pages.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Log In</title>
    <link rel="stylesheet" href="../login-form/css/style.css"/>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script type="text/javascript">
            function wrong_input() {
                $('.log-status').addClass('wrong-entry');
                $('.alert').fadeIn(500);
                setTimeout("$('.alert').fadeOut(1500);", 3000);
            };
            $(document).ready(function () {
                $('.form-control').keypress(function () {
                    $('.log-status').removeClass('wrong-entry');
                });
            });
    </script>
</head>
<body>
    <form runat="server">
    <div class="login-form">
        <a class="link" href="Registration.aspx">New User ?</a>
     <center><a href="Home.aspx"><img id="logo" src="../Images/My Service Logo.png" height="80"  alt="MY Service" /></a></center>
     <h1>Welcome to</h1>
     <h1>MY Services</h1>
     <div class="form-group log-status">
       <input type="text" name="email" class="form-control" placeholder="E-Mail ID " id="UserName"/>
       <i class="fa fa-user"></i>
     </div>
     <div class="form-group log-status">
       <input type="password" name="pwd" class="form-control" placeholder="Password" id="Passwod"/>
       <i class="fa fa-lock"></i>
     </div>
      <span class="alert">Invalid Credentials</span>
      <a class="link" href="genaratePassword.aspx">Lost your password ?</a>
     <asp:Button runat="server" ID="btn_submit" type="submit" class="log-btn" Text="Log In" OnClick="btn_submit_Click" />
   </div>
        </form>        
</body>
</html>
