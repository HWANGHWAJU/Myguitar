package article.service;

import java.sql.Connection;
import java.sql.SQLException;

import article.dao.ArticleDao;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;


public class DeleteArticleService {
	
		private ArticleDao articleDao = new ArticleDao();
	
		public boolean Articledelete(int articleNum) throws SQLException {
		
			boolean diddone=true;
			//	게시판에서 글 번호만 입력 받아와서 삭제! 
			
			try( Connection conn = ConnectionProvider.getConnection()) {
				int isdone = articleDao.delete(conn, articleNum);
				
					if(isdone != 1){
						System.out.println("삭제 안돼써 8ㅅ8");
						diddone=false;
					} else {
						diddone=true;
						System.out.println("삭제 해찌!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
					}
			} 
			return diddone;
				
		}//articledelete
	
		
}//class 
