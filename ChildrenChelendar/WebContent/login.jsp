<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

<title>Insert title here</title>
</head>
<body>
	<div class="container">

		<form>
			<div class="form-group">
				<label for="exampleInputEmail1">아이디</label> <input type="email"
					class="form-control" id="exampleInputEmail1"
					placeholder="이메일을 입력하세요">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">비밀번호</label> <input
					type="password" class="form-control" id="exampleInputPassword1"
					placeholder="암호">
			</div>
			<div class="checkbox">
				<label> <input type="checkbox"> 아이디를 기억합니다
				</label>
			</div>
			<input type="submit" value="로그인" class="btn btn-default">
		</form>

	</div>
</body>
</html>