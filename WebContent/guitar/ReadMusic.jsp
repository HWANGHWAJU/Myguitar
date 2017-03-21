<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ page import = "article.command.*"
	  	 import="article.dao.*"
	  	 import="article.model.*"
	  	 import="article.service.*"
	  	 import="auth.service.*" %>
	  	 
<%

	HttpSession sess = request.getSession(false);

%>
<%

	User user = (User)sess.getAttribute("authUser");

%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
@import url(http://fonts.googleaps.com/earlyaccess/nanumgothic.css);
	body { font-family:'Nanum Gothic', sans-serif; }
</style>
</head>
<body>
User ID <%=user.getId() %>
<%

		request.setCharacterEncoding("utf-8");

		ReadArticleService readService = new ReadArticleService();
	
		
		
		String noVal = request.getParameter("musicnum");
		
		int MusicNum = Integer.parseInt(noVal);
		
		ArticleData articleData = readService.getArticle(MusicNum, true);
		
		try{
			
			
			request.setAttribute("articleData", articleData);
	//		response.sendRedirect("MusicView.jsp");
			
		} catch(ArticleNotFoundException | ArticleContentNotFoundException e){
			request.getServletContext().log("no music",e);
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			e.printStackTrace();
		}
		
		String writer = articleData.getArticle().getWriterid().getId();

%>
<h1>Music _ <%=articleData.getArticle().getTitle() %></h1>

<table width="100%">
<tr>
<td> 번호 </td>
<td><%=articleData.getArticle().getNumber() %></td>
</tr>
<tr>
<td> 작성자</td>
<td><%=articleData.getArticle().getWriterid().getId() %></td>
</tr>
<tr>
<td> 내용</td>
<td><%=articleData.getContent() %></td>
</tr>
</table>

<a href="Delete.jsp?num=<%=articleData.getArticle().getNumber()%>&id=<%=writer%>">[삭제]</a>

<a href="Music.jsp">[목록]</a>

 
</body>
</html>