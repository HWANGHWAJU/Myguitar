<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Login Main 화면</title>
<style>
@import url(http://fonts.googleaps.com/earlyaccess/nanumgothic.css);
	body { font-family:'Nanum Gothic', sans-serif; }
</style>
<script type="text/javascript" src="Login.js"></script>
<script type="text/javascript">
function TransPage(str){
	location.replace(str);
}
</script>
</head>

<body>
<h1 align="center">Login</h1>
<form action="Login.jsp" method="post" name="loginmain" onsubmit="return LoginCheck();">
<table align="center"  border="1"  width="300">
	<tr>
		<td colspan="2" align="right"> ID  </td>
		<td><input type="text" id="id" name="id">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right"> PASSWORD </td>
		<td><input type="password" id="pw" name="pw"></td>
	</tr>
</table>

<br><br>
<table align="center"><tr><td><input type="submit" value="Login" ></td></tr></table>	
<br><br>

<table align="center"  border="1"  width="300">
	<tr align="center"><td>
	<input type="button" value="ID/PW 찾기">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="회원 가입" onclick="TransPage('JoinForm.jsp');">
	</td></tr>
</table>

</form>
</body>
</html>