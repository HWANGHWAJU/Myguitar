<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page 
	  	 import="article.dao.*"
	  	 import="article.model.*"
	  	 import="article.service.*"
	  	 import="auth.service.*"
	  	 import="reply.dao.*"
	  	 import="reply.service.*"
	  	 import="reply.model.*" 
	  	 import ="java.sql.*"
	  	 import="java.io.*"
	  	 		 import="java.util.*"
		 import="java.text.*"%>
	  	 
	  	 
<%

	pageContext.setAttribute("br","<br/>");
	pageContext.setAttribute("cn","\n");
	
	HttpSession sess = request.getSession(false);

	User user = (User)sess.getAttribute("authUser");

%> 
<%

		request.setCharacterEncoding("utf-8");

		ReadArticleService readService = new ReadArticleService();
	
		
		
		String noVal = request.getParameter("musicnum");
	
		String board="music";	
		
		int MusicNum = Integer.parseInt(noVal);
		
		ArticleData articleData = readService.getArticle(MusicNum, true);
		
		try{
			
			
			request.getSession().setAttribute("articleData", articleData);
			request.getSession().setAttribute("board",board);
			
		} catch(ArticleNotFoundException | ArticleContentNotFoundException e){
			request.getServletContext().log("no music",e);
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			e.printStackTrace();
		}
		
		String writer = articleData.getArticle().getWriterid().getId();
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

#img{
	padding-top:20px;
	margin:0;
	background-color: #686868;
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
			<h1><%=articleData.getArticle().getTitle() %></h1>
			<hr>
			<%=user.getId() %>님 어떤 악보를 읽으러 왔오 :) ?
				</div>
			</div>
		</div>
	
		<div class="space"></div>

		<div class="tbl">
				
				<table width="100%">
					<tr>
						<!-- 번호  -->
							<td>No</td>
							<td colspan="2"><%=articleData.getArticle().getNumber() %></td>
							</tr>
							<% String article_writer = articleData.getArticle().getWriterid().getId();%>
						<tr>
						<!-- 작성자 -->
							<td>Writer</td>
							<td colspan="2"><%=article_writer %></td>
						</tr>
						<tr>
						<!-- 말머리 -->
							<td>Header</td>
							<td colspan="2"><%=articleData.getArticle().getHeader() %></td>
					</tr>
				<%
					String prev1=articleData.getFilename1();
					String prev2=articleData.getFilename2();
				%>
				
				<tr>
					<td>파일</td>
						<td width="300">
							<div id="bye1" style="display:block;">
								<%if(prev1 == null){ %>
									등록된 파일이 없습니다. 
								<%}else if(prev1 != null){ %>
								<%=prev1 %>
								<%} %>
							</div>
						</td>
						<td width="300">
							<div id="bye2" style="display:block;">
								<% if(prev2 == null){ %>
									등록된 파일이 없습니다. 
								<%}else if(prev2 != null){ %>
								<%=prev2 %>
								<%} %>
							</div>
						</td>
					</tr>
				
				<tr>
						<!-- 내용 -->
						<td>Content</td>
						<td align="right"colspan="2"><input type="checkbox" id="scrapboard" name="scrapboard" value="<%=board%>"onclick="scrap(this);">
						스크랩</td>
						</tr>
					<tr>
						<td colspan="3" width="100%" id="content">
							<%=articleData.getContent() %>
						</td>
					</tr>
				</table>
				
				<div class="space"></div>
				<div style="text-align: center">
							<a href="javascript:imgShow('img');">Show me your file ; )</a>
				</div>
			
				<div class="container text-center" id="img" style="display:none; overflow: scroll;">
					<%if(articleData.getFilename1() != null ){ %>
					<img src="upload/<%=articleData.getFilename1() %>">
					<%}
						if(articleData.getFilename2()!=null){	%>
						<img src="upload/<%=articleData.getFilename2() %>">
					<%} %>
				</div>
				
				
				<div style="padding-top: 20px;">
					<%if(user.getId().equals(article_writer)) { %>
					<a href="#" onclick="deleteArticle(<%=articleData.getArticle().getNumber()%>)">[삭제]</a>
					<a href="ModifyMusic.jsp">[수정]</a>
					<%} %>
					<a href="index.jsp?#music">[목록]</a>
				</div>
				
			</div> <!-- table div -->
		
		<div class="space"></div>
