<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="MY_Service.Pages.Customer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>MY Service</title><link rel="shortcut icon" href="../Images/My%20Service%20Logo.png" />
    <!-- Sliding Image Thumbnails -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="1/thumbnail-slider.css" rel="stylesheet" type="text/css" />
    <link href="1/thumbnail-slider1.css" rel="stylesheet" />
    <link href="1/thumbnail-slider2.css" rel="stylesheet" />
    <link href="1/thumbnail-slider3.css" rel="stylesheet" />
    <script src="1/thumbnail-slider.js" type="text/javascript"></script>
    <script src="1/thumbnail-slider1.js"></script>
    <script src="1/thumbnail-slider2.js"></script>
    <script src="1/thumbnail-slider3.js"></script>

    
    
    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../LogIn/css/style.css" />
    <link href="CSS_Home.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="../Slider/sliderengine/jquery.js"></script>
    <script src="../Slider/sliderengine/amazingslider.js"></script>
    <link rel="stylesheet" type="text/css" href="../Slider/sliderengine/amazingslider-1.css" />
    <script src="../Slider/sliderengine/initslider-1.js"></script>
    
    <script>
        function myFunction() {
            $(sessionStorage["UNAME"] == "")
            location.replace("../Pages/Home.aspx");

        }
    </script>

    <script type="text/javascript">
        function pop(div) {
            document.getElementById(div).style.display = 'block';
        }
    </script>
