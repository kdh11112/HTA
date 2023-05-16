<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>

.right_main{
	position: absolute;
    display: inline-table;
    width: 100%;
    height: 800px;
    background: aqua;
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



<!-- $(function(){
	$("#li1").on("click",function(){
		$ .ajax
		url: "write.jsp",
		success: function(data) {
			
			
		}
		
		
		$("#div").html(a);
	})
}
 -->



<meta charset="UTF-8">
<title>Insert title here</title>


</head>


	
	
	<script>
	
	</script>


<body>
	
<div class="top_window">
  <div class="top_menu" >
	    <div class="mail_gruop" style="flex: 1;">
	      <ul id="mail_list">
	        <li><a href="mail.jsp">받은 메일함</a></li>
	        <li><a href="mail.jsp">내게 쓴 메일함</a></li>
	        <li><a href="mail.jsp">보낸 메일함</a></li>
	        <li><a href="mail.jsp">임시보관함</a></li>
	        <li><a href="mail.jsp">휴지통</a></li>
	      </ul>
	    </div>
	   
	    <div class="write_mail">
	      <button class="btn btn-primary" onclick="edit()" type="button">
	        <span class="img_mail">메일쓰기</span>
	      </button>
	      <button class="btn btn-primary" onclick="edit()" type="button">
	        <span class="img_mail">내게쓰기</span>
	      </button>
	      <span class="bg_bar"></span>
	    </div>
  </div>
  
  <div class="right_main">
    <%@ include file="../mail/mail_all_inbox.jsp" %>
  </div>
</div>

   	
   	
		

</body>
</html>
