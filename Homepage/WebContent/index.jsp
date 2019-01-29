
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Digital marketing courses website template that can help you boost your business courses website and its completely free.">
    <meta name="keywords" content="seo,free website template, free responsive website template, seo marketing, search engine optimization, web analytics">
    <title>Digital Marketing Courses Website Template</title>
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
                                <li class="active"><a href="index.jsp" title="">홈으로</a></li>
                                  <li class="active"><a href="courses.html" title="">스트레칭 코스</a></li>
   
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
    <!-- slider-start -->
    <div class="slider">
        <div class="owl-carousel owl-theme">
            <div class="item"> <img src="./images/slider-1.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
                            <div class="slider-captions">
                                <h1 class="slider-title">캐릭터와 함께하는<br> <span class="slider-highlight-text">키크기 체조</span> 
                </h1>
                                <p class="slider-text hidden-xs">뽀로로와 함께해요 </p>
                                <a href="about.html" class="btn btn-default btn-lg hidden-sm hidden-xs"> 체조 배우러 가기</a> </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item"><img src="./images/slider-2.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7 col-md-7 col-sm-12  col-xs-12">
                            <div class="slider-captions">
                                <h1 class="slider-title">성장기 아동<br><span class="slider-highlight-text">키크기 체조</span></h1>
                                <p class="slider-text hidden-xs">키크기 체조는 사랑입니다. </p>
                                <a href="about.html" class="btn btn-default btn-lg hidden-sm hidden-xs"> 체조 배우러 가기</a> </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item"><img src="./images/slider-3.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7 col-md-7 col-sm-12  col-xs-12">
                            <div class="slider-captions">
                                <h1 class="slider-title">핑크퐁과 함께하는<br><span class="slider-highlight-text">키크기 체조
</span></h1>
                                <p class="slider-text hidden-xs">내가 더 키클꺼야 </p>
                                <a href="about.html" class="btn btn-default btn-lg  hidden-sm hidden-xs "> 체조 배우러가기</a> </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider-close -->
    <!-- counter-start-->
    <div class="space-small bg-default">
       
    </div>
    <!-- counter-close-->

    <div class="space-medium bg-default pdb150">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <div class="about-section">
                        <h1 class="text-white">성장기 아동을 위한 스트레칭 프로그램</h1>
                        <p class="lead">성장기 아동을 위한 스트레칭 프로그램입니다!</p>
                        <p>성장기 아동에게 도움</p>
                        <a href="#" class="btn btn-primary btn-lg">더 알아보기</a> </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <div class="about-img"><video src="pinkpong.mp4" width="555" height="400" autoplay class="img-responsive"></video>
                    </div>
                </div>
            </div>
            <!-- team-start -->
            <div class="row">
                <div class="col-md-12">
                    <div class="divider-line"></div>
                    <div class="team-block">
                        <div class="section-title">
                            <h1 class="text-white">다양한 체조 동작들을 알아보아요!</h1>
                            <p>본 프로그램에는 더 많은 체조 동작들이 있습니다.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="team-section">
                    <div class="team-img">
                        <a href="#"><img src="./images/team-1.jpg" alt="" class="img-circle"></a>
                    </div>
                    <div class="team-content mt20">
                        <h3 class="team-title">다리 스트레칭</h3>
                        <span class="team-meta">소요시간: 5분</span>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="team-section">
                    <div class="team-img ">
                        <a href="#"><img src="./images/team-2.jpg" alt="" class="img-circle"></a>
                    </div>
                    <div class="team-content mt20">
                        <h3 class="team-title">팔 스트레칭</h3>
                        <span class="team-meta">소요시간: 3분</span>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="team-section">
                    <div class="team-img ">
                        <a href="#"><img src="./images/team-3.jpg" alt="" class="img-circle"></a>
                    </div>
                    <div class="team-content mt20">
                        <h3 class="team-title">몸 스트레칭</h3>
                        <span class="team-meta">소요시간: 7분</span> </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="team-section">
                    <div class="team-img ">
                        <a href="#"><img src="./images/team-4.jpg" alt="" class="img-circle"></a>
                    </div>
                    <div class="team-content mt20">
                        <h3 class="team-title">얼굴 스트레칭</h3>
                        <span class="team-meta">소요시간: 10분</span> </div>
                </div>
            </div>
        </div>
    </div>
    <!-- team-close -->
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
