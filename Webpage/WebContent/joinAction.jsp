<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.memberDAO"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="member.memberVO" scope="request" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String m_id = null;
	if (session.getAttribute("m_id") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
		m_id = (String) session.getAttribute("m_id");//유저아이디에 해당 세션값을 넣어준다.
	}
	if (m_id!= null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}
	 
		if (member.getM_id() == null || member.getM_pw() == null || member.getM_name() == null
				|| member.getM_age() == null || member.getM_gender() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			memberDAO memberDAO = new memberDAO();
			int result = memberDAO.join(member);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				session.setAttribute("m_id", member.getM_id()); 
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='main.jsp'");
				//script.println("history.back()");
				script.println("</script>");
			}
		}
	%>
</body>
</html>