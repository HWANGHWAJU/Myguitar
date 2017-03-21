<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    session="false"%>
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
<h1>글 작성하기 _ 사진 파일 올리는 기능 구현</h1>
User ID <%=user.getId() %>
<form action="WriteMusic.jsp" method="post" name="inputMusic">
<br>
  <p>
	제 목 <input type="text" id="Musictitle" name="Musictitle" style="width:500px">
  </p>

	<p>
	 내 용 <input type="text" id="Musictext" name="Musictext" style="width:500px; height:350px">
	</p>
	<p>
	 파 일 <input type="file" id="Musicfiile" name="musicfile">
	</p>
	
<input type="submit" value="등록" >
</form>
</body>
</html>