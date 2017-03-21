package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;

public class JoinService {

	private MemberDao memberDao = new MemberDao();	//값을 입력 받을 멤버 객체를 생성 
	
	public void join(JoinRequest joinReq) {

		Connection conn = null;
	
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Member member = memberDao.selectById(conn, joinReq.getId()); //id 중복 확인 
			if (member != null) {
				JdbcUtil.rollback(conn);
				throw new DuplicateIdException();
			} //member의 데이터가 null이 아닌 값이 오면 같은 아이디가 있다는 뜻. 
			//중복되는 아이디가 없을 때 하나의 member 객체를 생성해서 Dao를 통해 DB에 insert
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
}
