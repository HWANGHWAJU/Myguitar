package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;

public class JoinService {

	private MemberDao memberDao = new MemberDao();	//값을 입력 받을 멤버 객체를 생성 
	
	//로그인 
	public void join(JoinRequest joinReq) {
			//요구에서 받은 아이디 존재 유무
		Connection conn = null;
		
	
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
				memberDao.insert(conn,  	new Member(
						joinReq.getId(), 
						joinReq.getPw(), 
						joinReq.getName(),
						joinReq.getAge(),
						joinReq.getEmail()
							)
					); //데이터 디비 입력
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e); //런타임 오류 
		} finally {
			JdbcUtil.close(conn); //연결 종료 
		}
		
	}
	
	//아이디 중복 확인
	public boolean DuplicateID(String id) throws SQLException{
		
		Connection conn = null;
		boolean is = false;

		try{
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Member mem = memberDao.selectById(conn, id);
			
			if(mem != null){
				is = false;
				System.out.println("동일있음. +"+is);
				JdbcUtil.rollback(conn);
				return is;
			}
			is = true;
			System.out.println(is);
			return is;
		}finally{
			JdbcUtil.close(conn);
		}
		
	}
	
	
}
