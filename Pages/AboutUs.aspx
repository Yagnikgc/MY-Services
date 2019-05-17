<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="MY_Service.Pages.AboutUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

    <meta charset="utf-8"/>
	
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<meta name="description" content=""/>
	<meta name="author" content=""/>
	
	
    
	<!-- CSS -->
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="css/flexslider.css" rel="stylesheet" type="text/css" />
	<link href="css/prettyPhoto.css" rel="stylesheet" type="text/css" />
	<link href="css/animate.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/owl.carousel.css" rel="stylesheet"/>
	<link href="css/style.css" rel="stylesheet" type="text/css" />

    

    <title>About Us</title> <link rel="shortcut icon" href="../Images/My%20Service%20Logo.png" />

    
    <script src="js/jquery.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/jquery.prettyPhoto.js" type="text/javascript"></script>
	<script src="js/jquery.nicescroll.min.js" type="text/javascript"></script>
	<script src="js/superfish.min.js" type="text/javascript"></script>
	<script src="js/jquery.flexslider-min.js" type="text/javascript"></script>
	<script src="js/owl.carousel.js" type="text/javascript"></script>
	<script src="js/animate.js" type="text/javascript"></script>
	<script src="js/jquery.BlackAndWhite.js"></script>
	<script src="js/myscript.js" type="text/javascript"></script>
    <style>
        table:hover,span:hover,h2:hover,h1:hover {
            color:#1e5e66;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <a href="Home.aspx"><img id="logo" src="../Images/My Service Logo.png" height="100" width="150" alt="MY Service" class="services_block padbot40" data-appear-top-offset="-200" data-animated="fadeInDown" /></a>
    <section id="about">
		<center>	
        <div style="width:80%">
               <center><h1> What is MY Services ?</h1></center><br/><br/>
              <h2 class="services_block padbot40" data-appear-top-offset="-200" data-animated="fadeInUp" style="font-family:Adobe Caslon Pro"> MY Services is recognized as the fastest growing startup in India. We are a mobile marketplace for local services. We help customers hire trusted professionals for all their service needs. We are staffed with young, passionate people working tirelessly to make a difference in the lives of people by catering to their service needs at their doorsteps. Be it getting a plumbing job done, improving your fitness through yoga, learning to play the guitar, decorating your home or getting candid photos of your wedding clicked, we are a sure shot destination for your service needs.</h2><br/><br/>
              </div></center>  
			<!-- SERVICES -->
			<div class="services_block padbot40" data-appear-top-offset="-200" data-animated="fadeInUp">
				<div>
                   <img id="Img1" src="img1\Success.jpg" style="width:100%" alt="MY Service" class="services_block padbot40" data-appear-top-offset="-200" data-animated="fadeInDown"" />
                    </div>
				<!-- CONTAINER -->
				<div class="container">
				
					<!-- ROW -->
					<div class="row">
						
						<div class="col-lg-4 col-md-12">
							<a class="services_item" href="javascript:void(0);" >
								<p><b>Handy</b> Service</p>
								<span>Quality and Easy to have service on your fingure tap.</span>
							</a>
						</div>
						<div class="col-lg-4 col-md-12 ">
							<a class="services_item" href="javascript:void(0);" >
								<p><b>Upadtes</b> on Reviews</p>
								<span>Updates are don in servies as per the customer convineance</span>
							</a>
						</div>
						<div class="col-lg-4 col-md-12">
							<a class="services_item" href="javascript:void(0);" >
								<p><b>Free</b>  Support</p>
								<span>Query...?<br/> not Fear to ask your query<br />myservice121@gmail.com</span>
							</a>
						</div>
					</div><!-- //ROW -->
				</div><!-- //CONTAINER -->
			</div><!-- //SERVICES -->
       
        <div class="cleancode_block">
				
				<!-- CONTAINER -->
				<div class="container" data-appear-top-offset="-200" data-animated="fadeInUp">
					 
					<!-- CASTOM TAB -->
					<div id="myTabContent" class="tab-content">
                        <h1 ><b>About MyServices</b></h1>
						<div class="tab-pane fade in active clearfix" id="tab1">
							<br />
                            <center><p class="title"><b>Services</b></p></center>
                               <center> <table style="font-size:x-large;text-align:center">
                                    <tr style="width:300px;height:50px">
                                        <td >
                                            Home Service
                                            </td>
                                        <td>
                                             Repairs
                                            </td>
                                        </tr>
                                    <tr style="width:300px;height:50px">
                                        <td>
                                             Event & Wedding
                                            </td>
                                        <td>
                                             Business Services
                                            </td>
                                        </tr>
                                     <tr style="width:300px;height:50px">
                                        <td>
                                             Personal & More
                                            </td>
                                        <td>
                                             Consultancy & Coaching
                                            </td>
                                        </tr>
                                     <tr style="width:300px;height:50px">
                                        <td>
                                             Hobbies and Lessons
                                            </td>
                                        <td>
                                             Beauty & Health
                                            </td>
                                        </tr>
                                    </table>    
							</center>
						</div>
                        <br />
						<div class="tab-pane fade clearfix" id="tab2">
							<center><p class="title"><b>Service Support</b></p></center><br /><br />
							<span>Any Time Any Where<br />You can mail us your query any time <br/>and you will be fetched out of that</span>
						</div><br />
						<div class="tab-pane fade clearfix" id="tab3">
							<center><p class="title"><b>Service on Click</b></p></center><br /><br />
							<span>just click...click...click......<br/>and get the Service doing ting...tong<br/>on your door Step</span>
						</div><br />
						<div class="tab-pane fade clearfix" id="tab4">
							<center><p class="title"><b>Heigher Professional</b></p></center><br /><br />
							<span>Heigher the verified and trused professional<br />without going or roaming to find theme</span>
						</div><br />
						<div class="tab-pane fade clearfix" id="tab5">
							<center><p class="title"><b>Quality work</b></p></center><br /><br />
							<span>Work done above your Expectation</span>
						</div><br />
						<div class="tab-pane fade clearfix" id="tab6">
							<center><p class="title"><b>User</b> Support</p></center><br /><br />
							<span>Any Query...? <p>You will be Helped out</p>Mail Us<p>myservices121@gmail.com</p></span>
						</div><br />
					</div>
					<ul id="myTab" class="nav-tabs">
						<li class="active"><a class="i1" href="#tab1" data-toggle="tab" ><i></i><span>Services</span></a></li>
						<li><a class="i2" href="#tab2" data-toggle="tab" ><i></i><span>Service Support</span></a></li>
						<li><a class="i3" href="#tab3" data-toggle="tab" ><i></i><span>Service on Click</span></a></li>
						<li><a class="i4" href="#tab4" data-toggle="tab" ><i></i><span>Heigher Professional</span></a></li>
						<li><a class="i5" href="#tab5" data-toggle="tab" ><i></i><span>Quality work</span></a></li>
						<li><a class="i6" href="#tab6" data-toggle="tab" ><i></i><span>User Support</span></a></li>
					</ul><!-- CASTOM TAB -->
				</div><!-- //CONTAINER -->
			</div><!-- //CLEAN CODE -->
        </section>
        
    </form>
</body>
</html>