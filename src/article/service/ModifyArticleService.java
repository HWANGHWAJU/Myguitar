package article.service;

import java.sql.Connection;
import java.sql.SQLException;

import article.dao.ArticleContentDao;
import article.dao.ArticleDao;
import article.model.Article;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class ModifyArticleService {

	private ArticleDao articleDao = new ArticleDao();
	private ArticleContentDao contentDao = new ArticleContentDao();

	public boolean modify(ModifyRequest modReq) {
		boolean ok=false;
		Connection conn = null;
		System.out.println("글 제목 :"+modReq.getTitle());
		System.out.println("새 파일 이름 :"+modReq.getFilename1());
		System.out.println("새 파일 이름 :"+modReq.getFilename2());
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Article article = articleDao.selectById(conn, modReq.getArticleNumber());
			
			if (article == null) {
				throw new ArticleNotFoundException();
			}

			articleDao.update(conn, modReq.getArticleNumber(), modReq.getHeader(),modReq.getTitle());
			contentDao.update(conn, modReq.getArticleNumber(), modReq.getContent(),modReq.getFilename1(), modReq.getFilename2());
			conn.commit();
			ok = true;
			return ok;
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} catch (PermissionDeniedException e) {
			JdbcUtil.rollback(conn);
			throw e;
		} finally {
			JdbcUtil.close(conn);
		}
	}


}