</head>
<body>
     
    <nav class="navbar navbar-default">
        <div class="container-fluid" style="background-color: lightgray;">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="Home.aspx">
                    <img id="logo" src="../Images/My Service Logo.png" height="80" alt="MY Service" /></a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right" style="font-size: 18px; padding-top: 15px;">
                    <li><a href="FeedBack.aspx" target="_blank">Add Review<span class="sr-only">(current)</span></a></li>
                    <li><a href="How It Works.aspx" target="_blank">How It Works</a></li>
                    <li><a href="AboutUs.aspx" target="_blank">About Us</a></li>
                    <li><a href="Manage%20Service.aspx">Track Service</a></li>
                    <li><a ><asp:Label ID="Uname" runat="server"></asp:Label></a></li>
                    <li style="padding-top:2%"><asp:Label ID="lbl_logout" runat="server" onclick="myFunction()" Style="cursor:pointer">Logout</asp:Label></li>
                </ul>
            </div>
        </div>
        <div id="amazingslider-wrapper-1" style="display: block; position: relative; max-width: 1366px; top: 0">
            <div id="amazingslider-1" style="display: block; position: relative;">
                <ul class="amazingslider-slides" style="display: none;">
                    <li>
                        <img src="../Slider/images/arc.jpg" alt="arc" title="arc" />
                    </li>
                    <li>
                        <img src="../Slider/images/Img3.jpg" alt="Img3" title="Img3" />
                    </li>
                    <li>
                        <img src="../Slider/images/Img4.jpg" alt="Img4" title="Img4" />
                    </li>
                    <li>
                        <img src="../Slider/images/mix.jpg" alt="mix" title="mix" />
                    </li>
                    <li>
                        <img src="../Slider/images/Untitled-1.jpg" alt="Untitled-1" title="Untitled-1" />
                    </li>
                    <li>
                        <img src="../Slider/images/Untitled-1dasd.jpg" alt="Untitled-1dasd" title="Untitled-1dasd" />
                    </li>
                    <li>
                        <img src="../Slider/images/Untitled-2.jpg" alt="Slides for site" title="Slides for site" />
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <form runat="server">
        <div class="zoomin">
            <asp:Repeater ID="category" runat="server">
                <ItemTemplate>
                    <span style="display: inline-block; list-style: none;">
                        <asp:LinkButton ID="lb_catName" runat="server" ForeColor="Black" Font-Bold="true" OnClick="categoryName_Click" Font-Underline="false">
                            <li>
                                <asp:Label ID="lblsubCatId" runat="server" Text='<%# Eval("Id") %>' Visible="false" />
                                <asp:Image AlternateText="categoryImage" CssClass="zoomin img" ID="categoryImage" runat="server" ImageUrl='<%# "~/Images/Category/"+System.Convert.ToString(Eval("Image")) %>' />
                            </li>
                            <li>
                                <%#Eval("Name") %>
                            </li>
                        </asp:LinkButton>
                    </span>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
    <div id="subCatDiv" class="w3-modal w3-animate-zoom">
        <div class="w3-modal-content" style="overflow-x: auto;overflow-y:auto">
            <header class="w3-teal" style="margin-bottom:5px;">
                <h3 class="headBar">Select Your Service</h3>
            </header>
            <div style="height: 450px;">
                <asp:Repeater ID="subcategory" runat="server">
                    <ItemTemplate>
                        <span style="list-style: none;">
                            <li style="height: 40px; padding: 0 0 20px 20px">
                                <asp:Image AlternateText="categoryImage" Style="height: 30px; width: 30px;" ID="subCategoryImage" runat="server" ImageUrl='<%# "~/Images/subCategory/"+System.Convert.ToString(Eval("Image")) %>' />
                                <a class="SubCatName" href="#" target="_blank"><%#Eval("Name") %></a>
                            </li>
                        </span>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <br />
    <!--start  Recommanded Services-->
    <div style="max-width: 1300px; margin: 0 auto; padding: 15px 0;">
        <h2 style="font-weight: bold">Recommanded Services</h2>
        <br />
        <div style="float: left;">
            <div id="thumbnail-slider">
                <div class="inner">
                    <ul>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank">
                                <span class="thumb" title="LIVE MUSICIAL" style="background-image: url(img/Live%20Musician.jpg)"></span>
                            </a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="ARCHITECT" style="background-image: url(img/Architect.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="PARTY MACKUP ARTIST" style="background-image: url(img/Party%20Mackup%20Artist.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="YOGA TRAINER AT HOME" style="background-image: url(img/Yoga%20Trainer%20at%20Home.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="SPA AT HOME" style="background-image: url(img/Spa%20at%20Home.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="BIRTHDAY PARTY PLANER" style="background-image: url(img/Birthday%20Party%20Planer.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="CONSTRUCTION & RENOVATION" style="background-image: url(img/Construction%20&%20Renovation.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="DJ" style="background-image: url(img/DJ.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="HomeCleaning.aspx" target="_blank"><span class="thumb" title="HOME CLEANING" style="background-image: url(img/Full%20Home%20Cleaning.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="HOME TUTOR" style="background-image: url(img/Home%20Tutor.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="INTERIOR DESIGNER" style="background-image: url(img/Interior%20Designer.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="PACKERS & MOVERS" style="background-image: url(img/Packers%20&%20Movers.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="METROMONIAL SERVICES" style="background-image: url(img/Metromonial%20Services.png)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="SALON AT HOME" style="background-image: url(img/Salon%20at%20Home.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="WEB DESIGNER & DEVELOPER" style="background-image: url(img/Web%20Designer%20&%20Developer.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="WEDDING FLORISTS & DECORATORS" style="background-image: url(img/Wedding%20Florists%20&%20Decorators.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="WEDDING PHOTOGRAPHER" style="background-image: url(img/Wedding%20Photographer.jpeg)"></span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--end-->
    <br /><br /><br /><br /><br /><br /><br />
    <!--start  Home Cleaning & Care-->
    <div style="max-width: 1300px; margin: 0 auto; padding: 15px 0;">
        <h2 style="font-weight: bold">Home Cleaning & Care</h2>
        <br />
        <div style="float: left;">
            <div id="thumbnail-slider1">
                <div class="inner">
                    <ul>
                        <li>
                            <a href="HomeCleaning.aspx" target="_blank">
                                <span class="thumb" title="FULL HOME CLEANING" style="background-image: url(img/Full%20Home%20Cleaning.jpg)"></span>
                            </a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="BATHROOM CLEANING" style="background-image: url(img/Bathroom%20Cleaning.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="KITCHEN CLEANING" style="background-image: url(img/Kitchen%20Cleaning.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="SOFA CLEANING" style="background-image: url(img/Sofa%20Clening.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="CARPET CLEAING" style="background-image: url(img/Carpet%20Cleaning.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="PEST CONTROL" style="background-image: url(img/Pest%20Control.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="CONSTRUCTION & RENOVATION" style="background-image: url(img/Construction%20&%20Renovation.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="HOUSE PAINTRES" style="background-image: url(img/House%20Painters.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="INTERIOR DESIGNER" style="background-image: url(img/Interior%20Designer.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="PLUMBER" style="background-image: url(img/Plumber.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="PACKERS & MOVERS" style="background-image: url(img/Packers%20&%20Movers.jpg)"></span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--end-->
    <br /><br /><br /><br /><br /><br />
    <!--start  Wedding Services-->
    <div style="max-width: 1300px; margin: 0 auto; padding: 15px 0;">
        <h2 style="font-weight: bold">Wedding Services</h2>
        <br />
        <div style="float: left;">
            <div id="thumbnail-slider2">
                <div class="inner">
                    <ul>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank">
                                <span class="thumb" title="WEDDING PHOTOGRAPHER" style="background-image: url(img/Wedding%20Photographer.jpeg)"></span>
                            </a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="BRIDAL MACKUP ARTIST" style="background-image: url(img/BridalMackupArtist.png)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="PRE-WEDDING SHOOT" style="background-image: url(img/Pre-Wedding%20Shoot.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="WEDDING PLANER" style="background-image: url(img/WeddingPlaner.png)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="WEDDING FLORISTS & DECORATORS" style="background-image: url(img/Wedding%20Florists%20&%20Decorators.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="WEDDING CHOREOGRAPHER" style="background-image: url(img/Wedding%20Choreographer.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="WEDDING CATERERES" style="background-image: url(img/Wedding%20Caterers.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="LIVE MUSICIAN" style="background-image: url(img/Live%20Musician.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="DJ" style="background-image: url(img/DJ.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="BARTENDER" style="background-image: url(img/Bartender.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="MEHENDI ARTISTS" style="background-image: url(img/Mehendi%20Artists.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="METROMONIAL SERVICES" style="background-image: url(img/Metromonial%20Services.png)"></span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--end-->
    <br /><br /><br /><br /><br /><br />
    <!--start  Wedding Ideas & Photos-->
    <div style="max-width: 1300px; margin: 0 auto; padding: 15px 0;">
        <h2 style="font-weight: bold">Weddings - Ideas & Photos</h2>
        <br />
        <div style="float: left;">
            <div id="thumbnail-slider3">
                <div class="inner">
                    <ul>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="CANDID WEDDING PHOTOGRAPHY" style="background-image: url(img/CandidWeddingPhotography.jpeg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="PRE-WEDDING PHOTOGRAPHY" style="background-image: url(img/Pre-WeddingPhotograthy.JPG)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="TRADITIONAL PHOTOGRAPHY" style="background-image: url(img/TraditionalPhotography.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="SOUTH INDIAN WEDDING PHOTOGRAPHY" style="background-image: url(img/SouthIndianWeddingPhotography.jpeg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="HD MACKUP IDEAS" style="background-image: url(img/HDMackupIdeas.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="AIR BRUSH MACKUP PHOTOS" style="background-image: url(img/AirBrushMackupIdeas.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="DULHAN MACKUP PHOTOS" style="background-image: url(img/DulhanMackupPhotos.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="MEHENDI DESIGN IDEAS" style="background-image: url(img/MehendiDesignIdeas.jpg)"></span></a>
                        </li>
                        <li>
                            <a href="workInUnderProcess.aspx" target="_blank"><span class="thumb" title="METROMONIAL SERVICES" style="background-image: url(img/Metromonial%20Services.png)"></span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--end-->
    <br /><br /><br /><br /><br /><br /><br /><br /><br />
    <center>
    <div style="border:1.5px solid #1e5e66;margin-left:8px;margin-right:8px;border-radius:8px;overflow-x:auto;">
        <h1><b>* REVIEWS   FROM   CUSTOMER *</b></h1>
        <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
                <table><tr><th>Reviewer</th><th>Review On</th><th>Reviews</th></tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><img src="../Images/User.png" style="width:20%" /><asp:Label ID="lblName" CssClass="lbl_category" runat="server" Text='<%# Eval("name") %>' /></td>
                    <td><asp:Label ID="lblSubject" CssClass="lbl_category" runat="server" Text='<%# Eval("Subject") %>' /></td>
                    <td><asp:Label ID="lblMessage" CssClass="lbl_category" runat="server" Text='<%# Eval("Message") %>' /></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <br />
    </div><br />
        </center>
    <div class="control-label">
            <img src="../Images/Division 3.png" class="img-thumbnail" alt="Cinque Terre" style="width:100%" /> 
    </div>
    <div class="control-label" style="width: 100%">
        <div style="background-color:lightgray">
            <center>
            <a href="#"><img id="Img1"  class="container-fluid" src="../Images/My Service Logo.png" alt="MY Service" style="padding-top:2%;min-width:250px;width:20%" /></a> <br />
            <a href="https://www.facebook.com/MY-Services-302474940261982/" target="_blank"><img id="fb" class="container-fluid" src="../Images/facebook.png" alt="Facebook" style="padding-top:2%;width:5%;min-width:70px;left:-10%" /></a>
             <a href="https://www.instagram.com/myservices121/" target="_blank"><img id="Insta"  class="container-fluid" src="../Images/instagram.png" alt="Instagram" style="padding-top:2%;min-width:70px;width:5%" /></a>
                <a href="https://plus.google.com/u/0/115812196995361299915" target="_blank"><img id="g+" class="container-fluid" src="../Images/google-plus.png" alt="Google plus" style="padding-top:2%;width:5%;min-width:70px;right:-10%" /></a><br /><br />
                <h2 style="color:#1e5e66">&copy; 2017 My Services </h2>
                    </center>
        </div>
    </div>
    </div>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>
    <script>
        var modal = document.getElementById('subCatDiv');
        window.onclick = function (event) {
            if (event.target == modal) { modal.style.display = "none"; }
        }
    </script>
</body>
</html>
