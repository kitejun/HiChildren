<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description"
	content="Digital marketing courses website template that can help you boost your business courses website and its completely free.">
<meta name="keywords"
	content="seo,free website template, free responsive website template, seo marketing, search engine optimization, web analytics">
<title>아동위한 스트레칭 프로그램</title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Style CSS -->
<link href="css/style.css" rel="stylesheet">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
	rel="stylesheet">
<!-- FontAwesome CSS -->
<link rel="stylesheet" type="text/css" href="css/fontello.css">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/owl.carousel.min.css" rel="stylesheet">
<link href="css/owl.theme.default.css" rel="stylesheet">


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
								<li class="active"><a href="course.jsp" title="">스트레칭 코스</a></li>
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
	<br>
	<br>
	<div class="container">
		<div class="img-responsive center-block">
			<div class="row">

				<div class="col-md-offset-2 col-md-5 col-xs-12">
					<div class="card horizontal">
						<div class="card text-center" style="width: 18rem;">
							<img src=images/Mox.jpg>
							<div class="card-body">
								<h2>김 연 준</h2>
								<h3>컴퓨터공학과</h3>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="col-md-offset-0 col-md-5 col-xs-12">
					<div class="card horizontal">
						<div class="card text-center" style="width: 18rem;">
							<img src=images/che.jpg>
							<div class="card-body">
								<h2>최 예 진</h2>
								<h3>컴퓨터공학과</h3>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="col-md-offset-2 col-md-5 col-xs-12">
					<div class="card horizontal">
						<div class="card text-center" style="width: 18rem;">
							<img src=images/Mox.jpg>
							<div class="card-body">
								<h2>염 유 진</h2>
								<h3>컴퓨터공학과</h3>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-offset-0 col-md-5 col-xs-12">
					<div class="card horizontal">
						<div class="card text-center" style="width: 18rem;">
							<img src=images/Mox.jpg>
							<div class="card-body">
								<h2>김 효 빈</h2>
								<h3>소프트웨어공학과</h3>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	<%@include file="footer.jsp"%>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery.min.js" type="text/javascript"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/menumaker.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.sticky.js"></script>
	<script type="text/javascript" src="js/sticky-header.js"></script>
	<script type="text/javascript" src="js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="js/slider.js"></script>
</body>
</html>