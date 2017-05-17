<%@page import="java.awt.Window"
		import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" session="false" %>
<%@ page
    import="article.service.*"
    import="article.dao.*"
    import="article.model.*"
    import="auth.service.*"
    import="video.service.*"
    import="video.model.*"%>
    
 <%
 
 	request.setCharacterEncoding("utf-8");

 	HttpSession sess = request.getSession(false);
	
	User user = (User)sess.getAttribute("authUser");
	request.setCharacterEncoding("utf-8");
 
 %> 
 
 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

 
</head>
<body>
 <%

		String deleNum = request.getParameter("num");
 		String board = request.getParameter("board");
		String responseURL="";

		int DeleteNum = Integer.parseInt(deleNum);
	
		if(board.equals("music")){

					DeleteArticleService deleteService = new DeleteArticleService();
					boolean done =	deleteService.Articledelete(DeleteNum);
					
					if(done == true ){
					responseURL ="index.jsp?#music";
					}
		} else if(board.equals("video")){
			
				DeleteVideoService videoDelete = new DeleteVideoService();
				boolean done = videoDelete.Videodelete(DeleteNum);
				
				if(done == true){
					responseURL = "index.jsp?#video";
				}
			
			
		}
		response.sendRedirect(responseURL);

%>
</body>
</html>