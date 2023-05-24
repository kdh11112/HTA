<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../css/register.css"> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	$(function(){		
		$("#idoverlapbtn").on("click", checkup);
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
    	
    	// 아이디 확인
    	if(id === ""){
    		document.getElementById("idError").innerHTML = "아이디를 입력해주세요.";
    		check = false;
    	} else {
    		document.getElementById("idError").innerHTML = "";
    	}
    	
    	// 아이디 확인
    	if(postcode === ""){
    		document.getElementById("addressError").innerHTML = "주소를 입력해주세요.";
    		check = false;
    	} else {
    		document.getElementById("addressError").innerHTML = "";
    	}
    	
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
    	}
    	if (passwordCheck === "") {
    		document.getElementById("passwordCheckError").innerHTML = "비밀번호를 다시 입력해주세요.";
    		check = false;
    	} else {
    	}

    	// 성별체크확인
    	if (!gender_male && !gender_female) {
    		document.getElementById("genderError").innerHTML = "성별을 선택해주세요.";
    		check = false;
    	} else {
    		document.getElementById("genderError").innerHTML = "";
    	}

    	if (check) {
    		document.getElementById("nameError").innerHTML = "";
    		document.getElementById("idError").innerHTML = "";
    		document.getElementById("passwordError").innerHTML = "";
    		document.getElementById("passwordCheckError").innerHTML = "";
    		document.getElementById("genderError").innerHTML = "";
    		document.getElementById("addressError").innerHTML = "";
			console.log("check : " + check);
			
    		$.ajax({
    			type: "POST",
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
    					location.replace('../login2.jsp');
    			} 
    		})
    	} 
    }
</script>
</head>
<body>
	 <div class="wrapper">
        <div class="header">
            <h2 class="header__title">
                회원가입을<br/>진행해 주세요.
            </h2>
        </div>
        <div class="body__container">
			<div class="input__wrapper neu__input">
               	<div class="name">
                    <input type="text" id="name" placeholder="이름을 입력해 주세요." >
                    <div id="nameError" class="error"></div>
                </div>
                
                <div class="gender__wrapper">
                	<form action="register_Ok.jsp" method="post">
	                    <div class="gender">
	                        <div>
	                            <input type="radio" name="gender" id="gender_female" value="남">
	                            <label for="female">여자</label>
	                        </div>
	                        <div>
	                            <input type="radio" name="gender" id="gender_male" value="여">
	                            <label for="male">남자</label>
	                            <div id="genderError" class="error"></div>
	                        </div>
	                    </div>
                    </form>
               	</div>
               	
                   <div class="id">
                    <input type="text" id="id" placeholder="아이디을 입력해 주세요."><br />
                    <div id="idError" class="error"></div>
                    <input type="button" value="아이디 중복확인" id="idoverlapbtn" />
                   </div>
                   
                   <div class="password">
                    <input type="password" id="password" placeholder="패스워드를 입력해 주세요.">
               		<div id="passwordError" class="error"></div>
               	</div>
               	
               	<div class="passwordCheck">
                    <input type="password" id="passwordCheck" placeholder="패스워드를 다시 입력해주세요.">
               		<div id="passwordCheckError" class="error"></div>
               	</div>
               	
               	<form action="register_Ok.jsp" method="post">
                	<div class="birth">
                		<input type="date" id="birth" onchange="dateCheck()"/>	
                		<div id="birthError" class="error"></div>
                	</div>
               	</form>
               	
               	<div class="address">
					<input id="postcode" type="text" placeholder="주소를 입력해 주세요." /> <br /> 
					<div id="addressError" class="error"></div>
					<input type="button" value="우편번호찾기" id="addrbtn" class="btn" /><br /> 
					<input type="text" id="address1" size="53" placeholder="도로명 주소" /><br /> 
					<input type="text" id="address2" size="50" placeholder="상세 주소" />
				</div>
				
               	<div class="phone__wrapper">
                    <input type="text" name="firstNumber" id="phone1" size="1" maxlength="3" oninput="changePhone1()">
                    <span>-</span>
                    <input type="text" name="secondNumber" id="phone2" size="3" maxlength="4" oninput="changePhone2()">
                    <span>-</span>
                    <input type="text" name="thirdNumber" id="phone3" size="3" maxlength="4" oninput="changePhone3()">
               	</div>
               	
               	<div class="auth__wrapper">
                   	<div class="auth">
                   		<div id="certificationNumber">000000</div>
                       	<button class="btn" disabled id="sendMessage" onclick="getToken()">인증 번호</button>
                   	</div>
                   </div>
                   
                   <div class="timer">
                       <span id="timeLimit">3:00</span>
                       <button disabled class="btn" id="completion" onclick="checkCompletion()">인증 확인</button><br />
                   </div>
                   
                <div class="agreement__wrapper">
                    <div class="agreement">
                        <input type="checkbox" name="agreement" id="agreement">
                        <label for="agreement">
                            정보를 제공하는데 동의합니다.
                        </label>
                    </div>
                </div>
                
                <div class="signup__wrapper">
                    <div class="signup">
                        <button id="signUpButton" onclick="signUpCheck()" class="signup__btn btn" disabled>회원 가입</button>
                    </div>
                </div>
        	</div>
        </div>
    </div>
</body>
</html>