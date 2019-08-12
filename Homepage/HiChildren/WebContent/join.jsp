<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1.0">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/custorm.css">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description"
	content="Espa - provide the easy responsive free website templates. You can easily customize and make your own website for your startup business.">
<meta name="keywords"
	content="bootstrap template, Responsive Template, Website Template, free website templates, free website template download ">
<title>아동위한 스트레칭 프로그램</title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- style css -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<!-- animsition css -->
<link rel="stylesheet" type="text/css" href="css/animsition.min.css">
<!-- Font Awesome CSS -->
<link href="css/font-awesome.min.css" rel="stylesheet">
<!-- font css -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Merriweather:400,400i,700,700i,900,900i"
	rel="stylesheet">

</head>
<title>아동을 위한 스트레칭 프로그램</title>
</head>

<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>

	<%
		if (userID == null) {
	%>
	<div class="header-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-sm-4 col-md-2 col-xs-12">
					<div class="logo">
						<a href="index.jsp"><img src="./images/Hi.png"
							class="img-responsive" alt=""></a>
					</div>
				</div>
				<div class="col-lg-8 col-md-10 col-sm-8 col-xs-12">
					<div class="navigation-wrapper">
						<div id="navigation">
							<ul>
								<li class="active"><a href="index.jsp" title="">홈으로</a></li>
								<li class="active"><a href="course.jsp" title="">스트레칭
										코스</a></li>
								<li><a href="people.jsp" title="">만든사람들</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-2 hidden-md hidden-sm hidden-xs">
					<a href="login.jsp" class="btn btn-primary">로그인</a> <a
						href="join.jsp" class="btn btn-primary">회원가입</a>
				</div>

			</div>
		</div>
	</div>

	<%
		} else {
	%>
	<div class="header-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-sm-4 col-md-2 col-xs-12">
					<div class="logo">
						<a href="index.jsp"><img src="./images/Hi.png"
							class="img-responsive" alt=""></a>
					</div>
				</div>
				<div class="col-lg-8 col-md-10 col-sm-8 col-xs-12">
					<div class="navigation-wrapper">
						<div id="navigation">
							<ul>
								<li class="active"><a href="index.jsp" title="">홈으로</a></li>
								<li class="active"><a href="course.jsp" title="">스트레칭코스</a></li>
								<li><a href="people.jsp" title="">만든사람들</a></li>

								<li class="has-sub"><a href="#" title="">회원정보</a>
									<ul>
										<li><a href="calendar.jsp" title="">달력</a></li>
										<li><a href="logoutAction.jsp" title="">로그아웃</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>

	<%
		}
	%>
	<!-- header-close -->

	<br>
	<br>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form action="joinAction.jsp" method=POST>
					<h3 style="text-align: center;">회원가입</h3>
					<br> <br> <br>

					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPassword" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름"
							name="userName" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="나이"
							name="userAge" maxlength="20">
					</div>

					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active"> <input
								type="radio" name="userGender" autocomplete="off" value="남자"
								checked>남자
							</label> <label class="btn btn-danger active"> <input
								type="radio" name="userGender" autocomplete="off" value="여자"
								checked>여자
							</label>
						</div>
					</div>
					<br> <br> <br> <br>
					<div class="in" align="center">
						<input type="submit" class="btn btn-primary" value="회원가입">
					</div>
				</form>
			</div>

		</div>
		<div class="col-lg-4"></div>

	</div>

	<br>
	<br>
	<br>
	<br>
	<br>

	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- footer start -->
	<div class="footer">
		<div class="container">
			<div class="row">
				<!-- footer-useful links-start -->
				<div class=" col-lg-3 col-md-3 col-sm-3 col-xs-12">
					<div class="footer-widget">
						<h3 class="footer-title">Quick Links</h3>
						<ul>
							<li><a href="index.jsp">Home</a></li>
							<li><a href="people.jsp">About us</a></li>
							<li><a href="course.jsp">stretching</a></li>
						</ul>
					</div>
				</div>
				<!-- footer-useful links-close -->
				<!-- footer-contactinfo-start -->
				<div class=" col-lg-4 col-md-4 col-sm-4 col-xs-12">
					<div class="footer-widget">
						<h3 class="footer-title">연구실 정보</h3>
						<div class="">
							<ul>
								<li><i class="fa fa-map-marker"></i> 한국산업기술대학교 E516</li>
								<li><i class="fa fa-phone"></i>031-1234-5678</li>
								<li><i class="fa fa-envelope"></i>www.kpu.ac.kr</li>
							</ul>
						</div>
						<a href="http://kpu.ac.kr" class="btn btn-primary btn-sm">학교홈페이지
							가기</a>
					</div>
				</div>
				<!-- footer-contactinfo-close -->
				<!-- footer-about-start -->
				<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 ">
					<div class="footer-widget">
						<h3 class="footer-title">HI CHILDREN!</h3>
						<p>
							지도교수: 이상호 교수님<br> 김연준<br>염유진<br>최예진<br>김효빈<br>
						</p>
					</div>
				</div>
				<!-- footer-about-close -->
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
					<div class="footer-line"></div>
				</div>


			</div>
		</div>
		<!-- footer-address-close -->
	</div>
	<!-- footer close -->

</body>
</html>