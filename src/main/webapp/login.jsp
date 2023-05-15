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
		<title>Insert title here</title>
	
	</head>
	<body class="sb-nav-fixed">>
		<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark"><%@ include file="../menu/navi.jsp" %></nav>
		<div id="layoutSidenav"> 
		<div id="layoutSidenav_nav"><%@ include file="../menu/side.jsp" %></div>
			<div id="layoutSidenav_content">
				<main>
					<div>
						ID: <input type="text" name="log_id" id="log_id" /><br />
						PW: <input type="password" name="log_pw" id="log_pw" /><br />
						<input type="button" value="로그인" />
						<input type="button" value="회원가입" />
					</div>
				</main>  
				<footer class="py-4 bg-light mt-auto"><%@ include file="../menu/footer.jsp" %></footer>
 			</div>
 		</div>
 		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/scripts.js"></script><!-- 사이드바 열고 닫기 -->
</body>
</html>