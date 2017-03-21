package article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import article.model.ArticleContent;
import jdbc.JdbcUtil;

public class ArticleContentDao {

	
	
	//insert 매서드에 성공하면 파라미터로 전달 받은 content 객체를 그대로 리턴하고 아니면 null 리턴 
	public ArticleContent insert(Connection conn, ArticleContent content) 
	throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement( "insert into music_content (music_num, content) values (?,?)");

			pstmt.setLong(1, content.getNumber());
			pstmt.setString(2, content.getContent());
	
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
						rs.getInt("music_num"), rs.getString("content"));
			}
			return content;
	
			} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	public int update(Connection conn, int no, String content) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement(
						"update article_content set content = ? "+
						"where article_no = ?")) {
			pstmt.setString(1, content);
			pstmt.setInt(2, no);
			return pstmt.executeUpdate();
		}
	}
}