<%

//댓글 읽어오쟈 

ReadReplyList list = new ReadReplyList();
ReplyList replyList = list.getList(board, articleData.getArticle().getNumber());

%>
		
	<div id="reply">	
		<div class="container text-center">
				
				<table id="replytbl" width="100%">
					<%
							int re=1;
							char _re='a';
							char btn='A';
							for(Reply reply : replyList.getList()) { %>
						
							<tr>
 								<td width="150" align="center">
 								<div> <%=reply.getWriterid().getId() %></div>
 								</td>
 							<%String str=reply.getText(); 
 								int r_num = reply.getArticleReply();
 								int a_num=articleData.getArticle().getNumber();%>
 							<td width="300">	
 					<!-- 기존 댓글 창 -->	
 								<p id='<%=re%>'><%=str %></p>
					<!-- 댓글 수정 창 -->
 								<input type="text" value="<%=str%>" id='<%=_re %>' style="display:none;">

 							</td>
 
						 <td width="200">
						 	<div><%=reply.getDate() %></div>
						 </td>
				
						  <td width="200">
  								<div align="center"><!-- 댓글 삭제 버튼 -->
  								<%if(user.getId().equals(reply.getWriterid().getId())) { %>
  										<div id="<%=btn %>" style="display:none; padding: 1px  1px 1px 1px; margin:2px; border:1px dotted gray ;">
  										<input type="submit" value="댓글 수정" onclick="modifySub(<%=r_num %>,'<%=_re %>',<%=a_num %>);" >
  										<input type="button" value="수정 취소"  onclick="modifyNo();">
  										</div>
  										<input type="button" value="수정"  onclick='modifyPop("<%=re %>","<%=_re %>" ,"<%=btn%>");'id="btn_form">
  										<input id="btn_del" type="button" value="삭제" onclick="deleteReply(<%=reply.getArticleReply()%>,<%=articleData.getArticle().getNumber()%>)"> 
  										<%} %>

							  	</div>
							  </td>
  							</tr>
  <%
  				re++;
  				_re++;
  				btn++;
							} %>
  			
					</table>

					<div class="space"></div>
					
						<div class="form">
					 	  <form action="ReplyInsert.jsp?reply_article=<%=articleData.getArticle().getNumber() %>&reply_board=<%=board %>" method="POST">
						
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
				</div> <!-- container div -->
						
		<div class="space"></div>
	
	</div> <!-- reply div -->
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

function modifyPop(re,_re,btn){
	var prev = document.getElementById(re);
	var tnew = document.getElementById(_re);
	var btn_go = document.getElementById(btn);

	if(tnew.style.display =='none'){
		prev.style.display='none';
		tnew.style.display='block';
		tnew.focus();
		btn_go.style.display='block';
	}
}

function modifySub(n,t,a){
	var t = document.getElementById(t).value;
	var msg = confirm("수정?");
	if(msg == true){
		location.href="Replymodify.jsp?r_num="+n+"&text="+t+"&anum="+a;
	}
}
function modifyNo(){
	location.reload();
}
function deleteArticle(num){
	
	var articleNum = num;
	var board ="music";

	var msg = confirm("삭제할꺼얌?");
	if(msg == true) location.replace("Delete.jsp?num="+articleNum+"&board="+board);
	else location.reload;
}

function deleteReply(num,anum){

	var replyNum = num;
	var articleNum = anum;
	var board="music";
	var msg = confirm("삭제할겡");
	
	if(msg == true) location.replace("DeleteReply.jsp?now="+anum+"&replyNum="+replyNum+"&board="+board);
	else location.reload;
}

function scrap(scrap){

	var msg="";
	
	if(scrap.checked == true){
		msg=confirm("스크랩 할랭?");
			if(msg == true) {
				alert("했다!"); 
				location.replace("Scrap_1.jsp");
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