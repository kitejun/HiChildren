<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import= "java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
  Connection conn=null;
  try{
        String jdbcUrl= "jdbc:mysql://localhost:3306/bbs?characterEncoding=UTF-8&serverTimezone=UTC" ;
       String dbId="root";
        String dbPass= "ki5786";
        Class.forName("com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass);
       out.println("제대로 연결되었습니다.");
  }catch(Exception e){
           e.printStackTrace();
  }
%>
</body>
</html>