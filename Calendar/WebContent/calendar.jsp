<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="STR.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<%
			STRDAO dao = new STRDAO();
			//dao.dbConn();   db 연결 확인 작업
			ArrayList<STRDTO> list = dao.bookList();
			for (STRDTO dto : list) {
%>
<%
			} //for 문의 끝
%>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous">
	
</script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<link href='./resources/js/fullcal/fullcalendar.min.css' rel='stylesheet' />
<link href='./resources/js/fullcal/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<link rel="stylesheet" type="text/css" href='./resources/js/fullcal/fullcalendar.css' />
<script type="text/javascript" src='./resources/js/fullcal/lib/moment.min.js'></script>
<script type="text/javascript" src='./resources/js/fullcal/lib/jquery.min.js'></script>
<script type="text/javascript" src='./resources/js/fullcal/fullcalendar.min.js'></script>
<script type="text/javascript" src='./resources/js/fullcal/locale/ko.js'></script>
<script type="text/javascript" src='./fullcalendar-2.9.1/fullcalendar.js' charset='euc-kr'></script>

<script>
	var date = "2019-01-21";
	$(document).ready(function() {
		$('#calendar').fullCalendar({
				header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,listYear'
				}
		
				,lang : 'ko'
				,editable : true
				,eventLimit : true
				,navLinks: true, // can click day/week names to navigate views
			     
				selectable: true,
			      selectHelper: true,
			      select: function(start, end) {
			        var title = prompt('일정을 입력하세요:');
			        var eventData;
			        if (title) {
			          eventData = {
			            title: title,
			            start: start,
			            end: end
			          };
			          $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
			        }
			        $('#calendar').fullCalendar('unselect');
			      }
				
				,events : [ 
					{
						title : '참 잘했어요!',
						start : "2019-01-05",
						imageurl : "./images/best.png",
						color : "#ffffff"
					}
					,{
						title : '참 잘했어요!',
						start : "2019-01-07",
						imageurl : "./images/red.png",
						color : "#ffffff"
					}
					,{
						title : '참 잘했어요!',
						start : "2019-01-25",
						imageurl : "./images/blue.png",
						color : "#ffffff"
					}
					,{
						title : '참 잘했어요!',
						start : date,
						imageurl : "./images/blue.png",
						color : "#ffffff"
					}
				]
				//이미지 크기 지정
				,eventRender : function(event, eventElement) {
					if (event.imageurl) {
						eventElement.find("span.fc-title").prepend("<center><img src='" + event.imageurl +"' width='77' height='77'><center>");
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

		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		<img src="./images/best.png" width="100" height="100" alt="빨강색 도장"
			class="img-rounded"> <strong>: Best 도장(5~4개)</strong> &emsp; <img
			src="./images/blue.png" width="100" height="100" alt="빨강색 도장"
			class="img-rounded"> <strong>: 파란색 도장(3~2개)</strong> &emsp; <img
			src="./images/red.png" width="100" height="100" alt="빨강색 도장"
			class="img-rounded"> <strong>: 빨강색 도장(1개)</strong>

		<div id='loading'>로딩중입니다..</div>
		<div id='calendar'></div>

	</div>
</body>
</html>