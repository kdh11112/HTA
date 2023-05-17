<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
		<!-- include libraries(jQuery, bootstrap) -->
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
		<link rel="shortcut icon" href="#">
		<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
		<title>회원가입</title>
		<style type="text/css">
			a, a:hover {
			color: #000000;
			text-decoration: none;
			}
		</style>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>

<body class="sb-nav-fixed">
	 <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark"><%@ include file="../menu/navi.jsp" %></nav>
     <div id="layoutSidenav"> 
     <div id="layoutSidenav_nav"><%@ include file="../menu/side.jsp" %></div>  
     <div id="layoutSidenav_content">
         <main>
			<div class="container-fluid px-4">
			<h1 class="mt-4">게시판</h1>
       		<div class="card mb-4">
       		
       			<table class="table table-striped"
						style="text-align: center; border: 1ps solid #dddddd">
       			<h2>게시글 리스트</h2>
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
                    <td>1</td>
                    <td>안녕하세요</td>
                    <td>홍길동</td>
                    <td>2023-05-17</td>
                    </tr>
                 </tbody>
               </table>
               <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
       	</div>
       </div>
       	</main>
       	<footer class="py-4 bg-light mt-auto"><%@ include file="../menu/footer.jsp" %></footer>
       </div>
	</div>
	<!--  애니메이션 담당 JQUERY -->
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!--  부트스트랩 JS -->
	<script src="js/bootstrap.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../js/scripts.js"></script><!-- 사이드바 열고 닫기 -->
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
</body>
</html>