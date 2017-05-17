<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="qANDa.model.*"
    import = "qANDaService.*"
    import="auth.service.*"
    import="java.util.*"
    import="java.text.*"%>
    
    
<%
	
	HttpSession sess = request.getSession(false);
	
	User user = (User)sess.getAttribute("authUser");

	request.setCharacterEncoding("utf-8");
	
	
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	String now = sdf.format(date);

	
	

%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>My Page</title>
    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
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

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<style type="text/css">
	
	.all { background-color : D8D8D6;}
	.floatmenu { margin:0; padding-top: 10px; padding-left: 100px;}
	
	.floatmenu ul ul 
		{ 
			display: none;       
			position:absolute;
		
		
		}
		
	.topmenu li {
		display : inline;
		padding :0 10px;
		list-style : none;
		float:left;
		background-color: #2d2d2d;
		line-height: 30px;
		vertical-align :middle;
		text-align: center;

	}
	
	.nextmenu li {
	
		display : inline;
		padding :0 10px;
		list-style : none;
		float:left;
		background-color: #2d2d2d;
		line-height: 30px;
		vertical-align :middle;
		text-align: center;
	
	}
	
	
	.submenu li:hover  { border-bottom: 1px solid white;}
	
	.submenu li{
		float:none;
		display:list-item;
		text-align: left;
		
		}
	
	.menuLink {
		text-decoration: none;
		color : white;
		font-weigth : bold;
		font-family: "Trebuchet MS", Dotum, Arial;  }
		
		.floatmenu ul li:hover ul { display:block;}
		.submenu ul li.hover ul {display:block;}
		
		#sub {
			color : white;
			font-size : 12px;
			font-family: "Trebuchet MS", Dotum, Arial;  }
			
		
	
		.tbl-menu {
				border: 1px solid;
		
		}
		
		.tbl-menu td{
			padding: 15px;
		}


.top{
		
	background: #282f35;
	padding: 0 40px;
	color: #ffffff;
	border-top: 5px solid #c59a6d;
	height: 70px;
		
		}

</style>


<script type="text/javascript">

var bDisplay = true;

function doDisplay(index){
    var con = document.getElementById(index);
    
    
    if(con.style.display=='none'){
        con.style.display = 'block';
    }else{
        con.style.display = 'none';
    }
}

var aDisplay=true;
function doAnsDisplay(answer){
    var conn = document.getElementById(answer);
        
    if(conn.style.display=='none'){
        conn.style.display = 'block';
    }else{
        conn.style.display = 'none';
    }
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

    <nav >

	<div>
            <nav  class="floatmenu">
            <ul class="topmenu">
             <li><a href="index.jsp?#home" class="menuLink">Home</a></li>
             <li><a href="index.jsp?#services" class="menuLink">Service</a>
            		<ul class="submenu"> 
            			<li><a href="searchData.jsp"  id="sub">Search Data</a></li>
            			<li><a href="#" id="sub">Search PracticeRoom</a></li>
            			<li><a href="#" id="sub">Search Concert</a></li>
            		</ul>
            </li>
            
            <li><a href="#" class="menuLink">Board</a>
            	<ul class="submenu">
            		<li><a href="index.jsp?#music" id="sub">Music Board</a></li>
            		<li><a href="index.jsp?#video" id="sub">Video Board</a></li>
            	</ul>
            
            </li>

            <li><a href="index.jsp?#contact" class="menuLink">Contact Us</a></li>
            </ul>
            </nav>

        </div>
    </nav>
</div>
	<div class="space"></div>

	<div>
		<div class="container text-center">
			<div class="row text-center">
				<div class="selection-title">
					<h2>My Page</h2>
					<hr>
					
				</div>


				<div class="space"></div>
				
			</div>
	</div>

		<div class="container text-center">
			<div class="row text-left">
	
			<jsp:include page="Mypage_selectC.jsp"></jsp:include>
	
			</div>
				<div class="space"></div>
		</div>
		
		<% 
		
			String selectPage =(String) request.getParameter("page");
			if ( selectPage == null ){	selectPage = "FirstMain.jsp";	 }
		
		%>
		
		<div class="container text-center">
			<div class="row text-center">
			
				<jsp:include page="<%=selectPage%>"></jsp:include>
			
			</div>
				<div class="space"></div>
		</div>





</div> <!-- 전체 div -->

    <nav id="footer">
        <div class="container">
             <div class="pull-left">
                <p>2014 © Arcadia. All Rights Reserved. Coded by <a href="https://dribbble.com/jennpereira">Jenn</a> & Designed by <a href="https://dribbble.com/alanpodemski">Alan</a></p>
          		<p>좋은 템블릿이야.</p>
            </div>
            <div class="pull-right"> 
                <a href="#home" class="page-scroll">Back to Top <span class="fa fa-angle-up"></span></a>
            </div>
        </div>
    </nav>

</body>
</html>