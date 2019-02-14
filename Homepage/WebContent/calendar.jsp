<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@page import="STR.*"%>
<%@page import="java.util.*"%>

<jsp:useBean id="user" class="member.memberVO" scope="page" />
<jsp:setProperty name="user" property="userID" />

<!DOCTYPE html>
<html>
<head>
<title>아동위한 스트레칭 프로그램</title>
<%!STR.CDAO dao = new STR.CDAO();
	//dao.dbConn();   db 연결 확인 작업 
	List<Object> date = new ArrayList<Object>();
	List<Integer> c_num = new ArrayList<Integer>();
	int[] num;%>
<%
	String userID = null;
	userID = (String) session.getAttribute("userID");
	ArrayList<STR.CDTO> list = dao.CList(userID);
	for (STR.CDTO dto : list) {

		date.add(dto.getDate());
		c_num.add(new Integer(dto.getc_num()));
	}
	num = new int[c_num.size()];

	int size = 0;

	for (int temp : c_num) {
		num[size++] = temp;
	}
%>

<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous">
	
</script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<link href='./resources/js/fullcal/fullcalendar.min.css'
	rel='stylesheet' />
<link href='./resources/js/fullcal/fullcalendar.print.min.css'
	rel='stylesheet' media='print' />
<link rel="stylesheet" type="text/css"
	href='./resources/js/fullcal/fullcalendar.css' />
<script type="text/javascript"
	src='./resources/js/fullcal/lib/moment.min.js'></script>
<script type="text/javascript"
	src='./resources/js/fullcal/lib/jquery.min.js'></script>
<script type="text/javascript"
	src='./resources/js/fullcal/fullcalendar.min.js'></script>
<script type="text/javascript" src='./resources/js/fullcal/locale/ko.js'></script>
<script type="text/javascript"
	src='./fullcalendar-2.9.1/fullcalendar.js' charset='euc-kr'></script>
<script type="text/javascript">
	$(document).ready(
		function() {
			$('#calendar')
				.fullCalendar(
										{
											header : {
												left : 'prev,next today',
												center : 'title',
												right : 'month,listYear'
											}

											,
											lang : 'ko',
											eventLimit : true,
											navLinks : true, // can click day/week names to navigate views

											select : function(start, end) {
												var title = prompt('일정을 입력하세요:');
												var eventData;
												if (title) {
													eventData = {
														title : title,
														start : start,
														end : end
													};
													$('#calendar')
															.fullCalendar(
																	'renderEvent',
																	eventData,
																	true); // stick? = true
												}
												$('#calendar').fullCalendar(
														'unselect');
											}
											, events : [ 
											<%
											for (int i = 0; i < date.size(); i++) {
												String img = null;
								
												if (num[i] > 4)
													img = "./images/best.png";
												else if (num[i] > 3)
													img = "./images/blue.png";
												else if (num[i] > 1)
													img = "./images/red.png";
												else
													img = "./images/bad.jpg";
											%>
											{
												title : '참 잘했어요!',
												start : '<%=date.get(i)%>',
												imageurl : '<%=img%>',
												color : "#ffffff"
											} ,

											<%
											}
												date.clear();
												c_num.clear();
											%>
											]
											//이미지 크기 지정
											,
											eventRender : function(event,eventElement) {
												if (event.imageurl) {
													eventElement
															.find(
																	"span.fc-title")
															.prepend(
																	"<center><img src='" + event.imageurl +"' width='77' height='77'><center>");
												}
											}

										});
					});
</script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#loading {
	display: none;
	position: absolute;
	top: 10px;
	right: 10px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<div class="container">
		<div class="img-responsive center-block">

			<a href="index.jsp" class="btn btn-success btn-sm" role="button"
				aria-pressed="true">홈으로</a> &emsp; &emsp; <img
				src="./images/best.png" width="100" height="100" alt="최고 도장"
				class="img-rounded"> <strong>: Best 도장(5개)</strong> &emsp; <img
				src="./images/blue.png" width="100" height="100" alt="파랑 도장"
				class="img-rounded"> <strong>: 파란색 도장(4개)</strong> &emsp; <img
				src="./images/red.png" width="100" height="100" alt="빨강색 도장"
				class="img-rounded"> <strong>: 빨강색 도장(2~3개)</strong> &emsp; <img
				src="./images/bad.jpg" width="100" height="100" alt="나쁜 도장"
				class="img-rounded"> <strong>: 나쁜 도장(1개)</strong> <br> <br>
			<div id='loading'>로딩중입니다..</div>

			<div id='calendar'></div>
		</div>
	</div>
	<%
		
	%>
</body>
</html>