<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<title>로그인</title>
		<!-- <script src ="../js/httpRequest.js"></script> -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script>
		$(function(){
			$("input[value='로그인']").on("click",checklogin);
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
			          	} else if (response.trim() === 'false') {
							alert('존재하지 않는 사원입니다.');
							location.replace('register/newRegi.jsp');
			            }
					} 
				});
			}
		}
</script>
	</head>
<body>
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
						<input type="button" value="로그인" id="loginbtn" />
						<a href='register/newRegi.jsp'>
						<input type="button" value="회원가입" />
						</a>
					</td>
				</tr>
			</table>
		</form>
</body>
</html>