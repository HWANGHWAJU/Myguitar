<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%
 		
 	if(request.getSession() != null ){
 		request.getSession().invalidate();
 	} response.sendRedirect(request.getContextPath() + "/guitar/Loginform.jsp");
 
    
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	window.alert("잘 가 다신 오지마");

</script>
</head>
<body>

</body>
</html>