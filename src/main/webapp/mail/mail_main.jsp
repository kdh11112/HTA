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


.side_menu{
	height:800px;
    position:relative;
    display:inline-block;
    flex-grow:1;
    left:0;
    bottom:0;
    width:220px;
    border-right:1px solid #c7c7c7;
    background:#fff 
}

.write_mail{
	text-align: center;
	margin-top: 30px;
}
 .mail_gruop > ul{
	list-style: none;
}

#mail_list{
	display: flex; 
	align-content: flex-start;
	flex-direction: column; 
	flex-wrap: wrap}
	
#mail_list li{
	list-style: none; 
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
/*save*/

            table, td, th{
                border : 1px solid black;
            }
            table{
                width: 100%;
                /* 중앙정렬 */
                align-self: center;
                /* 테두리 병합 */
                border-collapse: collapse;
            }

            th{
                font-size:15px;
                background-color: #e0bbd8;

            }
            td{
                height: 24px;
            }
            tr{
                font-size: 12px; 
                cursor:pointer   
            }
            #id{width: 20%;}
            #pw{width: 20%;}
            #name{width: 20%;}
            #email{width: 30%;}
            #addrs{width: 30%;}
             
            /* 선택자 
            1. tag
            2. id
            3. class
            4. 하위 선택자
                div p 부모엘리먼트 자손엘리먼트

            ol>li 부모 엘리먼트 > 자식엘리먼트

            5. 유사선택자 : hover, active,
                th:hover
                td:active
            */
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

<script>
		$(document).ready(function() {
			// Side menu 클릭 이벤트 바인딩
			$(".side-menu-item").click(function() {
				var page = $(this).attr("data-page");
				// Ajax 요청
				$.ajax({
					url: page,
					type: "GET",
					success: function(response) {
						// Ajax 요청이 성공한 경우
						$("#content").html(response);
					},
					error: function(xhr) {
						// Ajax 요청이 실패한 경우
						console.log("Error: " + xhr.responseText);
					}
				});
			});
		});
	</script> 


<meta charset="UTF-8">
<title>Insert title here</title>


</head>



<body>
	
	<div class ="all_window">
		 <div class="side_menu">
	            <div class="write_mail">
	          	  
	                <button id="edit" class="btn btn-primary" onclick="edit()" type="button">
	                	<span class="img_mail">메일쓰기</a></span>
	               	</button>
	               	
	                <button id="edit" class="btn btn-primary" onclick="edit()" type="button">
	                <span class="img_mail">내게쓰기</span>
	                </button>
	                
	                <span class="bg_bar"></span>
	            </div>
	            
	            <div class="mail_gruop">
	            	
	            	<ul id="mail_list">
	            		<li><a href="mail.jsp">받은 메일함</a></li>
	            		<li><a href="mail.jsp">내게 쓴 메일함</a></li>
	            		<li><a href="mail.jsp">보낸 메일함</a></li>
	            		<li><a href="mail.jsp">임시보관함</a></li>
	            		<li><a href="mail.jsp">휴지통</a></li>
	            	</ul>
	            </div>
	   	</div>
	   	<div class="right_main">
	   		<div></div>
	   	</div>
   	
   	
		

</body>
</html>
