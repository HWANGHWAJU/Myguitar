package auth.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.connection.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;

public class LoginService {
		//DB에 객체를 전달하여 정보를 받아올 클래스 
	private MemberDao memberDao = new MemberDao();

	//로그인 성공시 USER타입으로 객체 리언 
	public User login(String id, String password) {
		//conn을 통해 디비와 연결하여 id를 검색하여 로그인을 인증받는 과정
		
		try (Connection conn = ConnectionProvider.getConnection()) {
			//받아온 아이디를 통해 검색할 아이디 설정 
			Member member = memberDao.selectById(conn, id);
			
			if (member == null) {
				throw new LoginFailException();
			}	//DB안에 객체가 없으면 로그인 실패 
		
			if (!member.matchPassword(password)) {
				throw new LoginFailException();
			}	//DB의 값과 PASSWORD가 맞지 않으면 로그인 실패 
	
			return new User(member.getId(), member.getName());	//로그인 성공시 USER객체로 아이디와 DB안에서 일치하는 이름 리턴 
		}
		catch (SQLException e) {
			throw new RuntimeException(e);
		}	//디비 연결 중 오류가 생길 때 오류 출력 
	}
}
