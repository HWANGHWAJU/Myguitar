package article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;

import java.util.List;

import article.model.Article;
import article.model.Writer;
import jdbc.JdbcUtil;

//게시글 글쓰기 구현 

public class ArticleDao {

	
		public int delete(Connection conn, int num) throws SQLException {
			
			PreparedStatement pstmt = null;
	
			try {
				
				pstmt = conn.prepareStatement("delete from music where music_num=?");
				
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
			return 1;
				
			} finally {

				JdbcUtil.close(pstmt);
			}
		}
	
	
	
	//삽입에 성공하면 알티클로 리턴 실패하면 널 리턴 
	public Article insert(Connection conn, Article article) throws SQLException {

		//DB 연결 생성과 명령어 입력 
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;

		
		try {
	
			pstmt = conn.prepareStatement("insert into music "+ "(music_title, music_uploader ,music_readcnt) "+ "values (?,?,0)");
	
			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getWriterid().getId());
			

			int insertedCount = pstmt.executeUpdate();

			if (insertedCount > 0) {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select last_insert_id() from music");
		  
				//새로 입력한 악보 데이터를 악보 객체에 리턴한다. 
				if (rs.next()) {  
					Integer newNo = rs.getInt(1);
					return new Article(newNo, 
							article.getTitle(),
							article.getWriterid(),
						0);
				}
			}
			return null;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(pstmt);
		}
	}


	
	
	//게시글 전체의 글 수(music 테이블의 전체 레코드 수)를 리턴 
	public int selectCount(Connection conn) throws SQLException {
	
		Statement stmt = null;
		ResultSet rs = null;
	
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from music");
		
			if (rs.next()) {
				return rs.getInt(1); //전체 레코드 수 리턴 
			}
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}


	
	
	
	
	
	//지정된 범위의 게시글을 읽어오는 매서드 
	public List<Article> select(Connection conn, int startRow, int size) throws SQLException {
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from music order by music_num desc limit ?, ?");
			//limit 는 일부레코드만 조회할 때 사용 1, 읽어올 레코드의 첫번재 행 2, 읽어올 레코드의 개수 
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
	
			rs = pstmt.executeQuery();
	
			List<Article> result = new ArrayList<>();

			while (rs.next()) {
				result.add(convertArticle(rs));
			}
			return result;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

		//resultset 에서 데이터를 읽어와 aritcle 객체 생성 
/*	private Article convertArticle(ResultSet rs) throws SQLException {
		return new Article(rs.getInt("music_num"), rs.getString("music_title"),
																		new Writer( rs.getString("music_uploader") ),
																												rs.getInt("music_readcnt"));
		//						rs.getString("writer_name")),

	}*/
	private Article convertArticle(ResultSet rs) throws SQLException {
		return new Article( rs.getInt("music_num"), rs.getString("music_title"),     new Writer(rs.getString("music_uploader"))     ,    
																																				rs.getInt("music_readcnt"));
	}

	
	
	public Article selectById(Connection conn, int no) throws SQLException {
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
			pstmt = conn.prepareStatement(
					"select * from music where music_num = ?");
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			Article article = null;
			
			if (rs.next()) {
				article = convertArticle(rs);
			}
			int number = article.getNumber();
			String id = article.getWriterid().getId();
			
			System.out.println("number = "+number+" id ="+id);
			
			return article;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void increaseReadCount(Connection conn, int no) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement(
						"update music set music_readcnt = music_readcnt + 1 "+
						"where music_num = ?")) {
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		}
	}
	
	public int update(Connection conn, int no, String title) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement(
						"update article set title = ?, moddate = now() "+
						"where article_no = ?")) {
			pstmt.setString(1, title);
			pstmt.setInt(2, no);
			return pstmt.executeUpdate();
		}
	}
}
