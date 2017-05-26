<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Join Form !!!! </title>

    <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">

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

<style type="text/css">
.top{
		
	background: #282f35;
	padding: 0 40px;
	color: #ffffff;
	border-top: 5px solid #c59a6d;
	height: 70px;
		
		}



	.tbl .tab{
		width: 80%;
	}
	
	.tab tr{
		height: 30px;
	}
	
	
	
	.btn , .check{
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


<script type="text/javascript" src="Login.js">

joinform.inputid.focus();



</script>
<script type="text/javascript">
function CheckID(){
	window.open("IDcheckView.jsp", "chk", "width=500, height=500");
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
<div style="height: 800px;">
<div class="space"></div>
<div class="text-center">
<h1>Welcome : )</h1>
<hr>
회원 정보를 입력 해주세요 !
</div>
<div style="height: 100px;"></div>

		<div class="container text-center">
				<div class="tbl">
											<form action="Join.jsp" method="post" name="joinform" onsubmit="return JoinCheck();">
												<table class="tab"align="center" >
													<tr>
														<td colspan="2" align="right">*ID </td>
														<td><input type="text" id="inputid" name="inputid"></td>
														<td align="left"><input type="button"  class="check" value="중복 확인" onclick="CheckID();"></td>
													</tr>
													
													<tr>
														<td colspan="2" align="right">* Password </td>
														<td><input type="password" id="inputpw" name="inputpw" ></td>
														<td></td>
													</tr>
													<tr>
														<td colspan="2" align="right">* Password confirm	</td>
														<td><input type="password" id="pwcon" name="pwcon"></td>
														<td></td>
													</tr>
													<tr>
														<td colspan="2" align="right">* Name </td>
														<td><input type="text" id="inputname" name="inputname">
														</td>
													</tr>
													<tr>
														<td colspan="2" align="right">* Age </td>
														<td><input type="number" id="inputage" name="inputage">
														</td>
														<td></td>
													</tr>
												
													<tr>
														<td colspan="2" align="right">* E-Mail </td>
														<td><input type="email" id="inputemail" name="inputemail">
														</td> 
														<td></td>
													</tr>
													
												<tr><td height="14" colspan="3"></td>
												</tr>
												
													<tr  >
													<td align="center"  colspan="4" >
													<input type="submit"  id="doit"value="회원 가입" class="btn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="reset"  id="re" value="다시 쓰기"  class="btn">
													</td>
													</tr>
													<tr><td></td></tr>	
													<tr>
													<td colspan="4"><a href="Guestindex.jsp">HOME</a></td>
													</tr>
												</table>
												
											</form>

	</div>
</div>


<div class="space"></div>
<div class="space"></div>
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
</body>
</html>