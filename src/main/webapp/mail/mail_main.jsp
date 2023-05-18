<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="../js/summernote/summernote-lite.js"></script>
<script src="../js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../css/summernote/summernote-lite.css">
			
<style>
.right_main{
	position: relative;
    display: inline-table;
    width: 100%;
    height: 730px;
    
}
.mail_toolbar {
  	background-color: burlywood;
  	position: relative;
  	display: flex;
  	flex-direction: column;
    top: auto;
    right: auto;
    left: auto;
    display: flex;
} 
</style> 

<style>
.top_menu{
	display: flex;
	flex-direction: row-reverse;
	background: #9bffff;
}

.write_mail{
	text-align: center;
    margin-left: 10px;
    margin-top: 10px;
    
}
 .mail_gruop > ul{
	list-style: none;
}


#mail_list{
	display: inline-flex;; 
	align-content: flex-start;
	flex-direction: column; 
	flex-wrap: wrap;
	justify-content: space-evenly;
	flex-direction: row;
	white-space: nowrap; /* 줄 바꿈 방지 */
	
	}
	
#mail_list li{
	list-style: none;
	margin-left: 30px; 
	white-space: nowrap;
  	flex-shrink: 0; /* 크기 변화에 대한 축소 비활성화 */
	}

.mail_gruop > ul > li{
	padding-top:10px;
	margin-top: 15px;
}

th {
  white-space: nowrap; /* 줄 바꿈 방지 */
}

a{
 text-decoration:none;
}

div#right_window{
	position: relative;
	top:15px;
	left:230px;
	/* background-color: maroon; */
	
}

</style>

<script>
$(document).ready(function() {
	  var isMailWriteLoaded = false; // mail_write.jsp 파일이 로드되었는지 여부를 저장하는 변수

	  // "메일쓰기" 버튼 클릭 이벤트 처리
	  $("#write").off("click").on("click", function() {
	    // AJAX를 사용하여 mail.jsp 페이지를 로드하여 right_main 클래스 내에 표시
	    if (!isMailWriteLoaded) {
	      $.ajax({
	        url: "mail_write.jsp",
	        dataType: "html",
	        success: function(response) {
	          $(".right_main").html(response);
	          isMailWriteLoaded = true; // 파일이 로드되었음을 표시
	          initializeSummernote(); // Summernote 초기화 함수 호출
	        },
	        error: function(xhr, status, error) {
	          console.error(error);
	        }
	      });
	    }
	  });

	  $("#me_write").off("click").on("click", function() {
	    // AJAX를 사용하여 mail.jsp 페이지를 로드하여 right_main 클래스 내에 표시
	    if (!isMailWriteLoaded) {
	      $.ajax({
	        url: "mail_write.jsp",
	        dataType: "html",
	        success: function(response) {
	          $(".right_main").html(response);
	          isMailWriteLoaded = true; // 파일이 로드되었음을 표시
	          initializeSummernote(); // Summernote 초기화 함수 호출
	        },
	        error: function(xhr, status, error) {
	          console.error(error);
	        }
	      });
	    }
	  });

	  // Summernote 초기화 함수
	  function initializeSummernote() {
	    $('.summernote').summernote({
	      height: 450, // 서머노트 에디터 높이
	      width: 1900,
	      codemirror: {
	        theme: 'monokai' // codemirror options
	      }
	    });
	  }
	});
	
	
	
$("#inbox").off("click").on("click", function() {
    // AJAX를 사용하여 mail.jsp 페이지를 로드하여 right_main 클래스 내에 표시
    if (!isMailWriteLoaded) {
      $.ajax({
        url: "inbox_test.jsp",
        dataType: "html",
        success: function(response) {
          $(".right_main").html(response);
          isMailWriteLoaded = true; // 파일이 로드되었음을 표시
          initializeSummernote(); // Summernote 초기화 함수 호출
        },
        error: function(xhr, status, error) {
          console.error(error);
        }
      });
    }
  });
	
	
	
	
</script>






<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	
<div class="top_window">
  <div class="top_menu" >
	    <div class="mail_gruop" style="flex: 1;">
	      <ul id="mail_list">
	        <li id="inbox"><a href="">받은 메일함</a></li>
	        <li id="inbox"><a href="">내게 쓴 메일함</a></li>
	        <li id="inbox"><a href="">보낸 메일함</a></li>
	        <li id="inbox"><a href="">임시보관함</a></li>
	        <li id="inbox"><a href="">휴지통</a></li>
	      </ul>
	    </div>
	   
	    <div class="write_mail">
	      <button class="btn btn-primary" id="write" type="button">
	        <span class="img_mail">메일쓰기</span>
	      </button>
	      <button class="btn btn-primary" id="me_write" type="button">
	        <span class="img_mail">내게쓰기</span>
	      </button>
	      <span class="bg_bar"></span>
	    </div>
  </div>
  
  <div class="right_main">
    <%@ include file="../mail/inbox_test.jsp" %>
  </div>
</div>

   	
   	
		

</body>
</html>
