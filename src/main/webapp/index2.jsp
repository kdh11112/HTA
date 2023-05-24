<%@page import="vo.EmployeeVO"%>
<%@page import="java.time.LocalDateTime"%>
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
<link href='...//css/main.css' rel='stylesheet' />
<script src='.../../js/main.js'></script>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href=".../../css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<link rel="shortcut icon" href="#">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<style>
.attField {
	position: relative;
	left: 420px;
	bottom: 547px;
	width: 600px;
	margin-bottom:25px;
}
.r_attField{
position:relative;
left:1050px;
bottom:1119px;
width:600px;
margin-bottom:25px;
}
.card-header{
	background:#212529;
	color:white;
}
</style>
<script>
<%
Object obj = session.getAttribute("vo");
String name = null;
String dname = null;
String position = null;

int num = 0;
LocalDateTime now = LocalDateTime.now();

if (obj != null) {
	EmployeeVO vo = (EmployeeVO) obj;
	name = vo.geteName();
	dname = vo.getdName();

	position = vo.geteOfficialResponsibilities();
	num = vo.geteNumber();
%>
var eNumber = <%=vo.geteNumber()%>
;
<%}%>
</script>
<style>
.card-body{
	width:100%;
	height:300px;
	overflow: hidden;
}
main{
	height:500px;
}

</style>
</head>

	<script>
	$(document).ready(function() {
		$("#main_mail").load("/HTA_Project_semi/mail/mailRecivebox2.jsp");
		$("#main_board").load("/HTA_Project_semi/board/boardList2.jsp");
		$("#main_approval").load("/HTA_Project_semi/approval/approvalList2.jsp");
		$("#main_schedule").load("/HTA_Project_semi/schedule/mainpage_calendar_load.jsp");

	});
	$(function(){
		$("#main_mail").on("click",function(){
			console.log("test");
		})
	})
	
	</script>


<body>

	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark" style="width:100%"><%@ include
			file="../menu/navi.jsp"%></nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav"><%@ include file="../menu/side.jsp"%></div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<ol class="breadcrumb mb-4">
					</ol>
					<div class="identity"></div>


				</div>
				
				<!-- 사용자 정보 start-->
				<div class="card" style="width: 18rem; margin-left: 100px;">
					<img src=".../../images/after.PNG" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title"><%=name %></h5>
						<p class="card-text"><%=position %></p>
						<p class="card-text"><%=dname %></p>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">내 게시글<a href="#"
							class="card-link">Another link</a>
						</li>
						<li class="list-group-item">작성할 문서<a href="#"
							class="card-link">Another link</a></li>

					</ul>
				</div>
				<div class="card attField" style="bottom:720px;">
					<div class="card-header">전자결재</div>
					<div class="card-body " id="main_approval">
					
					</div>
				</div>
				<div class="card attField" style="bottom:711px;">
					<div class="card-header">사내메일</div>
					<div class="card-body " id="main_mail">
						
					</div>
				</div>
				<div class="card r_attField" style="bottom:1456px;">
					<div class="card-header">게시판</div>
					<div class="card-body " id="main_board">
					</div>
				</div>
				<div class="card r_attField" style="bottom:1448px;">
					<div class="card-header">일정관리</div>
					<div class="card-body " id="main_schedule">
					</div>
				</div>
				
			</main>
			<!-- 사용자 정보 end -->
			<footer class="py-4 bg-light mt-auto"><%@ include
					file=".../../menu/footer.jsp"%></footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src=".../../js/scripts.js"></script>
	<!-- 사이드바 열고 닫기 -->
</body>
</html>