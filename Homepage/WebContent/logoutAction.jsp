<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%
	session.invalidate(); //세션을 뺐는다.
%>

<script>
location.href = "index.jsp"; // 세션삭제후 이동하는 페이지 설정
</script>
</body>
</html>