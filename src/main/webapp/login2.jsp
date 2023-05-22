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
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
		<link rel="shortcut icon" href="#">
		<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
		<title>로그인</title>
		<!-- <script src ="../js/httpRequest.js"></script> -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	</head>
	<body class="sb-nav-fixed">
	        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark"><%@ include file="../menu/navi.jsp" %></nav>
	        <div id="layoutSidenav"> 
	        <div id="layoutSidenav_nav"><%@ include file="../menu/side.jsp" %></div>  
	        <div id="layoutSidenav_content">
	            <main>
		         <div class="container-fluid px-4">
		         	<h1 class="mt-4">로그인</h1>
		         	<div class="card mb-4">
		         	<form name="frm" action="register/login_Ok.jsp" method="post">
						<table>
							<tr>
								<th>ID</th>
								<td><input type="text" name="log_id" id="log_id" /></td>
							</tr>
							<tr>
								<th>PW</th>
								<td><input type="password" name="log_pw" id="log_pw" /></td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="button" value="로그인" id="loginbtn"/>
									<a href='register/newRegi.jsp'>
									<input type="button" value="회원가입" />
									</a>
								</td>
							</tr>
						</table>
					</form>	
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto"><%@ include file="../menu/footer.jsp" %></footer>
			</div>
        </div>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        	<script src="../js/scripts.js"></script><!-- 사이드바 열고 닫기 -->
			<script>
	
			$(function(){
			    $("input[value='로그인']").on("click", checklogin);
			    $('#log_id, #log_pw').on('keypress', function(e){
			        if (e.keyCode === 13){
			            $('#loginbtn').click();
			        }
			    });
			});
				
				function checklogin(){
					var itxt = $("#log_id").val().trim();
					var ptxt = $("#log_pw").val().trim();
					if (itxt == '' || ptxt=='') {	//빈칸이라면
					$("#msg").html('');
				} else {
					$.ajax({
						type: "GET",
						async: true,	
			            dataType: "html", //전송받을 데이터 html,xml
						url: "register/login_Ok.jsp",
						data: {
							"e_id": itxt,
							"e_password" : ptxt
						},
						success: function(response){
							if (response.trim() === 'true') {
								alert('로그인 완료.');
								session.setAttribute("")
								location.replace('index.jsp');
				          	} else if (response.trim() === 'false') {
								alert('존재하지 않는 사원입니다.');
								location.replace('register/newRegi.jsp');
				            }
						} 
					});
				}
			}
			</script>
</body>
</html>