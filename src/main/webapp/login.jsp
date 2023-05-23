<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
		<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>로그인</title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/login.css"> 
    	<script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    	<link href="https://fonts.googleapis.com/css2?family=Alata&display=swap" rel="stylesheet">
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
					type: "POST",
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
	</head>
	<body>
	    <div class="page-container">
        	<div class="login-form-container shadow">
            	<div class="login-form-right-side">
                	<div class="top-logo-wrap">
                	
                	</div>
                	<h1>Welcome!</h1>
                	<p>In computer security, logging in is the process by which an individual gains access to a computer system by identifying and authenticating themselves.</p>
	            
	            	</div>
	            	<div class="login-form-left-side">
                		<div class="login-top-wrap">
                    		<span>Don't have an account?</span>
                    		<a href='register/newRegi.jsp'>
                    			<button class="create-account-btn shadow-light">Sign Up</button>
                    		</a>
                		</div>
                		<form name="frm" action="register/login_Ok.jsp" method="post">
                			<table>
                				<div class="login-input-container">
                    				<div class="login-input-wrap input-id">
                        				<i class="far fa-envelope"></i>
                        				<input placeholder="ID" type="text" name="log_id" id="log_id" value="KDH">
                    				</div>
                    				<div class="login-input-wrap input-password" >
                        				<i class="fas fa-key"></i>
                        				<input placeholder="Password"  type="password" name="log_pw" id="log_pw" value="1234">
                    				</div>
                				</div>
                				<div class="login-btn-wrap">
                    				<input type="button" class="login-btn" value="로그인" id="loginbtn">
                				</div>
                			</table>
                		</form>
            		</div>
        		</div>
    		</div>

	</body>
</html>