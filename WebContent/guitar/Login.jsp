<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" session="false" %>
<%@ page contentType="text/html; charset=utf-8"
	import="java.sql.*" 
	import="member.*"
	import="java.util.*"
	import="auth.service.*"
	import="auth.command.*"%>

<%	

 	request.setCharacterEncoding("utf-8");

	String input_id = request.getParameter("id");
   	String input_pw = request.getParameter("pw");
      
 	
 	LoginService login = new LoginService();
 
 	
 	try {
 		
		User user = login.login(input_id,input_pw);
		
		
		request.getSession().setAttribute("authUser",user);
		response.sendRedirect(request.getContextPath() + "/guitar/index.jsp");
	} catch (LoginFailException e) {
		e.printStackTrace();
	}
 

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>로그인  연결</title>
</head>

<body>
로그인에 실패 하였습니다. 
</body>
</html>