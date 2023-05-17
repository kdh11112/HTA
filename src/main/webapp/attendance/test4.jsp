<%@page import="vo.EmployeeVO"%>
<%@page import="dao.AttendenceDAO"%>
<%@page import="vo.AttendenceVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset='utf-8' />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link href='../css/main.css' rel='stylesheet' />
<script src='../js/main.js'></script>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="../css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<link rel="shortcut icon" href="#">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="../attendance/main.css" />


<!--  FullCalendar  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>
<!--  FullCalendar  -->

<style>
.fc-day-top .attendance-time {
	font-size: 12px;
	color: #888;
	margin-bottom: 2px;
}
</style>

<!-- 스크립트 부분 -->
<script>

<%
	EmployeeVO vo2 = new EmployeeVO();
	vo2.seteNumber(31);
	vo2.seteName("hong");
	session.setAttribute("vo", vo2);
	
	Object obj = session.getAttribute("vo");
	if(obj != null){
	EmployeeVO vo =(EmployeeVO) obj;
	%>
	var eNumber = <%=vo.geteNumber() %>; 
	<%

}

%>
	$(document).ready(function() {
		// FullCalendar를 초기화합니다.
		$('#calendar').fullCalendar({
			// FullCalendar 옵션 설정...
			dayRender : function(date, cell) {
				// 날짜 요소에 시간을 추가하기 위해 data-date 속성을 설정합니다.
				var formattedDate = moment(date).format('YYYY-MM-DD');
				cell.attr('data-date', formattedDate);
			}
		});
	});

	function markAttendance(type) {
		// 출근 또는 퇴근 버튼을 클릭했을 때의 동작을 처리
		var currentDate = $('#calendar').fullCalendar('getDate');

		var formattedDate = moment(currentDate).format('YYYY-MM-DD');

		console.log(formattedDate);

		// 시간을 가져와서 해당 날짜의 날짜 요소에 출력
		var currentTime = moment().format('HH:mm');
		console.log(currentTime);
		var attendanceTime = " "+ currentTime;
		$('[data-date="' + formattedDate + '"]').append(
				'<span class="attendance-time name="time">' + attendanceTime + '</span>');

		if (type == "1") {

			$.ajax({
				url : "startTime.jsp",
				data:{
					id:eNumber
				},
				success : function(data) {
					console.log(data.trim());//공백제거
					var data2 = data.trim();

				}
			});

		} else {
		// endtime.jsp?id=141
			$.ajax({
				url : "endTime.jsp",
				data:{
					id:eNumber
				},
				success : function(data) {
					console.log(data.trim());//공백제거
					var data2 = data.trim();
					
				}
			});
		}
	}
</script>
<!-- 스크립트 부분 -->
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

					<div id="calendar"></div>
					<!-- 출근 버튼 -->
					<button onclick="markAttendance('1')">출근</button>
					<!-- 퇴근 버튼 -->
					<button onclick="markAttendance('2')">퇴근</button>

				</div>

				<div id="startHour">출근시간</div>
				<div id="quitHour">퇴근시간</div>
				<div id="lateHour">지각시간</div>
				<div id="overHour">연장근무시간</div>
				<button>연장근무신청</button>
				<div id="todayworkingHour">오늘 근무시간</div>
				<div id="vacationStatus">연차/반차 현황</div>

				<button>연차신청</button>

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