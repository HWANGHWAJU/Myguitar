<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    session="false"%>
<%@ page import="article.model.*"
		 import="article.service.*"
		 import="article.dao.*"
		 import="article.command.*"
		 import="auth.service.*"
		 import="java.util.*"
		 import="java.text.*"
		%>


<%

	HttpSession sess = request.getSession(false);

//	User user = (User)sess.getAttribute("authUser");
	
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	String now = sdf.format(date);
	String then ="";

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>악보 게시판 </title>

<style type="text/css">

@import url(http://fonts.googleaps.com/earlyaccess/nanumgothic.css);
	body { font-family:'Nanum Gothic', sans-serif; }
	
	table.bbs {
    border-collapse: collapse;



}
table.bbs thead td {
	padding : 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}


table.bbs td.num{
   width: 100px;

    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}

table.bbs td.read{
   width: 100px;

    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}

table.bbs td {

    vertical-align: center;
    border-bottom: 1px solid #ccc;
}
	
	
	
	
</style>


<script type="text/javascript">

function TransPage(str){
	location.replace(str);
}

</script>
</head>
	<body>


	 <center>
	<div>
		<table class="bbs" width="900" height="200" border="2" >
		<colgroup>
			<col width="60" />
			<col width="100"/>
			<col width="500" />
			<col width="100" />
			<col width="200"/>
			<col width="60" />
		</colgroup>
	
		<thead>
			<tr>
			<td align="center">번	호</td>
			<td align="center">말 머 리</td>
			<td align="center">제	목</td>
			
			<td align="center">작  성  자</td>
			<td align="center">작 성  일</td>
			<td align="center">조  회  수</td>
			</tr>
		</thead>
	<%--now URL <%=request.getRequestURI() %> --%>
	<% 	ListArticleService listService = new ListArticleService();

		ArticlePage music = (ArticlePage)sess.getAttribute("articlePage");
		
		if(music == null){
			music = listService.getArticlePage(1);
			
		}
		
	%>
		<tbody id="list">
		<% 

			boolean isthat = music.hasNoArticles();
			int total = music.getTotal();
			if(isthat == true) {   %>
			악보 없어 ! <%  } else {			
			for(Article Music : music.getContent()){ %> 
			<tr>
			<td align="center" class="num"><p><%= Music.getNumber() %></p></td>
			<!-- 말머리! 기타/ 우쿠렐레/베이스  / 피아노 etc -->
			<td align="center"><p><%=Music.getHeader() %></p></td>
			<td align="center"><p>
			<a href="ReadMusic.jsp?musicnum=<%=Music.getNumber() %>">
			<%= Music.getTitle() %></a>
			<% then = Music.getDate();
					String _then = then.substring(0,10);
					if( now.equals(_then)) { %> <img src="image/new.jpg">
			<%}%>
			<td align="center"><p><%= Music.getWriterid().getId() %></p></td>
			<td align="center" class="date"><p></p><%=Music.getDate() %></td>
			<td align="center" class="read"><p><%= Music.getReadCount() %></p></td>
			
			</tr>
			
			
	 			<% }  
			} %></tbody>
			
			<% boolean ismore = music.hasArticles();
				
			
				if(ismore == true) {  %>
				<tr> <td colspan="6" align="center"> 
				<% 
				int startpage = music.getStartPage();
				int endpage = music.getEndPage();
				int pNO =1;
			
				if( startpage > 5) { %>
		<a href="ListPage.jsp?pageno=<%= (startpage-5) %>">이전</a>
			<% } for( pNO = startpage; pNO <= endpage; pNO++ ) { %>
				<a href="ListPage.jsp?pageno=<%=pNO %>">&lt;<%= pNO %>&gt;</a>
				<% } if( endpage < startpage ) { %>
					<a href="ListPage.jsp?pageno=<%=(startpage+5)%>">다음</a>
					<% }
				} %>
			</table></div>
	
	
		
		<a href="WriteMusicView.jsp"> 글 쓰 기 </a>

</center>

</body>
</html>



