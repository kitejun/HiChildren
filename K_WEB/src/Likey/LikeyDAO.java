package Likey;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DatabaseUtil;


public class LikeyDAO {
	private Connection conn;

	public LikeyDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/lectureEvaluation?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "ki5786";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int like(String userID, String evaluationID, String userIP) {
		String SQL = "INSERT INTO LIKEY VALUES (?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, evaluationID);
			pstmt.setString(3, userIP);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally 
		{
		try {   if(conn!=null) conn.close();}catch(Exception e) {e.printStackTrace();};
		try {	if(pstmt!=null) pstmt.close();}catch(Exception e) {e.printStackTrace();};
		try {	if(rs!=null) rs.close();}catch(Exception e) {e.printStackTrace();};
			
		}
		return -1; // 추천 중복 오류
	}
}