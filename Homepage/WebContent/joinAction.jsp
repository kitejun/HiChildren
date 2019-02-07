<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.memberDAO"%>
<%@ page import="java.io.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="member" class="member.memberVO" scope="page" />
<jsp:setProperty name="member" property="userNum" />
<jsp:setProperty name="member" property="userID" />
<jsp:setProperty name="member" property="userPassword" />
<jsp:setProperty name="member" property="userName" />
<jsp:setProperty name="member" property="userGender" />
<jsp:setProperty name="member" property="userAge" />



<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
    <title>아동위한 스트레칭 프로그램</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
			userID = (String) session.getAttribute("userID");//유저아이디에 해당 세션값을 넣어준다.
		}
		if (userID!= null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		 
			if (member.getUserID() == null || member.getUserPassword() == null || member.getUserName() == null
			|| member.getUserAge() == null || member.getUserGender() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다')");
		script.println("history.back()");
		script.println("</script>");
			} else {
		member.memberDAO memberDAO = new member.memberDAO();
		int result = memberDAO.join(member);
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다')");
			script.println("history.back()");
			script.println("</script>");
		} 
		else if (result == -2) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('DB오류')");
			script.println("history.back()");
			script.println("</script>");
		} 
		else {
			session.setAttribute("userID", member.getUserID()); 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='index.jsp'");
			//script.println("history.back()");
			script.println("</script>");
		}
			}
	%>
</body>
</html>