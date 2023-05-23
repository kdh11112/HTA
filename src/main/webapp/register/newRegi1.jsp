<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>

	<!-- 추가할것 :
	1. 전화번호 숫자만 입력 가능하게
	2. 상세주소 무조건 입력하게 required = required (나중에추가)
	3. d_name 가입시 기본값?
	4. datepicker 값 넘기기 (완료)
	5. gender 값 넘기기 (완료)
	
 -->
<style>
* {
	margin: 0px;
	box-sizing: border-box;
	font-size: 11px;
}

html {
	width: 100%;
	display: flex;
	justify-content: center;
	padding-top: 20px;
	padding-bottom: 20px;
}

body {
	width: 45%;
	border: 1px solid black;
}

input {
	border: 1px solid black;
	border-radius: 3px;
	line-height: 35px;
	font-size: 12px;
	padding-left: 10px;
	padding-right: 10px;
}

.wrapper {
	padding: 10px;
}

div {
	padding-top: 3px;
	padding-bottom: 8px;
}

.title {
	text-align: center;
	font-weight: 700;
}

.id input {
	width: 100%;
}

/* .email input {
	width: 100%;
} */

.name input {
	width: 100%;
}

.password input {
	width: 100%;
}

.passwordCheck input {
	width: 100%;
}

.birth input {
	width: 100%;
}

.address input {
	width: 100%;
}

.phone {
	display: flex;
	justify-content: space-between;
	line-height: 35px;
}

#phone1 {
	width: 18%;
}

#phone2 {
	width: 30%;
}

#phone3 {
	width: 30%;
}

.auth {
	display: flex;
	justify-content: space-between;
}

.timer {
	display: flex;
	justify-content: space-between;
}

.auth div {
	width: 30%;
	text-align: center;
	font-weight: 700;
	font-size: 15px;
}

.auth button {
	width: 70%;
}

.timer div {
	width: 30%;
	text-align: center;
	font-weight: 700;
	font-size: 15px;
}

.timer button {
	width: 70%;
}

.gender {
	text-align: center;
}

.signUp button {
	width: 100%;
	cursor: pointer;
}

button {
	cursor: pointer;
	height: 30px;
}

