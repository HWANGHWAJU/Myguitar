<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" 
    session="false"
    import ="auth.service.*"
 %>
<%

	HttpSession sess = request.getSession(false);

%>
<%

	User user = (User)sess.getAttribute("authUser");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Login 완료 페이지 </title>
<script type="text/javascript">
function TransPage(str){
	location.replace(str);
}

</script>
</head>

<body>
<h1>Login / Join 완료 => My Page  </h1>
<table align="left">
<tr>
<td>User ID <%=user.getId() %></td>
</tr>
<tr>
<td><input type="button" value="Logout" onclick="TransPage('Logout.jsp');">
	<input type="button" value="Edit"></td>
</tr>	
<tr><td></td></tr>
<tr><td><input type="button" value="악보" onclick="TransPage('Music.jsp');"></td></tr>
<tr><td><input type="button" value="동영상" onclick="TransPage('Video.jsp');"></td></tr>
<tr><td><input type="button" value="방명록" onclick="TransPage('Visit.jsp');"></td></tr>
</table>


<form action="board.jsp" method="post">
<table>








</table>


</form>
</body>
</html>