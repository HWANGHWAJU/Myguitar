package article.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import article.dao.ArticleDao;
import article.model.Article;
import article.model.Writer;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class ListArticleService {
//한 페이지 게시글 수 10 

	//article 데이터 값을 입력 받을 dao 객체 생성 
	//size는 10으로 설정! 10은 한 페이지에 표현될 게시글의 수 
	
	//articlePage 객체 생성! 
	//객체가 리턴하는 값은 DB에 MUSIC 테이블에 저장된 전체 레코드 수 (total)
	//현재 페이지 넘버 (pageNum), 한 페이지에 나타낼 게시글 수 (size = 10) 
	//DB, MUSIC에서 불러온 content 
	
	private ArticleDao articleDao = new ArticleDao();
	private int size = 10;


	//getArticlePage 함수! 리턴 값은 articlepage! 
	//listhandler 에서 integer형으로 받아온 pageNo를 pageNum에 입력 
	
	public ArticlePage getArticlePage(int pageNum) {
	
		try (Connection conn = ConnectionProvider.getConnection()) {
		
			int total = articleDao.selectCount(conn); //전체 레코드 수 리턴 
	
			List<Article> content = articleDao.select(	conn, (pageNum - 1) * size, size); //페이지에 맞춰 게시 페이지 만들어짐 
			
			//모든 매서드를 거쳐 (article_num, writerid, title, readcnt)를 가진 배열 result가 content에 저장 
			
			return new ArticlePage(total, pageNum, size, content);
			
			//articlePage (전체 페이지, 현재 페이지, 표시될 게시글 수, 게시글 목록)을 가진 객체 리턴 
			//핸들러로 리턴 
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}

//articleDao.selectCount(conn);
//게시글 전체의 글 수(music 테이블의 전체 레코드 수)를 리턴 

/*public int selectCount(Connection conn) throws SQLException {
	
	//conn을 통해 DB연결 
	
	Statement stmt = null;
	ResultSet rs = null;

	try {
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select count(*) from music");
	
		//쿼리문을 통해 music 테이블 안의 레코드 수 값. 
	
	
		if (rs.next()) {
			return rs.getInt(1); //전체 레코드 수 리턴 
		}
	
		return 0;
	} finally {
		JdbcUtil.close(rs);
		JdbcUtil.close(stmt);
	}
}*/

//지정된 범위의 게시글을 읽어오는 매서드 
/*	public List<Article> select(Connection conn, int startRow, int size) throws SQLException {
															//DB연결 , 현재 페이지 수! 배열에 저장된 거니까 -1,*10면 해당 페이지 첫번째 글 번호 
															//현재 페이지가 1로 넘어오면 첫번째 글의 번호는 0번! 
															//해당 페이지에 표시할 게시글의 수
		
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
	}*/

/*		//resultset 에서 데이터를 읽어와 aritcle 객체 생성 
 * 		//배열 result에 저장 
	private Article convertArticle(ResultSet rs) throws SQLException {

		return new Article(rs.getInt("article_no"),
				new Writer(
						rs.getString("writer_id") ),
						rs.getString("title"),
						rs.getInt("read_cnt"));
	}
*/






