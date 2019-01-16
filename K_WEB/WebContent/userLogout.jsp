<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%
	session.invalidate(); //사용자가 클라이언트에 모든 데이터 파기하면 된다.
%>
<script>
	location.href='index.jsp';
</script>



