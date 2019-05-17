<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="How It Works.aspx.cs" Inherits="MY_Service.Pages.How_It_Works" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/Custom-cs.css" rel="stylesheet" />
    <link href="Howitworks_style%20sheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container" style="width: 100%">
            <div class="div1">
                <a href="Home.aspx"><img src="../Images/My Service Logo.png" style="height: 100px; padding-top: 1%" /></a>
                <center class="font_effect" style="margin-top:20px">
        <h1 >How <asp:LinkButton ID="lnkbtn" class="linkforecolor" runat="server" Text="My Service" Font-Underline="false" /> Works ..?</h1><br />
                </center>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
    <div class="col-sm-9 col-md-6 col-lg-8" ">
                    <div style="padding-top: 4%;padding-left:4%" >
                        <img src="../Images/pins.png" class="img-rounded" alt="pin1" width="60" height="80" "/>
                        <h2 style="color: #1e5e66; padding-left: 15%; margin-top: 3px">Select Catagory and choose appropriate service.</h2>
                        <img src="../Images/pins.png" class="img-rounded" alt="pin1" width="60" height="80"/>
                        <h2 style="color: #1e5e66; padding-left: 15%;  margin-top: 6px">Fill details as per your requirements.</h2>
                        <img src="../Images/pins.png" class="img-rounded" alt="pin1" width="60" height="80"/>
                        <h2 style="color: #1e5e66; padding-left: 15%; margin-top: 1px">Select Date and venue..</h2>
                        <img src="../Images/sit back relax.png" class="img-rounded" alt="pin1" width="60" height="80"/>
                        <h2 style="color: #1e5e66; padding-left: 15%; margin-top: -10px">Sit Back Relax </h2>
                    </div>
                </div>
    <div class="col-sm-9 col-md-6 col-lg-4" >
                        <asp:Image ID="gif" runat="server" ImageUrl="../Images/giphy-downsized.gif" Style="Width: 100%;padding-top:30%" />
                        </div>
                </div>
           
        </div>
        <div class="control-label">
            <img src="../Images/Division 3.png" class="img-thumbnail" alt="Cinque Terre" style="width:100%" /> 
    </div>
    <div class="control-label" style="width: 100%">
        <div style="background-color:lightgray">
            <center>
            <a href="Home.aspx"><img id="Img1"  class="container-fluid" src="../Images/My Service Logo.png" alt="MY Service" style="padding-top:2%;min-width:250px;width:20%" /></a> <br />
            <a href="https://www.facebook.com/MY-Services-302474940261982/" target="_blank"><img id="fb" class="container-fluid" src="../Images/facebook.png" alt="Facebook" style="padding-top:2%;width:5%;min-width:70px;left:-10%" /></a>
             <a href="https://www.instagram.com/myservices121/" target="_blank"><img id="Insta"  class="container-fluid" src="../Images/instagram.png" alt="Instagram" style="padding-top:2%;min-width:70px;width:5%" /></a>
                <a href="https://plus.google.com/u/0/115812196995361299915" target="_blank"><img id="g+" class="container-fluid" src="../Images/google-plus.png" alt="Google plus" style="padding-top:2%;width:5%;min-width:70px;right:-10%" /></a><br /><br />
                <h2 style="color:#1e5e66">&copy; 2017 My Services </h2>
                    </center>
        </div>
    </div>
    </form>
</body>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</html>