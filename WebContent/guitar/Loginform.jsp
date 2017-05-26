<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
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
    <title>찾기</title>
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


    <!-- Stylesheet
    ================================================== -->
    <link rel="stylesheet" type="text/css"  href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/responsive.css">


    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

    <script type="text/javascript" src="js/modernizr.custom.js"></script>

	<!-- jQuery library (served from Google) -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<!-- bxSlider Javascript file -->
	<script src="bxslider/jquery.bxslider.min.js"></script>
	<!-- bxSlider CSS file -->
	<link href="bxslider/jquery.bxslider.css" rel="stylesheet" />


<style type="text/css">
.top{
		
	background: #282f35;
	padding: 0 40px;
	color: #ffffff;
	border-top: 5px solid #c59a6d;
	height: 70px;
		
		}

.tbl{
	border:1px solid #AE7D34;
	padding:30px;
}

	table tr{
		height: 15px;
	}
	
	.btn{
	
	text-transform: uppercase;
	border: 1px solid #c59a6d;
	word-spacing: 2px;
	padding: 7px 30px;
	border-radius: 2px;
	font-size: 12px;
	color: #ffffff;
	transition: all 0.5s;
	
	}
</style>



<script type="text/javascript" src="Login.js"></script>
<script type="text/javascript">
function TransPage(str){
	location.replace(str);
}

</script>
</head>

<body>

<div class="top">
	<div class="container text-center">
		<div class="pull-center">
			<p>	</p>
			</div>
			
	</div>

</div>


 <%--	<marquee behavior="alternate" scrolldelay="100" direction="right" id="slide"> ~왜 왔니~</marquee> --%>

<%--<form action="Login.jsp" method="post" name="loginmain" onsubmit="return LoginCheck();">--%>

<div class="space"></div>
<div class="space"></div>

	<div class="container text-center">
		<div class="row">
				<div class="tbl">
					<form action="Login.jsp" method="post" name="loginmain">
						<table align="center"   width="100%"  height="400" class="form" >
						
							<tr>
								<td colspan="2" align="right"  style="vertical-align: bottom;"> ID  </td>
								<td style="vertical-align: bottom;"><input type="text" id="id" name="id" ></td>
								<td rowspan="4"><input type="submit" value="Login"  class="btn">
								<td rowspan="5" width="50%">
									<ul class="bxslider">
										<li><img src="img/portfolio/01.jpg"></li>
										<li><img src="img/portfolio/02.jpg"></li>
										<li><img src="img/portfolio/03.jpg"></li>
										<li><img src="img/portfolio/04.jpg"></li>
									</ul>
								</td>
							</tr>
							
							<tr>
								<td colspan="2" align="right" > PASSWORD </td>
								<td><input type="password" id="pw" name="pw"></td>
							</tr>
						
							<tr align="center" >
							<td colspan="4" align="center">
							<input type="button"  value="ID/PW 찾기" class="btn"" onclick="TransPage('Findmine.jsp');">
							<input type="button" value="회원 가입" onclick="TransPage('JoinForm.jsp');" class="btn">
							<input type="button" value="HOME" onclick="TransPage('Guestindex.jsp');" class="btn">
							</td>
							</tr>
							
						</table>
					</form>
			</div>
		</div>
	</div>
	
<div class="space"></div>
<div class="space"></div>
<div class="space"></div>


<script>
$(document).ready(function(){
	  $('.bxslider').bxSlider({
		  	mode :'horizontal',
		  	speed:1000,
		  	auto: true, 
		  	autoContrls : true,
	  });
	  
	});
</script>


<script type="text/javascript">

function admin(){
	
	var msg=confirm("니가 이현주야?ㅇㅅㅇ");
	
	if(msg == true){ window.open("admin/admin_login.jsp", "admin_login","width=300, height=100");}
	else if(mag == false) { window.close();}
	
}

</script>

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

</body>
</html>