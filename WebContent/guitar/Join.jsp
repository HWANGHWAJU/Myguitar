<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8"
	import="java.sql.*" %>
<%@ page import="member.dao.*"
		 import="member.model.*"
		 import="member.service.*"
		 import="jdbc.connection.*"
		 import="member.command.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("inputid"); //JoinForm.jsp 에서 입력 받은 값을 가져온다. 
	String pw = request.getParameter("inputpw");
	String name = request.getParameter("inputname");
	String age =request.getParameter("inputage");
	String email=request.getParameter("inputemail");
	
	JoinService join = new JoinService();
	
	JoinRequest req = new JoinRequest();
	
	req.setId(id);
	req.setPw(pw);
	req.setName(name);
	req.setAge(age);
	req.setEmail(email);
	join.join(req);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
function TransPage(str){
	location.replace(str);
}
</script>
</head>
<body>
<h1>가입을 환영합니다:)</h1>
<input type="button" value="가입을 환영합니다 : )" onclick="TransPage('Loginform.jsp');">

	
</body>
</html>