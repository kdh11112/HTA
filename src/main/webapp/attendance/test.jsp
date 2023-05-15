<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link href='../css/main.css' rel='stylesheet' />
<script src='../js/main.js'></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="../css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<link rel="shortcut icon" href="#">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	document
			.addEventListener(
					'DOMContentLoaded',
					function() {
						var calendarEl = document.getElementById('calendar');

						var calendar = new FullCalendar.Calendar(
								calendarEl,
								{

									headerToolbar : {
										left : 'prev,next today',
										center : 'title',
										right : 'dayGridMonth,listYear'
									},
									locale : 'ko',

									displayEventTime : false, // don't show the time column in list view

									// THIS KEY WON'T WORK IN PRODUCTION!!!
									// To make your own Google API key, follow the directions here:
									// http://fullcalendar.io/docs/google_calendar/
									googleCalendarApiKey : 'AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE',

									eventSources : [
									// 대한민국의 공휴일
									{
										googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com",
										className : "koHolidays",
										color : "#00ff00",
										textColor : "#000000"
									} ],

									eventClick : function(arg) {
										// opens events in a popup window
										window.open(arg.event.url,
												'google-calendar-event',
												'width=700,height=600');

										arg.jsEvent.preventDefault() // don't navigate in main tab
									},

									loading : function(bool) {
										document.getElementById('loading').style.display = bool ? 'block'
												: 'none';
									}

								});

						calendar.render();
					});
</script>

<script>
	function startTime() {
		var now = new Date();
		console.log(now);
		console.dir(now);
		$("input[value='출근']").on("click", function() {
			console.log("출근");
		})

		var year = now.getFullYear();
		console.log(year);

		var startTime = now.getFullYear() + "년" + (now.getMonth() + 1) + "월"
				+ now.getDate() + "일" + now.getHours() + "시" + now.getMinutes()
				+ "분" + now.getSeconds() + "초";
		console.log(startTime);

		var timeEle = document.getElementById("span");
		timeEle.value = startTime;
		$("#span").html(now.getHours() + ":" + now.getMinutes());

		// 추가된 부분
		var startTimeDiv = document.getElementById("start-time");
		startTimeDiv.innerHTML = now.getMonth() + 1 + "월 " + now.getDate()
				+ "일 출근: " + now.getHours() + ":" + now.getMinutes();
	}

	function endTime() {
		var now = new Date();
		$("input[value='퇴근']").on("click", function() {
			console.log("퇴근");
		})

		var year = now.getFullYear(); // 연도를 출력
		console.log(year);

		var endTime = now.getFullYear() + "년" + (now.getMonth() + 1) + "월"
				+ now.getDate() + "일" + now.getHours() + "시" + now.getMinutes()
				+ "분" + now.getSeconds() + "초";
		console.log(endTime);

		var timeEle = document.getElementById("endTime");
		timeEle.value = startTime;
		$("#endTime").html(now.getHours() + ":" + now.getMinutes());
	}
</script>
<style>
body {
	margin: 0 auto;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
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
	margin: 10px;
}
</style>
</head>
<body>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark"><%@ include
			file="../menu/navi.jsp"%></nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav"><%@ include file="../menu/side.jsp"%></div>
		<div id="layoutSidenav_content">
			<main>
			<h2>근태관리</h2>
				<div class="container-fluid px-4">


					<div id='loading'>loading...</div>

					<div id='calendar'>
					
					
					</div>

					<div id="span"></div>
					<div id="endTime">퇴근시간</div>
					<div id="start-time"></div>
					<input type="button" value="출근" onclick="startTime();" /> <input
						type="button" value="퇴근" onclick="endTime();" />
						</div>
			</main>
			<footer class="py-4 bg-light mt-auto"><%@ include
					file="../menu/footer.jsp"%></footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../js/scripts.js"></script>
	<!-- 사이드바 열고 닫기 -->


</body>
</html>
