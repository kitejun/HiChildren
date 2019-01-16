package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

//데이터베이스 접근...
public class UserDAO {

	
	//아이디와 로그인 받아서 정수형으로 반환
	public int login(String userID,String userPassword) {
		String SQL="SELECT userpassword FROM USER WHERE userID = ?";
		Connection conn=null;
		PreparedStatement pstmt=null; 
		ResultSet rs= null;
		try {
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userID); //사용자한테 입력 받은 데이터를 SQL문 안의 물음표 안에 넣어준다.
			rs=pstmt.executeQuery();
			if(rs.next()) {
				//존재한다면
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공
					
				}
				else {
					return 0; //비밀번호 틀림
				}
			}
			return -1; //결과 존재 x -> 아이디 존재 안함.
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally 
		{
		try {   if(conn!=null) conn.close();}catch(Exception e) {e.printStackTrace();};
		try {	if(pstmt!=null) pstmt.close();}catch(Exception e) {e.printStackTrace();};
		try {	if(rs!=null) rs.close();}catch(Exception e) {e.printStackTrace();};
			
		}
		return -2; //데이터 베이스 오류...
	}
	//사용자 정보 입력 받아 회원가입 도와줌
	public int join(UserDTO user) {
		String SQL="INSERT INTO USER VALUES(?, ?, ?, ?, false)"; //이메일 인증 안 했으므로 false
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID()); //사용자한테 입력 받은 데이터를 SQL문 안의 물음표 안에 넣어준다.
			pstmt.setString(2, user.getUserPassword()); //사용자한테 입력 받은 데이터를 SQL문 안의 물음표 안에 넣어준다.
			pstmt.setString(3, user.getUserEmail()); //사용자한테 입력 받은 데이터를 SQL문 안의 물음표 안에 넣어준다.
			pstmt.setString(4, user.getUserEmailHash()); //사용자한테 입력 받은 데이터를 SQL문 안의 물음표 안에 넣어준다.
			return pstmt.executeUpdate(); //데이터 개수.. 1 이라는 값을 반환.
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
		try {   if(conn!=null) conn.close();}catch(Exception e) {e.printStackTrace();};
		try {	if(pstmt!=null) pstmt.close();}catch(Exception e) {e.printStackTrace();};
		try {	if(rs!=null) rs.close();}catch(Exception e) {e.printStackTrace();};
			
	}
		return -1; //회원가입 실패..
	}
	
	// 특정 회원의 이메일을 알아내는 함수. id를 받아서 ... 결과값은 string
	public String getUserEmail(String userID) {
		
		String SQL="SELECT userEmail FROM USER WHERE userID= ?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userID); //사용자한테 입력 받은 데이터를 SQL문 안의 물음표 안에 넣어준다.
			
			rs= pstmt.executeQuery(); 
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
		try {   if(conn!=null) conn.close();}catch(Exception e) {e.printStackTrace();};
		try {	if(pstmt!=null) pstmt.close();}catch(Exception e) {e.printStackTrace();};
		try {	if(rs!=null) rs.close();}catch(Exception e) {e.printStackTrace();};
			
	}
		return null; //데이터베이스 오류
	}
	
	
	
	
	// 이메일 검증. 즉 특정한 아이디 값을 갖은 사용자가 이메일 검증을 가졌는지..?
	//특정한 사용자가 이메일 인증 완료를 도와주는 함수
	public boolean getUserEmailChecked(String userID) {
		String SQL="SELECT userEmailChecked FROM USER WHERE userID= ?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userID); //사용자한테 입력 받은 데이터를 SQL문 안의 물음표 안에 넣어준다.
			
			rs= pstmt.executeQuery(); 
			if(rs.next()) {
				return rs.getBoolean(1); //true 반환
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
		try {   if(conn!=null) conn.close();}catch(Exception e) {e.printStackTrace();};
		try {	if(pstmt!=null) pstmt.close();}catch(Exception e) {e.printStackTrace();};
		try {	if(rs!=null) rs.close();}catch(Exception e) {e.printStackTrace();};
			
	}
		return false; //데이터베이스 오류
	}
	
	//특정 사용자의 이메일 검증을 완료 시켜준다.
	public boolean setUserEmailChecked(String userID) {
		String SQL="UPDATE USER SET userEmailChecked=true WHERE userID= ?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userID); //사용자한테 입력 받은 데이터를 SQL문 안의 물음표 안에 넣어준다.
			pstmt.executeUpdate();
			return true;
			//이미 인증되어도 인증을 시켜줘야함.
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
		try {   if(conn!=null) conn.close();}catch(Exception e) {e.printStackTrace();};
		try {	if(pstmt!=null) pstmt.close();}catch(Exception e) {e.printStackTrace();};
		try {	if(rs!=null) rs.close();}catch(Exception e) {e.printStackTrace();};
			
	}
		return false; //데이터베이스 오류
	}
	
}
