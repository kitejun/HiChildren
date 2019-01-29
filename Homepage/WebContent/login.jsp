<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1.0">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/custorm.css">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Digital marketing courses website template that can help you boost your business courses website and its completely free.">
    <meta name="keywords" content="seo,free website template, free responsive website template, seo marketing, search engine optimization, web analytics">
    <title>아동을 위한 스트레칭 프로그램</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Style CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    <!-- FontAwesome CSS -->
    <link rel="stylesheet" type="text/css" href="css/fontello.css">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/owl.carousel.min.css" rel="stylesheet">
    <link href="css/owl.theme.default.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<title>아동을 위한 스트레칭 프로그램</title>
</head>
<style>
// 페이지의 높이를 브라우저 높이로 선언
html,body { height: 100%; margin: 0; padding: 0; }
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
                        <a href="index.jsp"><img src="./images/logo.png" class="img-responsive" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-8 col-md-10 col-sm-8 col-xs-12">
                    <div class="navigation-wrapper">
                        <div id="navigation">
                            <ul>
                                <li class="active"><a href="index.jsp" title="">홈으로</a></li>
                                  <li class="active"><a href="index.jsp" title="">스트레칭 코스</a></li>
  
                                
                                <li><a href="contact.html" title="">만든사람들</a> </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 hidden-md hidden-sm hidden-xs"> <a href="login.jsp" class="btn btn-primary">로그인</a> <a href="join.jsp" class="btn btn-primary">회원가입</a> </div>
                
            </div>
        </div>
    </div>
    
  <% 	} else{ %>
		<div class="header-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-sm-4 col-md-2 col-xs-12">
                    <div class="logo">
                        <a href="index.html"><img src="./images/logo.png" class="img-responsive" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-8 col-md-10 col-sm-8 col-xs-12">
                    <div class="navigation-wrapper">
                        <div id="navigation">
                            <ul>
                                <li class="active"><a href="index.html" title="">홈으로</a></li>
                                  <li class="active"><a href="index.html" title="">스트레칭 코스</a></li>
   
                                <li class="has-sub"><a href="#" title="">회원정보</a>
                                    <ul>
                                        <li><a href="testimonials.html" title="">내정보</a></li>
                                        <li><a href="calendar.jsp" title="">달력</a></li>
                                        <li><a href="logoutAction.jsp" title="">로그아웃</a></li>
                                    </ul>
                                </li>
                                
                                <li><a href="contact.html" title="">만든사람들</a> </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 hidden-md hidden-sm hidden-xs"> <a href="login.jsp" class="btn btn-primary">로그인</a> <a href="join.jsp" class="btn btn-primary">회원가입</a> </div>
                
            </div>
        </div>
    </div>
    
    	<%
				}
			%>
			<!-- header-close -->
    <br><br><br><br><br><br>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align: center;">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPassword" maxlength="20">
					</div>
					<div class="in" align="center">
					<input type="submit" class="btn btn-primary"
						value="로그인">
					</div>
				</form>
			</div>

		</div>
		<div class="col-lg-4"></div>

	</div>
	<br><br><br><br><br>
	    <!-- footer start -->
    <div class="footer">
        <div class="container">
            <div class="row">
                <!-- footer-useful links-start -->
                <div class=" col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="footer-widget">
                        <h3 class="footer-title">Quick Links</h3>
                        <ul>
                            <li><a href="#">Home </a></li>
                            <li><a href="#">About us </a></li>
                            <li><a href="#">stretching</a></li>
                        </ul>
                    </div>
                </div>
                <!-- footer-useful links-close -->
                <!-- footer-contactinfo-start -->
                <div class=" col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="footer-widget">
                        <h3 class="footer-title">24 X 7 Support</h3>
                        <div class="">
                            <ul>
                                <li> <i class="fa fa-map-marker"></i> 한국산업기술대학교 E516</li>
                                <li><i class="fa fa-phone"></i>031-1234-5678</li>
                                <li><i class="fa fa-envelope"></i>www.kpu.ac.kr</li>
                            </ul>
                        </div>
                        <a href="#" class="btn btn-primary btn-sm">학교홈페이지 가기</a></div>
                </div>
                <!-- footer-contactinfo-close -->
                <!-- footer-about-start -->
                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 ">
                    <div class="footer-widget">
                        <h3 class="footer-title">아동을 위한 스트레칭 프로그램</h3>
                        <p> 아동을 위한 스트레칭 프로그램입니다.</p>
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







	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>