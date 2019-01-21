<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="STR.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>도서목록</h2>
	<table border="1">
		<tr>
			<th>스트레칭상태</th>
			<th>사용자넘버</th>
			<th>스트레칭이름</th>
			<th>갯수</th>
			<th>체크</th>
			<th>날짜</th>
		</tr>
		<%
			STRDAO dao = new STRDAO();
			//dao.dbConn();   db 연결 확인 작업
			ArrayList<STRDTO> list = dao.bookList();
			for (STRDTO dto : list) {
		%>
		<tr>
			<td><%=dto.getStr_status()%></td>
			<td><%=dto.getUserNum()%></td>
			<td><%=dto.getStr_name()%></td>
			<td><%=dto.getCount()%></td>
			<td><%=dto.getCheck()%></td>
			<td><%=dto.getDate()%></td>
		</tr>



		<%
			} //for 문의 끝
		%>
	</table>
</body>
</html>