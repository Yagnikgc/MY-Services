<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="genaratePassword.aspx.cs" Inherits="MY_Service.Pages.genaratePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
   
    <link href="../login-form/css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-form">
            <center><a href="Home.aspx"><img id="logo" src="../Images/My Service Logo.png" height="80"  alt="MY Service" /></a></center>
            <h1>Generate Password</h1>
            <div id="divMail" runat="server">
                <div class="form-group ">
                    <asp:Label ID="lbl_invlidemail" Text="<br><br>" runat="server" style="color:red;font-family:'Lucida Console';font-size:smaller" />
                    <asp:TextBox ID="txt_email" runat="server" class="form-control" placeholder="E-Mail ID " /><br /><br />
                <asp:Button runat="server" ID="btn_submit" class="log-btn" Text="Send OTP" OnClick="btn_submit_Click" /></div>
            </div>
            <div id="divOtp" runat="server">
                <asp:Label ID="lbl" runat="server">Enter the Sequrity Code sent to :</asp:Label><br /><br />
                <asp:TextBox ID="txt_otpmail" CssClass="form-control" Enabled="false" runat="server" /><br />
                <asp:Label ID="lbl_invalidotp" Text="" ForeColor="Red" runat="server" /><br />
                <asp:TextBox ID="txt_cus_OTP" CssClass="form-control" runat="server" placeholder="Enter OTP" MaxLength="6"></asp:TextBox>
                <asp:Label ID="lbl_invaldpass" Text="<br><br>" runat="server" style="color:red;font-family:'Lucida Console';font-size:smaller" />
                <asp:TextBox ID="txt_password" CssClass="form-control" TextMode="Password" runat="server" placeholder="Enter password" />
                <asp:Label ID="lbl_invalidconfi" Text="<br><br>" runat="server" style="color:red;font-family:'Lucida Console';font-size:smaller" />
                <asp:TextBox ID="txt_confirmpass" CssClass="form-control" runat="server" TextMode="Password" placeholder="Re-enter password" /><br />
                <asp:LinkButton ID="resend_otp" runat="server" Style="float: right; color: #0a5055; font-weight: bold; font-size: small" Font-Underline="false" Text="Resend OTP" OnClick="resend_otp_Click" />
                <asp:Button runat="server" ID="btn_passwd" class="log-btn" Text="Change Password" OnClick="btn_passwd_Click" />
            </div>
        </div>
    </form>
</body>
</html>