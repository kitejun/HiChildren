<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>데이터베이스로 연결하기</title>
</head>
<body>
	<H3>데이터베이스 연결 테스트</H3>

	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kinect_db?characterEncoding=UTF-8&serverTimezone=UTC", "mox", "1234");
        if (conn != null) {
                    out.println("webdb 데이터베이스로 연결했습니다.<BR>");
                    conn.close();
                    out.println("webdb 데이터베이스로의 연결을 끊었습니다.<BR>");
             }
             else {
                    out.println("webdb 데이터베이스로 연결할 수 없습니다.<BR>");
             }
      %>

</body>
</html>