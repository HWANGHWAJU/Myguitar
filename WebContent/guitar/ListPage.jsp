"<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page 
		 import="article.dao.*"
		 import="article.model.*"
		 import="article.service.*" %>
    
<% 
	request.setCharacterEncoding("utf-8");

	int pageNo=1;
	
	ListArticleService listService = new ListArticleService();

	String pageNoVal = request.getParameter("pageno");
	

	
	
	if(pageNoVal != null){
		pageNo = Integer.parseInt(pageNoVal);
	}
	
	ArticlePage articlePage = listService.getArticlePage(pageNo);

	request.getSession().setAttribute("articlePage", articlePage);
//		String _URL="index.jsp?#music";
//	response.sendRedirect(_URL);
	response.sendRedirect(request.getContextPath() + "/guitar/index.jsp?#music");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>