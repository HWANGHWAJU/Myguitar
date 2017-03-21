<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Join Form !!!! </title>
<script type="text/javascript" src="Login.js"></script>
<style>
@import url(http://fonts.googleaps.com/earlyaccess/nanumgothic.css);
	body { font-family:'Nanum Gothic', sans-serif; }
</style>
</head>
<body>
<h1 align="center">회원 가입</h1>
<form action="Join.jsp" method="post" name="joinform" onsubmit="return JoinCheck();">
<table align="center" width="600" >
	<tr>
		<td colspan="2" align="left">* ID 입력 </td>
		<td><input type="text" id="inputid" name="inputid">&nbsp;
			<input type="button" value="중복 확인" onclick="CheckID();">
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="left">* Password </td>
		<td><input type="password" id="inputpw" name="inputpw" ></td>
	</tr>
	<tr>
		<td colspan="2" align="left">* Password confirm	</td>
		<td><input type="password" id="pwcon" name="pwcon">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="left">* Name </td>
		<td><input type="text" id="inputname" name="inputname">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="left">* Age </td>
		<td><input type="number" id="inputage" name="inputage">
		</td>
	</tr>

	<tr>
		<td colspan="2" align="left">* E-Mail </td>
		<td><input type="email" id="inputemail" name="inputemail">
		</td> 
	</tr>
</table>
	<br><br>	<br><br>
<table align="center">
	<tr>
		<td align="center" colspan="3">
			<input type="submit" value="회원 가입">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="다시 쓰기" onclick="resetForm();">
		</td>
	</tr>
	
</table>
</form>
</body>
</html>