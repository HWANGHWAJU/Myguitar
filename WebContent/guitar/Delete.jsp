<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" session="false" %>
<%@ page
    import="article.service.*"
    import="article.dao.*"
    import="article.model.*"
    import="auth.service.*"%>
 <%
 
 	request.setCharacterEncoding("utf-8");

 	HttpSession sess = request.getSession(false);
	
	User user = (User)sess.getAttribute("authUser");

 
 %> 
  
    
<%
		request.setCharacterEncoding("utf-8");
	 
	

		String deleNum = request.getParameter("num");
		String writerid = request.getParameter("id");
		
		if(user.getId() != writerid){
			out.print("<script>alert('니가 못 지워 ㅗ');</script>");
			response.sendRedirect("ReadMusic.jsp");
		}
		
		int DeleteNum = Integer.parseInt(deleNum);
		
		
		
		DeleteArticleService deleteService = new DeleteArticleService();
		deleteService.Articledelete(DeleteNum);
		
		response.sendRedirect("Music.jsp");

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