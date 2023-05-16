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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>Insert title here</title>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>



</head>


<body>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark"><%@ include
			file="../menu/navi.jsp"%></nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav"><%@ include file="../menu/side.jsp"%></div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">메인페이지입니다.</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">메인페이지</li>
					</ol>
					<div class="identity"></div>


				</div>
				<!-- 사용자 정보 start-->
				<div class="card" style="width: 18rem; margin-left:100px;">
					<img src=".../../images/after.PNG" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">김사원</h5>
						<p class="card-text">사원</p>
						<p class="card-text">개발팀</p>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">내 게시글<a href="#"
							class="card-link">Another link</a>
						</li>
						<li class="list-group-item">작성할 문서<a href="#"
							class="card-link">Another link</a></li>

					</ul>

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