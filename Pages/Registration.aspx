<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="MY_Service.Pages.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Registration</title>
    <link href="../login-form/css/RegStyle.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="popDivlogin" runat="server" class="login-form" >
            <center><a href="Home.aspx"><img id="Img1" src="../Images/My Service Logo.png"  style="padding-top:3%" height="80"  alt="MY Service" /></a></center>
            <h1>MY Services</h1>
            <asp:Label ID="lbl" runat="server">Enter the Sequrity Code sent to :</asp:Label>
            <asp:Label ID="pass_check" runat="server" Text="here" Visible="false"/>
            <br /><br /><center>
            <asp:Label ID="lbl_otpmail" CssClass="log-btn" Enabled="false" Text="" runat="server" /></center><br /><br />
            <asp:Label ID="lbl_invalidotp" Text="" ForeColor="Red" runat="server" />
            <asp:TextBox ID="txt_cus_OTP" CssClass="form-control" runat="server" placeholder="Enter OTP" MaxLength="6"></asp:TextBox><br />
            <br />
            <asp:LinkButton ID="resend_otp" runat="server" Style="float: right; color: #0a5055; font-weight: bold; font-size: small" Font-Underline="false" Text="Resend OTP" OnClick="resend_otp_Click" />
            <br />
            <br />
            <asp:Button ID="btn_register" CssClass="log-btn" runat="server" Text="Register" OnClick="btn_register_Click" /><br />
            <br />
        </div>
        <div id="login_form" runat="server" class="login-form" >
            <a class="link" href="LogIn.aspx">Already Registered ?</a>
            <center><a href="Home.aspx"><img id="logo" src="../Images/My Service Logo.png"  style="padding-top:3%" height="80"  alt="MY Service" /></a></center>
            <h1>Welcome to MY Services</h1>
            <div class="form-group">
                <asp:Label ID="lbl_invaliusername" Text="" runat="server" style="color:red;font-family:'Lucida Console';font-size:smaller" />
                <asp:TextBox ID="txt_name" CssClass="form-control" runat="server" placeholder="Enter Name" MaxLength="30" />
                <asp:Label ID="lbl_invalidmobile" Text="<br><br>" runat="server" style="color:red;font-family:'Lucida Console';font-size:smaller" />
                <asp:TextBox ID="txt_mobno" CssClass="form-control" runat="server" placeholder="Enter Mobile No." MaxLength="10" />
                <asp:Label ID="lbl_invlidemail" Text="<br><br>" runat="server" style="color:red;font-family:'Lucida Console';font-size:smaller" />
                <asp:TextBox ID="txt_email" CssClass="form-control" runat="server" placeholder="Enter E-mail" MaxLength="30" />
                <asp:Label ID="lbl_invaldpass" Text="<br><br>" runat="server" style="color:red;font-family:'Lucida Console';font-size:smaller" />
                <asp:TextBox ID="txt_password" CssClass="form-control" TextMode="Password" runat="server" placeholder="Enter password" />
                <asp:Label ID="lbl_invalidconfi" Text="<br><br>" runat="server" style="color:red;font-family:'Lucida Console';font-size:smaller" />
                <asp:TextBox ID="txt_confirmpass" CssClass="form-control" runat="server" TextMode="Password" placeholder="Re-enter password" />
                <div class="maxl">
                    <label class="radio inline">
                        <asp:RadioButton ID="customer" runat="server" GroupName="utype" Checked="true" />
                        <%--<input type="radio" id="rb_cust" name="utype" value="customer" checked="checked" />--%>
                        <span>Customer </span>
                    </label>
                    <label class="radio inline">
                        <asp:RadioButton ID="provider" runat="server" GroupName="utype" />
                        <%--<input type="radio" id="rb_pro" name="utype" value="provider" />--%>
                        <span>Provider </span>
                    </label>
                </div>
                <asp:Button ID="btn_getOTP" CssClass="log-btn" runat="server" Text="Register" OnClick="btn_getOTP_Click" />
            </div>
        </div>
    </form>
</body>
</html>