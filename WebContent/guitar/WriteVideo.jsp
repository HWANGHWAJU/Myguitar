<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    session = "false"%>
<%@ page import="video.dao.*"
	  	 import="video.model.*"
	  	 import="video.service.*"
	 
	  	 import="auth.service.*" %>
	  	 
	  	 
<%@ page import="com.oreilly.servlet.MultipartRequest,
											com.oreilly.servlet.multipart.DefaultFileRenamePolicy,
											java.util.*,
											java.io.*" 
							import="java.sql.*"%>	  	 
	  	 
	  	 
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

	<%
		
	String videoPath ="D://workspace_hyun/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Myguitar/guitar/video";
	
	int size = 100 * 1024 *1024;
	
	String name="";
	String videoname="";
	String originalVideoname="";
	
	MultipartRequest multi = new MultipartRequest(request, videoPath, size, "utf-8",new DefaultFileRenamePolicy());
	
		
		String title = multi.getParameter("videotitle");
		String content = multi.getParameter("videotext");
		String header = multi.getParameter("header");
		String board = multi.getParameter("board");
		
		VDWriter writer = new VDWriter(user.getId());
		
		
		
		Enumeration files = multi.getFileNames();
		
		String file1 = (String)files.nextElement();
	
		//데이터에 저장될 객체 변수로 넘어가면 된다. 
		originalVideoname = multi.getOriginalFileName(file1);
	
	    videoname= multi.getFilesystemName("video");
	    File f = multi.getFile("video");
		
		
		
		WriteVideoService writeService = new WriteVideoService();
		WriteRequestVD writeRequest = new WriteRequestVD(writer, title, content, header,videoname);
		
		int newVideoNum = writeService.write(writeRequest);
				


	    	
		try{
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myguitar","root","940131");
			
			String query = "insert into fileVideo values(null, ?,?,?)";
			
			PreparedStatement pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1,board);
			pstmt.setInt(2,newVideoNum );
			pstmt.setString(3,videoname);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();

		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		sess.setAttribute("newVideoNum", newVideoNum);
		response.sendRedirect("index.jsp?#video");
%>
		
</body>
</html>