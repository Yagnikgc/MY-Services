<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeedBack.aspx.cs" Inherits="MY_Service.Pages.FeedBack" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Feedback</title> <link rel="shortcut icon" href="../Images/My%20Service%20Logo.png" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--[if lte IE 8]><script src="js/ie/html5shiv.js"></script><![endif]-->
    <link rel="stylesheet" href="main.css" />
    <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
</head>
<body  style="background-color:lightgray">
    <a href="Home.aspx"><img id="logo" src="../Images/My%20Service%20Logo.png" height="80" width="130" alt="MY Service" /></a>
    <div id="page-wrapper">
        <!-- Main -->
        <article id="main">

            <header class="special container">
                <span class="icon" style="margin-top:-8%">
                    <b>
                        <h1 style="color:lightgray;font-size:40px;background-color:#1e5e66">
                            <!--[-->
                            Reviews<!--]--></h1></b>
                    <p><h2><b"><!--[-->!! How much you Like our Service !!<!--]--></b></h2></p>
                </span>
            </header>
            <br/>
            <!-- One -->
            <section class="wrapper style4 special container 75%" style="box-shadow:0 0 5px 5px;background-color:lightgray;margin-top:-5%">

                <!-- Content -->
                <div class="content">
                    <form runat="server">
                        <div class="row 50%">
                            <div class="6u 12u(mobile)">
                                <asp:TextBox ID="name" runat="server" type="text" name="name" placeholder="Name" />
                            </div>
                            <div class="6u 12u(mobile)">
                                <asp:TextBox ID="mail" runat="server" type="text" name="email" placeholder="Email" />
                                <asp:Label ID="err_mail" runat="server" />
                            </div>
                        </div>
                        <div class="row 50%">
                            <div class="12u">
                                <asp:TextBox ID="subject" runat="server" type="text" name="subject" placeholder="Subject" />
                            </div>
                        </div>
                        <div class="row 50%">
                            <div class="12u">
                                <asp:TextBox ID="message" runat="server" name="message" placeholder="Message" rows="7" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="12u">
                                <ul class="buttons">
                                    <li>
                                        <asp:Button ID="submit" runat="server" type="submit" class="special" OnClick="submit_Click" Text="Send Message" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>

            </section>

        </article>
    </div>

    <!-- Scripts -->
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.dropotron.min.js"></script>
    <script src="js/jquery.scrolly.min.js"></script>
    <script src="js/jquery.scrollgress.min.js"></script>
    <script src="js/skel.min.js"></script>
    <script src="js/util.js"></script>
    <!--[if lte IE 8]><script src="js/ie/respond.min.js"></script><![endif]-->
    

</body>
</html>