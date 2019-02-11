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
	<%@include file="header.jsp"%>
	<br>
	<br>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form action="joinAction.jsp" method=POST>
					<h3 style="text-align: center;">회원가입</h3>
					<br>
					<br>
					<br>

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
					<br>
					<br>
					<br>
					<br>
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

	<%@include file="footer.jsp"%>

</body>
</html>