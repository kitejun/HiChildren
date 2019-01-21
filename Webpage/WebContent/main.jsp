<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1.0", , shrink-to-fit=no>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custorm.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<title>아동을 위한 스트레칭 프로그램</title>
</head>

<style>
// 페이지의 높이를 브라우저 높이로 선언
html,body { height: 800px; margin: 0; padding: 0; }
#container {
min-height: 100%; 
// relative 선언을 통해 하단바의 absolute position 이 정확한 위치에 오도록 한다.
position: relative;
// content 시작 위치부터 그라디언트 효과가 나타나도록 한다.
background: #0202F7 url('images/gr.jpg') 0 70px repeat-x;
}
#container #footer {
// 하단바를 하단에 고정
position: absolute;
bottom: 0;
width: 100%;
height: 50px;
background-color: silver;
}
</style>

<body>
	<!-- 로그인이 된 사람들의 세션을 만들어 준다.
		 회원값이 있는 사람들은 userID에 정보가 담기게 되고
		 아닌 사람은 null값을 가지게 된다.
	-->
	<%
		String m_id = null;
		if (session.getAttribute("m_id") != null) {
			m_id = (String) session.getAttribute("m_id");
		}
	%>
	<nav class="navbar navbar-default">
		<div class="naver-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">

				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>

			</button>
			<a class="navbar-brand" href="main.jsp">아동을 위한 스트레칭 프로그램</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a>
				<li><a href="bbs.jsp">달력</a>
			</ul>
			<!-- 접속하기는 로그인안한 사람만 보여주게하기 -->
			<%
				if (m_id == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>

					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>

					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>

	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>
					아동을 위한<br>
					스트레칭 프로그램입니다
				</h1>
				<p>
					아동을 위한 스트레칭 사이트 입니다.<br> 어서오세요!
				</p>
			</div>
		</div>

		<img src="pororo.gif" width="100%" height="500px">
		
	</div>


	

<div id="container">

<div id="footer">Copyright &copy; 2018 김연준 All right reserved</div>

</div>


	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	
<script src="js/bootstrap.min.js"></script> 
</body>
</html>