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

</style>

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
				<div class="card" style="width: 18rem; margin-left: 100px;">
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
				<div class="card attField">
					<div class="card-header">전자결재</div>
					<div class="card-body ">
						<!-- nav -->
						<nav class="navbar navbar-expand-lg bg-body-tertiary">
						  <div class="container-fluid">
						    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
						      <span class="navbar-toggler-icon"></span>
						    </button>
						    <div class="collapse navbar-collapse" id="navbarNav">
						      <ul class="navbar-nav">
						        <li class="nav-item">
						          <a class="nav-link active" aria-current="page" href="#">일반결재</a>
						        </li>
						        <li class="nav-item">
						          <a class="nav-link active" aria-current="page" href="#">임시저장함</a>
						        </li>
						        <li class="nav-item">
						          <a class="nav-link active" aria-current="page" href="#">내문서함</a>
						        </li>
						        <li class="nav-item">
						          <a class="nav-link active" aria-current="page" href="#">결재대기함</a>
						        </li>
						        <li class="nav-item">
						          <a class="nav-link active" aria-current="page" href="#">결재완료문서</a>
						        </li>
						      </ul>
						    </div>
						  </div>
						</nav>
						<!-- nav -->
						<table class="table-primary">
						<tr>
						  <td class="table-primary">결재승인부탁드립니다.</td>
						</tr>
						<tr>
						  <td class="table-primary">디자인확인부탁드립니다.</td>
						</tr>
						<tr>
						  <td class="table-primary">맘에안드는데 처음껄로 할게용</td>
						</tr>
						<tr>
						  <td class="table-primary">모던하면서 클래식한 디자인부탁드ㄹㅕ용</td>
						</tr>
						<tr>
						  <td class="table-primary">쥬길까</td>
						</tr>
						</table>
					</div>
				</div>
				<div class="card attField">
					<div class="card-header">사내메일</div>
					<div class="card-body ">
						<!-- nav -->
						<nav class="navbar navbar-expand-lg bg-body-tertiary">
						  <div class="container-fluid">
						    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
						      <span class="navbar-toggler-icon"></span>
						    </button>
						    <div class="collapse navbar-collapse" id="navbarNav">
						      <ul class="navbar-nav">
						        <li class="nav-item">
						          <a class="nav-link active" aria-current="page" href="#">받은메일함</a>
						        </li>
						        <li class="nav-item">
						          <a class="nav-link active" aria-current="page" href="#">보낸메일함</a>
						        </li>
						        <li class="nav-item">
						          <a class="nav-link active" aria-current="page" href="#">내게쓴메일함</a>
						        </li>
						        <li class="nav-item">
						          <a class="nav-link active" aria-current="page" href="#">임시보관함</a>
						        </li>
						        <li class="nav-item">
						          <a class="nav-link active" aria-current="page" href="#">휴지통</a>
						        </li>
						      </ul>
						    </div>
						  </div>
						</nav>
						<!-- nav -->
						<table class="table-primary">
						<tr>
						  <td class="table-primary">헿</td>
						</tr>
						<tr>
						  <td class="table-primary">쥬긴당</td>
						</tr>
						<tr>
						  <td class="table-primary">하입보이</td>
						</tr>
						<tr>
						  <td class="table-primary">뀨</td>
						</tr>
						<tr>
						  <td class="table-primary">쥬길까</td>
						</tr>
						</table>
					</div>
				</div>
				<div class="card r_attField">
					<div class="card-header">게시판</div>
					<div class="card-body ">
						<!-- nav -->
						<nav class="navbar navbar-expand-lg bg-body-tertiary">
						  <div class="container-fluid">
						    
						    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
						      <span class="navbar-toggler-icon"></span>
						    </button>
						    <div class="collapse navbar-collapse" id="navbarNav">
						      <ul class="navbar-nav">
						        <li class="nav-item">
						          <a class="nav-link active" aria-current="page" href="#">공지사항</a>
						        </li>
						        <li class="nav-item">
						          <a class="nav-link active" aria-current="page" href="#">자유게시판</a>
						        </li>
						      </ul>
						    </div>
						  </div>
						</nav>
						<!-- nav -->
						<table class="table-primary">
						<tr>
						  <td class="table-primary">공지공지</td>
						</tr>
						<tr>
						  <td class="table-primary">프리덤</td>
						</tr>
						<tr>
						  <td class="table-primary">춘식이 고구마</td>
						</tr>
						<tr>
						  <td class="table-primary">춘식이 고구마</td>
						</tr>
						<tr>
						  <td class="table-primary">춘식이 고구마</td>
						</tr>
						</table>
					</div>
				</div>
				<div class="card r_attField">
					<div class="card-header">일정관리</div>
					<div class="card-body ">
						<!-- nav -->
						<nav class="navbar navbar-expand-lg bg-body-tertiary">
						  <div class="container-fluid">
						    
						    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
						      <span class="navbar-toggler-icon"></span>
						    </button>
						    <div class="collapse navbar-collapse" id="navbarNav">
						      <ul class="navbar-nav">
						        <li class="nav-item">
						          <a class="nav-link active" aria-current="page" href="#">전체일정</a>
						        </li>
						        <li class="nav-item">
						          <a class="nav-link active" aria-current="page" href="#">개인일정</a>
						        </li>
						        <li class="nav-item">
						          <a class="nav-link active" aria-current="page" href="#">부서일정</a>
						        </li>
						        <li class="nav-item">
						          <a class="nav-link active" aria-current="page" href="#">회사일정</a>
						        </li>
						      </ul>
						    </div>
						  </div>
						</nav>
						<!-- nav -->
						<table class="table-primary">
						<tr>
						  <td class="table-primary">응애</td>
						</tr>
						<tr>
						  <td class="table-primary">디자인확인부탁드립니다.</td>
						</tr>
						<tr>
						  <td class="table-primary">맘에안드는데 처음껄로 할게용</td>
						</tr>
						<tr>
						  <td class="table-primary">모던하면서 클래식한 디자인부탁드ㄹㅕ용</td>
						</tr>
						<tr>
						  <td class="table-primary">쥬길까</td>
						</tr>
						</table>
					</div>
				</div>
				<div class="card r_attField">
					<div class="card-header">
					근태관리
					</div>
					<div class="card-body ">
						<!-- nav -->
						<nav class="navbar navbar-expand-lg bg-body-tertiary">
						  <div class="container-fluid">
						    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
						      <span class="navbar-toggler-icon"></span>
						    </button>
						    <div class="collapse navbar-collapse" id="navbarNav">
						      <ul class="navbar-nav">
						        <li class="nav-item">
						          <a class="nav-link active" aria-current="page" href="#">개인근태</a>
						        </li>
						        <li class="nav-item">
						          <a class="nav-link active" aria-current="page" href="#">연차관리</a>
						        </li>
						      </ul>
						    </div>
						  </div>
						</nav>
						<!-- nav -->
						<table class="table-primary">
						<tr>
						  <td class="table-primary">응애</td>
						</tr>
						<tr>
						  <td class="table-primary">디자인확인부탁드립니다.</td>
						</tr>
						<tr>
						  <td class="table-primary">맘에안드는데 처음껄로 할게용</td>
						</tr>
						<tr>
						  <td class="table-primary">모던하면서 클래식한 디자인부탁드ㄹㅕ용</td>
						</tr>
						<tr>
						  <td class="table-primary">쥬길까</td>
						</tr>
						</table>						
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