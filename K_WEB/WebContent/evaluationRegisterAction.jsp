<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="evaluation.EvaluationDTO"%>

<%@ page import="evaluation.EvaluationDAO"%>

<%@ page import="util.SHA256"%>

<%@ page import="java.io.PrintWriter"%>

<%

	request.setCharacterEncoding("UTF-8");

	String userID = null;
	if(session.getAttribute("userID")!=null){
		userID=(String)session.getAttribute("userID");
	}	
	//사용자가 로그인이 되어 있지 않을 경우... 로그인 페이지로 넘어가게 한다.
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href = 'userLogin.jsp';");
		script.println("</script>");
		script.close();	
		return;
	}
	//int evaluationID; 자동 증가하므로 제외한다.
	//String userID; 위에 정의가 되어 있으므로 제외한다.
	String lectureName=null;
	String professorName=null;
	int lectureYear=0;
	String semesterDivide=null;
	String lectureDivide=null;
	String evaluationTitle=null;
	String evaluationContent=null;
	String totalScore=null;
	String creditScore=null;
	String comfortableScore=null;
	String lectureScore=null;
	//int likeCount; 자동으로 나오니까 제외한다.


	if(request.getParameter("lectureName") != null) {

		lectureName = (String) request.getParameter("lectureName");

	}

	if(request.getParameter("professorName") != null) {

		professorName = (String) request.getParameter("professorName");

	}

	if(request.getParameter("lectureYear") != null) {
	try{
		lectureYear=Integer.parseInt(request.getParameter("lectureYear"));		
	}catch(Exception e){
		System.out.println("강의 연도 데이터 오류");
	}
	
	}

	if(request.getParameter("semesterDivide") != null) {

		semesterDivide = (String) request.getParameter("semesterDivide");

	}
	if(request.getParameter("lectureDivide") != null) {

		lectureDivide = (String) request.getParameter("lectureDivide");

	}
		

	if(request.getParameter("evaluationTitle") != null) {

		evaluationTitle = (String) request.getParameter("evaluationTitle");

	}

	if(request.getParameter("evaluationContent") != null) {

		evaluationContent = (String) request.getParameter("evaluationContent");

	}

	if(request.getParameter("totalScore") != null) {

		totalScore = (String) request.getParameter("totalScore");

	}


	if(request.getParameter("creditScore") != null) {

		creditScore = (String) request.getParameter("creditScore");

	}

	if(request.getParameter("comfortableScore") != null) {

		comfortableScore = (String) request.getParameter("comfortableScore");

	}


	if(request.getParameter("lectureName") != null) {

		lectureName = (String) request.getParameter("lectureName");

	}

	if(request.getParameter("lectureScore") != null) {

		lectureScore = (String) request.getParameter("lectureScore");

	}



	if (lectureName == null || professorName == null || lectureYear == 0 ||semesterDivide==null 
		||lectureDivide==null||evaluationTitle==null||totalScore==null
		||creditScore==null||comfortableScore==null||lectureScore==null
		||evaluationTitle.equals("")||evaluationContent.equals("")) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('입력이 안 된 사항이 있습니다.');");

		script.println("history.back();");

		script.println("</script>");

		script.close();
		
		return;

	} 
		
		EvaluationDAO evaluationDAO=new EvaluationDAO(); //초기화	
	
		int result = evaluationDAO.write(new EvaluationDTO(0,userID,lectureName,professorName,
				lectureYear, semesterDivide,lectureDivide,evaluationTitle,evaluationContent,
				 totalScore, creditScore,comfortableScore,lectureScore,0));

		
		if (result == -1) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('강의평가 게시를 실패하였습니다.');");

			script.println("history.back();");

			script.println("</script>");

			script.close();

		} else {

			

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("location.href = 'index.jsp';");

			script.println("</script>");

			script.close();

		}
%>



