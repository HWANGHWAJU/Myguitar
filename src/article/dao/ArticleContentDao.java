package article.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import javax.servlet.http.HttpServletRequest;

import article.model.ArticleContent;
import jdbc.JdbcUtil;

public class ArticleContentDao {
	
/*	, HttpServletRequest req*/
	
	
	//insert 매서드에 성공하면 파라미터로 전달 받은 content 객체를 그대로 리턴하고 아니면 null 리턴 
	public ArticleContent insert(Connection conn, ArticleContent content) 	throws SQLException{
				
/*		String uploadPath ="D://workspace_hyun/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebappsMyguitar/upload";
		
		int size = 10*1024*1024;
		
		String name="";
		String filename ="";
		String originalFilename = "";
		
		*/
		System.out.println("입력 파일 이름 : "+content.getFilename1());
		System.out.println("입력 파일 이름 2 : "+content.getFilename2());
		PreparedStatement pstmt = null;
		try {
/*			
			MultipartRequest multi = new MultipartRequest(req, uploadPath, size, "euc-kr",new DefaultFileRenamePolicy());
			
			Enumeration files = multi.getFileNames();
			
			String file1 = (String)files.nextElement();
			
			filename = multi.getFilesystemName(file1);	//데이터에 저장될 객체 변수로 넘어가면 된다. 
			originalFilename = multi.getOriginalFileName(file1);
			
			File f = new File(uploadPath+"\\"+filename);
			
			FileInputStream input = new FileInputStream(f);*/
			
			
			System.out.println("ArticleContentDao Insert method");
			
			pstmt = conn.prepareStatement( "insert into music_content (music_num, content, filename, filename2) values (?,?,?,?)");

			pstmt.setLong(1, content.getNumber());
			pstmt.setString(2, content.getContent());
			pstmt.setString(3, content.getFilename1());
			pstmt.setString(4, content.getFilename2());
//			pstmt.setBinaryStream(3, input,(int)f.length());
	
			int insertedCount = pstmt.executeUpdate();
			if (insertedCount > 0) {
				return content;
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(pstmt);

		}
	}
	
	
	
	
	
	
	
	public ArticleContent selectById(Connection conn, int no) throws SQLException {
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
			pstmt = conn.prepareStatement(
					"select * from music_content where music_num = ?");
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
		
			ArticleContent content = null;
			if (rs.next()) {
				content = new ArticleContent(
						rs.getInt("music_num"), rs.getString("content"),rs.getString("filename"), rs.getString("filename2"));
			}
			return content;
	
			} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);

		}
	}

	public int update(Connection conn, int no, String content, String newfile, String newfile2) throws SQLException {
		System.out.println("update에서 파일 이름1"+newfile);
		System.out.println("update에서 파일 이름 2" +newfile2);
		try (PreparedStatement pstmt = 
				conn.prepareStatement(
						"update music_content set content = ?, filename =?, filename2=?  where music_num = ?")) {
			pstmt.setString(1, content);
			pstmt.setString(2, newfile);
			pstmt.setString(3, newfile2);
			pstmt.setInt(4, no);
			return pstmt.executeUpdate();
		}
	}
}
