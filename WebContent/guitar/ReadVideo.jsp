<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page 
	  	 import="video.dao.*"
	  	 import="video.model.*"
	  	 import="video.service.*"
	  	 import="auth.service.*" 
	  	 import="reply.dao.*"
	  	 import="reply.service.*"
	  	 import="reply.model.*" 
	  	 import ="java.sql.*"
	  	 import="java.io.*"%>
	  	 
<%

	HttpSession sess = request.getSession(false);

	User user = (User)sess.getAttribute("authUser");


		request.setCharacterEncoding("utf-8");
		ReadVideoService readService = new ReadVideoService();
	
		
		
		String noVal = request.getParameter("videonum");
		String board="video";
		
		int VideoNum = Integer.parseInt(noVal);
		
		VideoData videoData = readService.getVideo(VideoNum, true);
		
		try{
				request.getSession().setAttribute("videoData", videoData);
				request.getSession().setAttribute("board",board);
	} catch(VideoNotFoundException | VideoContentNotFoundException e){
			request.getServletContext().log("no",e);
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			e.printStackTrace();
		}
		
		String writer = videoData.getVideo().getWriterid().getId();
		String nowURL = request.getRequestURI();
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

<style type="text/css">
.top{
		
	background: #282f35;
	padding: 0 40px;
	color: #ffffff;
	border-top: 5px solid #c59a6d;
	height: 70px;
		
		}
#content{
	padding-top:20px;
	padding: 20px;
	border: 1px solid #333;
	border-radius : 10px;
	height: 300px;
	
}
#emb{
	padding-top: 20px;
	margin:0;
}
</style>


</head>
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
             <li><a href="index.jsp?#board" class="page=scroll">My Page</a></li>
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
	<div class="container">
		<div class="row text-center">
			<div class="col-md-8 col-md-offset-2">
				<div class="section-title">
				<h1>Video _ <%=videoData.getVideo().getTitle()%></h1>
				<hr>
				</div>
			</div>
		</div>
	
		<div class="space"></div>
	
		<div class="tbl">
			<table width="100%">
			<tr>
				<td> No </td>
				<td><%=videoData.getVideo().getNumber() %></td>
			</tr>
		
			<% String video_writer = videoData.getVideo().getWriterid().getId(); %>
	
			<tr>
				<td> Writer </td>
				<td><%=video_writer %></td>
			</tr>
			
			<tr>
				<td>Header</td>
				<td><%=videoData.getVideo().getHeader() %></td>
			</tr>
			
			<tr>
				<td>File</td>
				<td>
				<%if(videoData.getVideoname() != null){ %>
				<a href="fileDown.jsp?file_name=<%=videoData.getVideoname() %>"><%=videoData.getVideoname() %></a>
				<%} else { %> 업로드된 동영상이 없습니다. <%} %>
				</td>
			</tr>
			
			
			<tr>
				<td> Content</td>
				<td>
					<div align="right">
						<input type="checkbox" id="scrapboard" name="scrapboard" value="<%=board%>"onclick="scrap(this);">
							스크랩
				</div>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" width="100%" id="content"><%=videoData.getContent() %></td>
			</tr>
	
			</table>
			
			<div class="space"></div>
			
					<div style="text-align: center">
							<a href="javascript:imgShow('emb');">Show me your video :)</a>
					</div>
			
			<div class="container text-center"id="emb" style="display:none;">
				<% if (videoData.getVideoname() != null) {  %>
			<center>
				<embed src="video/<%=videoData.getVideoname()%>" width="100%" height="500" autostart="false">
			</center>
				<% } %>
			</div>
			<div style="padding-top: 20px;">
					<%if(user.getId().equals(video_writer)) { %>
					<a href="#" onclick="deleteVideo(<%=videoData.getVideo().getNumber()%>)">[삭제]</a>
					<a href="#">[수정]</a>
					<%} %>
				
				<a href="index.jsp?#video">[목록]</a>
				</div>		
		</div><!-- table div -->
					
		<div class="space"></div>
			
		<%
			ReadReplyList list = new ReadReplyList();
			ReplyList replyList = list.getList(board, videoData.getVideo().getNumber());
		%>
			
					<div class="container text-center">
						<table id="replytbl" width="100%">
								<% for(Reply reply : replyList.getList()) { %>
										<tr>
			 								<td width="150" align="center">
			 								<div> <%=reply.getWriterid().getId() %></div>
			 								</td>
			 
			 							<td width="200">
			 							<div><%=reply.getText() %></div>
			 							</td>
			 
									 <td width="200">
									 	<div><%=reply.getDate() %></div>
									 </td>
							
									  <td width="100">
			  								<div align="center"><!-- 댓글 삭제 버튼 -->
			  								<%if(user.getId().equals(reply.getWriterid().getId())) { %>
			  										<input type="button" value="수정">
			  										<input type="button" value="삭제" onclick="deleteReply(<%=reply.getArticleReply()%>)">
			  										<%} %>
										  	</div>
										  </td>
			  							</tr>
			  <%} %>
								</table>
			
				<div class="space"></div>
				
				<div class="form">
			 
			  <form action="ReplyInsert.jsp?reply_article=<%=videoData.getVideo().getNumber() %>&reply_board=<%=board %>" method="POST">
			
				<table>
					<tr>
			  		  	<td width="150" align="center">
			  				<div>	<%=user.getId() %><br/></div>
			  			</td>
			  	
			  			<td width="410">
			 				<div><textarea name="reply_text" rows="1" cols="40"></textarea></div>
			 			</td>
			 		
			 			<td width="100">
			 				<div><input type="submit" value="등록" ></div>
			 			</td>
			 			
			 			</tr>
						</table> 
			 		 </form>
				</div> <!-- form div -->
			</div> <!-- reply div -->
					
					<div class="space"></div>
					
				</div><!-- container div -->
			</div><!--  -->
		
		
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



<script>

function deleteVideo(num){
	
	var articleNum = num;
	
	var msg = confirm("삭제할꺼얌?");
	
	if(msg == true) location.replace("Delete.jsp?num="+<%=videoData.getVideo().getNumber()%>+"&board="+board);
	else location.reload;
}



function deleteReply(num){

	var replyNum = num;
	
	var msg = confirm("삭제할겡");
	
	if(msg == true) location.replace("DeleteReply.jsp?now="+<%=videoData.getVideo().getNumber()%>+"&replyNum="+replyNum+"&board="+<%=board%>);
	else location.reload;
}
function scrap(scrap){

	var msg="";
	
	if(scrap.checked == true){
		msg=confirm("스크랩 할랭?");
			if(msg == true) {
				alert("했다!"); 
				location.replace("Scrap_2.jsp");
			}else if(msg == false){
				scrap.checked = false;
			}
		
	} else {
		
		var mg = confirm("스크랩 해제?");
		
		if(mg == true){
			alert("구래! 취소!");
		}	else if( mg == false){
			scrap.checked = true;
		}
	}
	

}

function imgShow(id){
	var img = document.getElementById(id);
	
	if(img.style.display == 'none'){
		img.style.display = 'block';
	}else if(img.style.display == 'block'){
		img.style.display = 'none';
	}
}


</script>

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






 
</body>
</html>