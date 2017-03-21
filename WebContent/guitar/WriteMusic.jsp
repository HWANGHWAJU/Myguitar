<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    session = "false"%>
<%@ page import = "article.command.*"
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
<title>Insert title here</title>
</head>
<body>
	<%
		
		String title = request.getParameter("Musictitle");
		String content = request.getParameter("Musictext");
		
		Writer writer = new Writer(user.getId());


		WriteArticleService writeService = new WriteArticleService();
		WriteRequest writeRequest = new WriteRequest(writer, title, content);
		
		int newArticleNum = writeService.write(writeRequest);
		
		sess.setAttribute("newArticleNum", newArticleNum);
		response.sendRedirect("Music.jsp");
%>
		
</body>
</html>