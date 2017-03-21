<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    session="false"%>
<%@ page import="article.model.*"
		 import="article.service.*"
		 import="article.dao.*"
		 import="article.command.*"
		 import="auth.service.*"
		%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

	HttpSession sess = request.getSession(false);

	User user = (User)sess.getAttribute("authUser");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>악보 게시판 </title>
<style>
@import url(http://fonts.googleaps.com/earlyaccess/nanumgothic.css);
	body { font-family:'Nanum Gothic', sans-serif; }
</style>


<script type="text/javascript">

function TransPage(str){
	location.replace(str);
}

</script>
</head>
	<body>
	<h1>Music List</h1>
User ID <%=user.getId() %>

	<% 	ListArticleService listService = new ListArticleService();
	
		int pageno=1;
		
		ArticlePage music = listService.getArticlePage(pageno);
		
	%>
	 
	<marquee behavior="alternate" scrolldelay="100" direction="right"> 악보 게시판 @>--->---- </marquee>
		<div>
		<table class="bbs" width="800" heigth="200" border="2" bgcolor="D8D8D8">
		<colgrup>
			<col width="50" />
			<col width="500" />
			<col width="100" />
			<col width="50" />
		</colgrup>
		<thead>
		
			<tr>
			<td>번	호</td>
			<td>제	목</td>
			
			<td>작  성  자</td>
			
			<td>조  회  수</td>
			</tr>
		</thead>
		<tbody>
		<% 
			boolean isthat = music.hasNoArticles();
			int total = music.getTotal();
			if(isthat == true) {   %>
			악보 없어 ! <%  } else {			
			for(Article Music : music.getContent()){ %> 
			<tr><p>
			<td align="center"><p><%= Music.getNumber() %></p></td>
			
			<td align="center"><p>
			<a href="ReadMusic.jsp?musicnum=<%=Music.getNumber() %>">
			<%= Music.getTitle() %></a>
			
			<td align="center"><p><%= Music.getWriterid().getId() %></p></td>
			
			<td align="center"><p><%= Music.getReadCount() %></p></td>
			
			</tr>
			
			
	 			<% }  
			} %></tbody>
			
			<% boolean ismore = music.hasArticles();
				
			
				if(ismore == true) {  %>
				<tr> <td colspan="4"> 
				<% 
				int startpage = music.getStartPage();
				int endpage = music.getEndPage();
				int pNO =1;
			
				if( startpage > 5) { %>
					<a href="ListPage.jsp?pageno =<%= (startpage-5) %>">이전</a>
			<% } for( pNO = startpage; pNO <= endpage; pNO++ ) { %>
					<a href="ListPage.jsp?pageno =<%= pNO %>">&lt;<%= pNO %>&gt;</a>
				<% } if( endpage < startpage ) { %>
					<a href="ListPage.jsp?pageno=<%=(startpage+5)%>">다음</a>
					<% }
				} %>
			</table></div>

		<input type="button" value="글쓰기" onclick="TransPage('WriteMusicView.jsp')">
</body>
</html>



