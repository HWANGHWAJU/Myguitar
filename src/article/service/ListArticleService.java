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
import article.model.AWriter;
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
			System.out.println("지금 페이지능 : " +pageNum);
			return new ArticlePage(total, pageNum, size, content);
			
			//articlePage (전체 페이지, 현재 페이지, 표시될 게시글 수, 게시글 목록)을 가진 객체 리턴 
			//핸들러로 리턴 
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public ArticlePage getMyArticlePage(int pageNum, String name){
		
		try (Connection conn = ConnectionProvider.getConnection()){
			
			int total = articleDao.selectMyCount(conn, name);
			
			List<Article> content = articleDao.selectByWriter(conn, name);
			
			return new ArticlePage(total, pageNum, size, content);
		}
		catch(SQLException e){
			throw new RuntimeException(e);
		}
		
	}
	
	
	
	
	
}





