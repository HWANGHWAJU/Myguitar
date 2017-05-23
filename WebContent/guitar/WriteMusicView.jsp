<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    session="false"%>
 <%@ page
	  	 import="article.dao.*"
	  	 import="article.model.*"
	  	 import="article.service.*"
	  	 import="auth.service.*" %>
    
<% 		request.setCharacterEncoding("utf-8");

		HttpSession sess = request.getSession(false);
	
		User user = (User)sess.getAttribute("authUser"); //id랑 이름만 저장되어 있음

%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>자 함 해보자</title>
    <meta name="description" content="Your Description Here">
    <meta name="keywords" content="free boostrap, bootstrap template, freebies, free theme, free website, free portfolio theme, portfolio, personal, cv">
    <meta name="author" content="Jenn, ThemeForces.com">
    
    <!-- Favicons
    ================================================== -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="img/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css"  href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="font-awesome-4.2.0/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="css/jasny-bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/animate.css">

    <!-- Slider
    ================================================== -->
    <link href="css/owl.carousel.css" rel="stylesheet" media="screen">
    <link href="css/owl.theme.css" rel="stylesheet" media="screen">

    <!-- Stylesheet
    ================================================== -->
    <link rel="stylesheet" type="text/css"  href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/responsive.css">


    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

    <script type="text/javascript" src="js/modernizr.custom.js"></script>
    
</head>

<style type="text/css">


@import url(http://fonts.googleaps.com/earlyaccess/nanumgothic.css);
	body { font-family:'Nanum Gothic', sans-serif; }

.top{
		
	background: #282f35;
	padding: 0 40px;
	color: #ffffff;
	border-top: 5px solid #c59a6d;
	height: 70px;
		
		}
div .container .form .f{
/*	border : 1px solid pink; */
	margin-bottom:30px;
}

</style>




<body>

<div class="top">
	<div class="container text-center">
		<div class="pull-center">
			<p>	</p>
			</div>
			
	</div>

</div>


<div class="space"></div>
  <!-- Off Canvas Navigation
    ================================================== -->
    <div class="navmenu navmenu-default navmenu-fixed-left offcanvas"> <!--- Off Canvas Side Menu -->
        <div class="close" data-toggle="offcanvas" data-target=".navmenu">
            <span class="fa fa-close"></span>
        </div>
        <div class="add-margin"></div>
        <ul class="nav navmenu-nav"> <!--- Menu -->
            <li><a href="index.jsp" class="page-scroll">Home</a></li>
            <li><a href="index.jsp?#meet-us" class="page-scroll">Meet us</a></li>
            <li><a href="index.jsp?#services" class="page-scroll">Service</a></li>
            <li><a href="index.jsp?#works" class="page-scroll">Works</a></li>
             <li><a href="index.jsp?#board" class="page=scroll">My Board</a></li>
            <li><a href="index.jsp?#music" class="page=scroll">Music Board</a></li>
            <li><a href="index.jsp?#video" class="page=scroll">Video Board</a></li>
            <li><a href="index.jsp?#about-us" class="page-scroll">About Us</a></li>
            <li><a href="index.jsp?#contact" class="page-scroll">Contact Us</a></li>
        </ul><!--- End Menu -->
    </div> <!--- End Off Canvas Side Menu -->


<div class="container text-center">
            <!-- Navigation 왼쪽 상단 메뉴 펼침 선택도구  -->
            <nav id="menu" data-toggle="offcanvas" data-target=".navmenu">
                <span class="fa fa-bars"></span>
            </nav>
 </div>



<div>
	<div class="container text-center">
	
		<div class="row text-center">
			<div class="col-md-8 col-md-offset-2">
				<div class="section-title">
					<h2>Write Here : )</h2>
						<hr>
				</div>
				User ID <%=user.getId() %>
			</div>
		</div>
		
		<div class="space"></div>
		
		<div class="form">
			<div class="f">
			<form action="WriteMusic.jsp" method="post" name="inputMusic" enctype="multipart/form-data" id="form">
				<table width="100%">
				
					<tr>
						<td width="10%">Title</td>
						<td align="left"  class="head">&nbsp;<select id="header" name="header" >
								<option value="" selected="selected">말머리</option>
								<option value="guitar" >Guitar</option>
								<option value="ukulele" >Ukulele</option>
								<option value="piano" >Piano</option>
								<option value="etc">기타</option>
							</select></td>
						<td></td>
				 	</tr>
				 	
					<tr>
						<td>&nbsp;</td>
						<td height="30" colspan="2">
						<input type="text" id="Musictitle" name="Musictitle" style="width:85%; margin-left:0; padding-left:0;">
						</td>
					</tr>
					
					<tr>
						<td> Context </td>
						<td width="100%" colspan="2">	<textarea rows="10" cols="99" id="Musictext" name="Musictext"placeholder="내용을 입력하세요."></textarea>
						</td>
					</tr>
					
				<tr><td height="30" colspan="3"></td></tr>
				
					<tr>
						<td> Files</td>
						<td><input type="file" id="musicfiile" name="musicfile"></td>
						<td><input type="file" id="musicfile2" name="musicfile2"></td>
					</tr>
					
			</table>
				<div class="space"></div>
								<a href="index.jsp?#music" >[목록]</a>&nbsp;
								<input type="hidden" name="board" value="music">
								<a href="#" onclick="submit();">[등록]</a>
			
				</form>
				
			<div class="space"></div>
					
			</div>
		</div>
		
	</div>
</div>

<nav id="footer">
        <div class="container">
             <div class="pull-left">
                <p>2014 © Arcadia. All Rights Reserved. Coded by <a href="https://dribbble.com/jennpereira">Jenn</a> & Designed by <a href="https://dribbble.com/alanpodemski">Alan</a></p>
            </div>
            <div class="pull-right"> 
                <a href="#home" class="page-scroll">Back to Top <span class="fa fa-angle-up"></span></a>
            </div>
        </div>
    </nav>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.1.11.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/SmoothScroll.js"></script>
    <script type="text/javascript" src="js/jasny-bootstrap.min.js"></script>

    <script src="js/owl.carousel.js"></script>
    <script src="js/typed.js"></script>


    <!-- Javascripts
    ================================================== -->
    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript">
    function submit(){
    	document.getElementById("form").submit();
    }
    </script>
    
</body>
</html>