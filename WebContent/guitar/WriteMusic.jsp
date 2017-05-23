<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    session = "false"%>
<%@ page 
	  	 import="article.dao.*"
	  	 import="article.model.*"
	  	 import="article.service.*"
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
	
//	String uploadPath = application.getRealPath("upload");

		String uploadPath ="D://workspace_hyun/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/Myguitar/guitar/upload";
	
	int size = 10*1024*1024;
	
	String filename ="";
	String filename2="";
	String originalFilename = "";
	String originalFilename2="";
	
	ArrayList<String> filenames = new ArrayList<String>();
	ArrayList<String> originalnames = new ArrayList<String>();
	
	String title="";
	String content="";
	String header ="";
	String board="";
	
	AWriter writer = new AWriter(user.getId());

	
	try{
	
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8",new DefaultFileRenamePolicy());
				
				 title = multi.getParameter("Musictitle");
				 content =multi.getParameter("Musictext");
			 	 header = multi.getParameter("header");
			     board =multi.getParameter("board");
				
				Enumeration files = multi.getFileNames();
				
				while(files.hasMoreElements()){
				String name = (String)files.nextElement();
					filenames.add(multi.getFilesystemName(name));
					originalnames.add(multi.getFilesystemName(name));
				}
		     
			}catch(Exception e){
				e.printStackTrace();
			}
	
			int cnt = 0;
			String[] str = new String[2];
			
			for(int i=filenames.size()-1;i>=0;i--){
				if(filenames.get(i) != null){
					str[cnt] = filenames.get(i);
					cnt++;
				}
			}
	
		filename = str[0];
		filename2 = str[1];
	
		WriteArticleService writeService = new WriteArticleService();
		WriteRequest writeRequest = new WriteRequest(header,writer, title, content,filename, filename2);
		

		int newArticleNum = writeService.write(writeRequest);
		
		
		
//		File f = new File(uploadPath+"\\"+filename);
	/* 	
		FileInputStream input = new FileInputStream(f);
		
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myguitar","root","940131");
			
			String query = "insert into Image values(null, ?,?,?,?)";
			
			PreparedStatement pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1,board);
			pstmt.setInt(2,newArticleNum );
			pstmt.setBinaryStream(3,input,(int)f.length());
			pstmt.setString(4,filename);
			
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();

		}catch(Exception e){
			e.printStackTrace();
		}
		 */
		
		
		sess.setAttribute("newArticleNum", newArticleNum);
		response.sendRedirect("index.jsp?#music");
		
%>
		
</body>
</html>