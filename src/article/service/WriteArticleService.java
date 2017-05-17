package article.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import article.dao.ArticleContentDao;
import article.dao.ArticleDao;
import article.model.Article;
import article.model.ArticleContent;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
//게시판 글쓰기 기능 제공 


public class WriteArticleService {

	private ArticleDao articleDao = new ArticleDao();
	private ArticleContentDao contentDao = new ArticleContentDao();

	//write() 매서드는 리퀘스트의 req의 파라미터를 이용해 (작성자 아이디, 제목, 내용) 게시글을 등록하고 결과로 게시글 번호 리턴
	public Integer write(WriteRequest req) {

		Connection conn = null;
		//트랜젝션 시작 
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);

			Article article = toArticle(req); 	//writerequest로 부터 music객체 생성 
			
			System.out.println("article로 변환");
			Article savedArticle = articleDao.insert(conn, article);	//dao.insert 매소드 실행하고 결과값 savedaricle 에 할당 데이터의 pk값을 number로 갖는다
			
			System.out.println("insert 함수 실행");
		
			if (savedArticle == null) {
				throw new RuntimeException("fail to insert article");
			} //null이면 인서트 오류 
			//insert 오류가 나지 않았다면 
		
			System.out.println("content insert");
			ArticleContent content = new ArticleContent(
					savedArticle.getNumber(),
					req.getContent(),
					req.getFilename()
					);
			System.out.println("content insert Dao start");
			ArticleContent savedContent = contentDao.insert(conn, content);
		
			//article 객체로 값 입력에 성공하고 난 뒤 그 내용을 입력 
		
			if (savedContent == null) {
				throw new RuntimeException("fail to insert article_content");
			}
			// 내용입력에 실패했을 때 오류 출력 
			conn.commit();

			return savedArticle.getNumber();
		} 	//성공후 등록된 새 악보의 숫자 리턴 
		catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} catch (RuntimeException e) {
			JdbcUtil.rollback(conn);
			throw e;
		} finally {
			JdbcUtil.close(conn);
		}
	}

	private Article toArticle(WriteRequest req) {
	
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	
		return new Article(req.getHeader(),null, req.getTitle(), req.getWriter(), sdf.format(date),0);
	}
}
