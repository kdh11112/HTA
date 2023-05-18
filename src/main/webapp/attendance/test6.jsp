<%@page import="java.time.LocalDateTime"%>
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
<title>근태관리</title>

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
	Object obj = session.getAttribute("vo");
	String name = null;
	String dname = null;
	String position = null;
	int num = 0;
	LocalDateTime now = LocalDateTime.now();
	
	if(obj != null){
		EmployeeVO vo = (EmployeeVO)obj;
		name = vo.geteName();
		dname = vo.getdName();
		position = vo.geteOfficialResponsibilities();
		num = vo.geteNumber();
		
	%>
	var eNumber = <%=vo.geteNumber() %>;
	<%
	}
	%>
	

	function markAttendance(type) {
		if (type == "1") { //만약 출근 버튼을 누르면 jsp파일에 데이터가 넘어가서 데이터의 값을 가진애의 출근시간이 데이터에 넘어감. 
			// db에저장
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
		
		console.log("-------------------------------------");
		$.ajax({//db에서 출근 시간 가져오기
			type:"get",
			url :"getStartTime.jsp",
			dataType:"html",
			data:{
				id:eNumber
			},
			success:function(response,status,request){
				console.log("성공");
				console.log(response);
			$("#startHour").html(response.trim())
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
		
			
			$.ajax({//db에서 퇴근 시간 가져오기
				type:"get",
				url :"getEndTime.jsp",
				dataType:"html",
				data:{
					id:eNumber
				},
				success:function(response,status,request){
					console.log("성공");
					console.log(response);
				$("#quitHour").html(response.trim())
				}
			});
		}
		//시간정보 넘기기 끝
		
		
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

					
					<!-- 출근 버튼 -->
					<input type="button" id="btn" value="출근" onclick="markAttendance(1);"/>
					<!-- 퇴근 버튼 -->
					<input type="submit" value="퇴근" onclick="markAttendance(2);" />

				</div>
				<div>출근시간</div>	
				<div id="startHour">
				
				</div>
				<div>퇴근시간</div>
				<div id="quitHour">퇴근시간</div>
				<div>지각시간</div>
				<div id="lateHour">지각시간</div>
				<div>연장근무시간</div>
				<div id="overHour">연장근무시간</div>
				<button>연장근무신청</button>
				<div>오늘 근무시간</div>
				<div id="todayworkingHour">오늘 근무시간</div>
				<div>연차/반차 현황</div>
				<div id="vacationStatus">연차/반차 현황</div>

				<button>연차신청</button>

			</main>
			<footer class="py-4 bg-light mt-auto"><%@ include
					file="../menu/footer.jsp"%></footer>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="../js/scripts.js"></script>
	<!-- 사이드바 열고 닫기 -->
</body>
</html>