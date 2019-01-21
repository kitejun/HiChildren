package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class memberDAO {
	private Connection conn=null; // 데이터베이스를 접근하기 위한 객체
	private PreparedStatement pstmt=null;
	private ResultSet rs; // 정보를 담을 수 있는 변수를 만들어준다.
//mysql 처리부분
	public memberDAO() {
		// 생성자를 만들어준다.
		try {
			String dbURL = "jdbc:mysql://localhost:3306/bbs?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "health";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
//로그인 처리부분
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				}
			} else {
				return 0; // 비밀번호 불일치
			}
			return -1; // 아이디없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}
	
	public int join(memberVO user) {
		String SQL = "INSERT INTO USER VALUES (?,?,?,?,?)";
		try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, user.getM_id());
		pstmt.setString(2, user.getM_pw());
		pstmt.setString(3, user.getM_name());
		pstmt.setString(4, user.getM_age());
		pstmt.setString(5, user.getM_gender());
	
		return pstmt.executeUpdate();
		} catch (Exception e) {
		e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
		}
}