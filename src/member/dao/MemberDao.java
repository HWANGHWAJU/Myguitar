package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import jdbc.JdbcUtil;
import member.model.Member;

public class MemberDao {

	public Member selectById(Connection conn, String id) throws SQLException {

		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is = false;
		
		try {
			pstmt = conn.prepareStatement(
					"select * from member where Mem_id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			Member member = null;
			
			if (rs.next()) {
			member = new Member(
						rs.getString("Mem_id"), 
						rs.getString("Mem_pw"), 
						rs.getString("Mem_name"),
						rs.getString("Mem_age"),
						rs.getString("Mem_email"));
				is = false;
				System.out.println("동일있음.");
			} //동일한 아이디를 가지는 객체가 있다. 
			is=true;
			return member;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}



	public void insert(Connection conn, Member mem) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement("insert into member values(?,?,?,?,?)")) {
			pstmt.setString(1, mem.getId());
			pstmt.setString(2, mem.getPw());
			pstmt.setString(3, mem.getName());
			pstmt.setString(4, mem.getAge());
			pstmt.setString(5, mem.getEmai());
			pstmt.executeUpdate();
			JdbcUtil.close(pstmt);
		}

	}

	public boolean update(Connection conn, Member mem) throws SQLException {
		
		boolean isdone=false;
		
		try (PreparedStatement pstmt = conn.prepareStatement(
				"update member set Mem_pw = ?, Mem_name = ? where Mem_id = ?")) {
			pstmt.setString(1, mem.getPw());
			pstmt.setString(2, mem.getName());
			pstmt.setString(3, mem.getId());
			int a =pstmt.executeUpdate();
			System.out.println(a);
			isdone = true;
		}
		return isdone;
		
	}
}
