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
	flex-direction: row;"
	
	}
	
#mail_list li{
	list-style: none;
	margin-left: 30px; 
	}

.mail_gruop > ul > li{
	padding-top:10px;
	margin-top: 15px;
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
  // "메일쓰기" 버튼 클릭 이벤트 처리
  $("#write").click(function() {
    // AJAX를 사용하여 mail.jsp 페이지를 로드하여 right_main 클래스 내에 표시
    $.ajax({
      url: "mail_write.jsp",
      dataType: "html",
      success: function(response) {
        $(".right_main").html(response);
      },
      error: function(xhr, status, error) {
        console.error(error);
      }
    });
  });
  
  
  $("#me_write").click(function() {
	    // AJAX를 사용하여 mail.jsp 페이지를 로드하여 right_main 클래스 내에 표시
	    $.ajax({
	      url: "mail_write.jsp",
	      dataType: "html",
	      success: function(response) {
	        $(".right_main").html(response);
	      },
	      error: function(xhr, status, error) {
	        console.error(error);
	      }
	    });
	  });
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
	        <li><a href="mail_list.jsp">받은 메일함</a></li>
	        <li><a href="mail_list.jsp">내게 쓴 메일함</a></li>
	        <li><a href="mail_list.jsp">보낸 메일함</a></li>
	        <li><a href="mail_list.jsp">임시보관함</a></li>
	        <li><a href="mail_list.jsp">휴지통</a></li>
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