.error {
	font-size: 1px;
	height: 20px;
	color: red;
	font-weight: 700;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src ="../js/httpRequest.js"></script>
<script>
	$(function(){		
		$("input[value='중복확인']").on("click", checkup);
	});
	
		function checkup() {
			var txt = $("#id").val().trim();
			if (txt == '') {	//빈칸이라면
				$("#msg").html('');
			} else {
				$.ajax({
					type: "GET",
					async: true,
					url: "idCheckup.jsp",
					dataType: "html",
					data: { "id": txt },
					success: function(response) {
						/* console.log(response); */
						if (response.trim() === 'true') {
							alert('사용 가능합니다.');
			          	} else if (response.trim() === 'false') {
							alert('아이디가 존재합니다.');
			            }
					}
				});
			}
		}

		//우편번호 찾기 버튼 누르면 다음포스트코드 열기
		window.onload = function(){
			var addrbtn = document.getElementById("addrbtn");
			addrbtn.onclick = openKakaoPostCode;
		}
		
		function openKakaoPostCode() {
			new daum.Postcode({
				oncomplete: function(data) {
					//팝업에서 검색 결과 항목을 클릭했을 때 
					//실행할 코드 작성하는 부분
					document.getElementById("postcode").value = data.zonecode;
					document.getElementById("address1").value = data.address;
				}
			}).open();
		}	

		function changePhone1() {
			const phone1 = document.getElementById("phone1").value
			if (phone1.length === 3) {
				document.getElementById("phone2").focus();
			}
		}

		function changePhone2() {
			const phone2 = document.getElementById("phone2").value
			if (phone2.length === 4) {
				document.getElementById("phone3").focus();
			}
		}

		function changePhone3() {
			const phone3 = document.getElementById("phone3").value
			if (phone3.length === 4) {
				document.getElementById("sendMessage").focus();
				document.getElementById("sendMessage").setAttribute("style", "background-color:gray;");
				document.getElementById("sendMessage").disabled = false;
			}
		}

		// 문자인증+타이머 부분
		function initButton() {
			document.getElementById("sendMessage").disabled = true;
			document.getElementById("completion").disabled = true;
			document.getElementById("certificationNumber").innerHTML = "000000";
			document.getElementById("timeLimit").innerHTML = "03:00";
			document.getElementById("sendMessage").setAttribute("style", "background-color:none;");
			document.getElementById("completion").setAttribute("style", "background-color:none;");
		}

		let processID = -1;

		const getToken = () => {
			//인증확인 버튼 활성화
			document.getElementById("completion").setAttribute("style", "background-color:gray;");
			document.getElementById("completion").disabled = false;
		    	
			if (processID != -1) clearInterval(processID);
			const token = String(Math.floor(Math.random() * 1000000)).padStart(6, "0");
			document.getElementById("certificationNumber").innerText = token;
			let time = 180;
			processID = setInterval(function() {
				if (time < 0 || document.getElementById("sendMessage").disabled) {
					clearInterval(processID);
					initButton();
					return;
				}
				let mm = String(Math.floor(time / 60)).padStart(2, "0");
				let ss = String(time % 60).padStart(2, "0");
				let result = mm + ":" + ss;
				document.getElementById("timeLimit").innerText = result;
				time--;
			}, 50);
		};
		    	
		function checkCompletion() {
			alert("문자 인증이 완료되었습니다.");
			initButton();
			document.getElementById("completion").innerHTML = "인증완료";
			document.getElementById("signUpButton").disabled = false;
			document.getElementById("signUpButton").setAttribute("style", "background-color:gray;");
	    }

		function dateCheck(){
			const selectedDate = document.getElementById("birth").value;
			  console.log("선택한 날짜:", selectedDate);
			  // 선택한 날짜 값에 대한 처리를 수행합니다.
			
		}
	    // 가입부분 체크(여기보고수정)
	    function signUpCheck() {
			let name = document.getElementById("name").value;
	    	let id = document.getElementById("id").value;
			/* let email = document.getElementById("email").value; */
			let password = document.getElementById("password").value;
			let passwordCheck = document.getElementById("passwordCheck").value;
			let birth = document.getElementById("birth").value;
			let gender = $("input[name='gender']:checked").val();
			let postcode = $("#postcode").val();
			let address1 = $("#address1").val();
			let address2 = $("#address2").val();
			let phone1 = $("#phone1").val();
			let phone2 = $("#phone2").val();
			let phone3 = $("#phone3").val();
			let check = true;
		    		
	    	
	    	// 이름확인
	    	if (name === "") {
	    		document.getElementById("nameError").innerHTML = "이름이 올바르지 않습니다.";
	    		check = false;
	    	} else {
	    		document.getElementById("nameError").innerHTML = "";
	    	}

	    	// 이메일확인
	    	/* if (email.includes('@')) {
	    		let emailId = email.split('@')[0];
	    		let emailServer = email.split('@')[1];
	    		if (emailId === "" || emailServer === "") {
	    			document.getElementById("emailError").innerHTML = "이메일이 올바르지 않습니다.";
	    			check = false;
	    		} else {
	    			document.getElementById("emailError").innerHTML = "";
	    		}
	    	} else {
	    		document.getElementById("emailError").innerHTML = "이메일이 올바르지 않습니다.";
	    		check = false;
	    	} */

	    	
	    	// 비밀번호 확인
	    	if (password !== passwordCheck) {
	    		document.getElementById("passwordError").innerHTML = "";
	    		document.getElementById("passwordCheckError").innerHTML = "비밀번호가 동일하지 않습니다.";
	    		check = false;
	    	} else {
	    		  document.getElementById("passwordError").innerHTML = "";
	    		  document.getElementById("passwordCheckError").innerHTML = "";
	    	}

			if (password === "") {
				document.getElementById("passwordError").innerHTML = "비밀번호를 입력해주세요.";
				check = false;
			} else {
	    	//document.getElementById("passwordError").innerHTML="";
	    	}
	    	if (passwordCheck === "") {
	    		document.getElementById("passwordCheckError").innerHTML = "비밀번호를 다시 입력해주세요.";
	    		check = false;
	    	} else {
	    	//document.getElementById("passwordCheckError").innerHTML="";
	    	}

	    	// 성별체크확인
	    	if (!gender_man && !gender_woman) {
	    		document.getElementById("genderError").innerHTML = "성별을 선택해주세요.";
	    		check = false;
	    	} else {
	    		document.getElementById("genderError").innerHTML = "";
	    	}

	    	if (check) {
	    		/* document.getElementById("emailError").innerHTML = ""; */
	    		document.getElementById("nameError").innerHTML = "";
	    		document.getElementById("passwordError").innerHTML = "";
	    		document.getElementById("passwordCheckError").innerHTML = "";
	    		document.getElementById("genderError").innerHTML = "";
				console.log("check : " + check);
				
	    		$.ajax({
	    			type: "POST",
	               // url: "idCheckup.jsp",
	                dataType: "html", //전송받을 데이터 html,xml
	    			url: "register_Ok.jsp",
	    			data: {
	    				"name": name,
	    				"gender": gender,
	    				"id": id,
	    				"password": password,
	    				"birth": birth,
	    				"postcode": postcode,
	    				"address1": address1,
	    				"address2": address2,
	    				"phone1": phone1,
	    				"phone2": phone2,
	    				"phone3": phone3
	    			},
	    			
	    			success: function(response){
	    					alert("가입이 완료되었습니다.");
	    					location.replace('../login.jsp');
	    			} 
	    		})
	    		
	    		//비동기 처리이벤트
	    		/* setTimeout(function() {
	    		alert("가입이 완료되었습니다.");
	    		}, 0);
	    		location.replace('login.jsp'); */
	    	} 
	    	
	    }
	 /*  }); */
		
	</script>

</head>
<body>
	
		<div class="wrapper">
			<div class="title">
				<h1 style="font-size: 21px;">회원가입</h1>
			</div>
			<div class="name">
				<input id="name" type="text" placeholder="이름을 입력해주세요." value="id/pw:test">
				<div id="nameError" class="error"></div>
			</div>
			<form action="register_Ok.jsp" method="post">
			<div class="gender">
				<input id="gender_man" type="radio" name="gender" value="남">남성 
				<input id="gender_woman" type="radio" name="gender" value="여">여성
				<div id="genderError" class="error"></div>
			</div>
			</form>
			<div class="id">
				<input id="id" type="text" placeholder="아이디을 입력해주세요." value="test">
				<input type="button" value="중복확인" id="idoverlapbtn"/>
				<div id="idError" class="error"></div>
			</div>
			<div class="password">
				<input id="password" type="password" placeholder="비밀번호를 입력해주세요." value="test">
				<div id="passwordError" class="error"></div>
			</div>
			<div class="passwordCheck">
				<input id="passwordCheck" type="password"
					placeholder="비밀번호를 다시 입력해주세요." value="test">
				<div id="passwordCheckError" class="error"></div>
			</div>
			<form action="register_Ok.jsp" method="post">
			<div class="birth">
				<input id="birth" type="date" placeholder="생년월일을 선택해주세요." onchange="dateCheck()">
				<!-- <input id="datepicker" type="text" placeholder="생년월일을 선택해주세요."> -->
				<div id="birthError" class="error"></div>
			</div>
			</form>
			<!-- <div class="email">
				<input id="email" type="text" placeholder="이메일을 입력해주세요.">
				<div id="emailError" class="error"></div>
			</div> -->
			<div class="address">
				<input id="postcode" type="text" placeholder="주소를 입력해주세요." value="63534"/> <input
					type="button" value="우편번호찾기" id="addrbtn" /><br /> 
					도로명: <input type="text" id="address1" size="53" value="제주특별자치도 서귀포시 가가로 14"/><br /> 
					상세주소: <input type="text"
					id="address2" size="50" />
				<div id="addressError" class="adress"></div>
			</div>
			<div class="phone">
				<input id="phone1" type="text" size="1" maxlength="3"
					oninput="changePhone1()" value="010"> - <input id="phone2" type="text"
					size="3" maxlength="4" oninput="changePhone2()" value="1234"> - <input
					id="phone3" type="text" size="3" maxlength="4"
					oninput="changePhone3()" >
			</div>
			<div class="auth">
				<div id="certificationNumber">000000</div>
				<button disabled id="sendMessage" onclick="getToken()">인증번호
					전송</button>
			</div>
			<div class="timer">
				<div id="timeLimit">03:00</div>
				<button disabled id="completion" onclick="checkCompletion()">인증확인</button>
			</div>
			<div class="line">
				<hr>
			</div>
			<div class="signUp">
				<button id="signUpButton" disabled onclick="signUpCheck()">가입하기</button>
			</div>
		</div>

</body>
</html>