<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script type="text/javascript" src="../lang/summernote-ko-KR.js"></script>

<!-- <link rel="stylesheet" href="//mail1.daumcdn.net/mail_static/mint/dist/5f135a6/css/style-main.css" class="daumMailCss"> -->





<style>

.mail_toolbar {
    margin: 0 25px;
    padding: 0 0 0 5px;

	-webkit-box-flex: 0;
	flex: 0 0 auto;
    position: relative;
    top: auto;
    right: auto;
    left: auto;
    display: flex;
}

.side_menu{
    position:fixed;
    top:15px;
    left:0;
    bottom:0;
    width:220px;
    border-right:1px solid #c7c7c7;
    background:#fff
}

.write_mail{
	text-align: center;
}
.mail_gruop > ul{
	list-style: none;
}

li{
	margin-top: 20px;
}

div#right_window{
	position: absolute;
	top:15px;
	left:230px;
	/* background-color: maroon; */
	
}

</style>


 <style>

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




<script>

$(function(){
	$("#li1").on("click",function(){
		$ .ajax
		url: "write.jsp",
		success: function(data) {
			
			
		}
		
		
		$("#div").html(a);
	})
}

</script>






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




</head>


<body>
	
	
	<div class ="all_window">
		
		 <div class="side_menu">
	            
	            <div class="write_mail">
	          	  <!-- <button id="edit" class="btn btn-primary" onclick="edit()" type="button">Edit 1</button> -->
	            
	
	                <button id="edit" class="btn btn-primary" onclick="edit()" type="button">
	                	<span class="img_mail">메일쓰기</span>
	               	</button>
	               	
	                <button id="edit" class="btn btn-primary" onclick="edit()" type="button">
	                <span class="img_mail">내게쓰기</span>
	                </button>
	                
	                <span class="bg_bar"></span>
	            </div>
	            
	            <div class="mail_gruop">
	            
	            	<ul>
	            		<li id="li1" >받은 메일함</li>
	            		<li id= "li2">내게 쓴 메일함</li>
	            		<li><a href="mail.jsp">보낸 메일함</a></li>
	            		<li><a href="mail.jsp">임시보관함</a></li>
	            		<li><a href="mail.jsp">휴지통</a></li>
	            	</ul>
	            	
	            </div>
	            
	   	</div>
   	
   	
		<div id="right_window">
		   	
			 <div id="content">
			 	
			    <table>
			    
			    <tr class="option_name">
			    	<th>체크박스 
			    	<!-- <ul>
			    		<li>1</li>
			    		<li>2</li>
			    		<li>3</li>
			    	</ul> -->
			    	</th>
			    	<th>읽음</th>
			    	<th>삭제</th>
			    	
    	<div class="mail_toolbar">
				    	<div class="mail_toolbar_count">
				    		<span class="current"><strong class="count">0</strong><span class="text">개 선택</span></span>
				    		<span class="total"><span class="blind">전체</span>80<span class="blind">개</span></span>
			    		</div>
			    	
			    	<div class="mail_toolbar_task">
			    		
			    		<div class="button_group">
			    			<div class="button_optional_select">
			    				<div class="button_checkbox_wrap">
			    					<input type="checkbox" id="selection_all" class="button_checkbox blind">
			    					<label for="selection_all"><span class="blind">전체 메일</span></label>
			    				</div>
			    				
			    				<button type="button" class="button_task_dropdown"><span class="blind">메일 선택 옵션</span></button>
		    				</div>
			    		
				    		<div class="button_task_wrap button_select">
				    			<button type="button" class="button_task svg_select">
				    			<span class="text">전체선택</span></button>
			    			</div>
				    		
		    				<div class="button_task_wrap ">
		    					<button type="button" class="button_task svg_read" disabled="">
		    					<span class="text">읽음</span></button>
	    					</div>
				    		
			    			<div class="button_task_wrap"><button type="button" class="button_task svg_delete" disabled="">
			    				<span class="text">삭제</span></button>
			    			</div>
				    			
			    			<div class="button_task_wrap">
			    				<button type="button" class="button_task svg_spam" disabled="">
			    				<span class="text">스팸차단</span></button>
		    				</div>
	    				
    					</div>
    					
    				<div class="button_group">
			    			<div class="button_task_wrap button_reply"><button type="button" class="button_task" disabled="">
			    				<span class="text">답장</span></button>
		    				</div>
			    	
			    			<div class="button_task_wrap button_reply_all">
			  			  		<button type="button" class="button_task" disabled=""><span class="text">전체답장</span></button>
			  			  	</div>
			    		
			    			<div class="button_task_wrap button_forward"><button type="button" class="button_task" disabled="">
			    				<span class="text">전달</span></button>
		    				</div>
    				</div>
    				
    				<div class="button_group">
    					<div class="button_task_wrap">
			    			<button type="button" class="button_task_dropdown svg_move" disabled=""><span class="text">이동</span></button>
		    			</div>
		    			
				    	<div class="button_task_wrap button_etc"><button type="button" class="button_task_dropdown svg_etc" disabled="">
				    		<span class="text">더보기</span></button>
				    	</div>
				    	
				    	<div class="button_task_wrap button_filter">
				    		<button type="button" class="button_task_dropdown"><span class="text">필터</span></button>
				    		
				    		<div class="layer_context layer_list_filter"><strong class="context_title">필터</strong>
				    			<ul class="context_menu">
				    				<li class="context_item"><button type="button" class="button_context_item selected">모든 메일<span class="blind">선택됨</span></button></li>
				    				<li class="context_item"><button type="button" class="button_context_item">안읽은 메일</button></li>
				    				<li class="context_item"><button type="button" class="button_context_item">중요 메일</button></li>
				    				<li class="context_item"><button type="button" class="button_context_item">첨부 메일</button></li>
				    				<li class="context_item"><button type="button" class="button_context_item">나에게 온 메일</button></li>
			    				</ul>
			    				
			    				<strong class="context_title">정렬</strong>
			    				
			    				<ul class="context_menu">
			    					<li class="context_item"><button type="button" class="button_context_item selected">최신 순<span class="blind">선택됨</span></button></li>
			    					<li class="context_item"><button type="button" class="button_context_item">오래된 순</button></li>
		    					</ul>
	    					</div>
	   					</div>
  					</div>
  					
				</div>
				
				<div class="mail_toolbar_task">
					<div class="button_task_wrap"><button type="button" class="button_task_dropdown icon_sorting_time">
						<span class="blind">시간순 보기</span></button>
					</div>
				
					<div class="button_task_wrap"><button type="button" class="button_task_dropdown icon_layout_list">
						<span class="blind">목록/본문 보기</span></button>
					</div>
				
				</div>
				
				<div class="mail_toolbar_summary"><a href="#" class="unread_mail_link"><span class="blind">안읽은 메일</span>
						<span class="current">1</span><span class="blind">개</span></a>
						<a href="#" class="total"><span class="blind">전체 메일</span>2203<span class="blind">개</span></a>
						<button type="button" class="button_remove_unread_mail">안읽음 삭제</button>
				</div>
				<!-- 
				<a href="#" class="mail_toolbar_link">메일함 관리</a>
			    	<button class="button_close"><span class="blind">닫기</span></button> -->
	    	</div>
			    	
			    	
			    	
			    	
			    	
			    	
			    	
			    	
			    	
			    	
			    </tr>
			        <tr>
			            <th id="id">ID</th>
			            <th id="pw" >PW</th>
			            <th id="name">NAME</th>
			            <th id="email">EMAIL</th>
			            <th id="addrs">ADDRS</th>
			        </tr>
			        <tr class="odd">
			            <td>id1</td>
			            <td>pwd1</td>
			            <td>아이언맨</td>
			            <td>ironman@gamil.com</td>
			            <td>절벽위</td>
			        </tr>
			
			        <tr>
			            <td>id2</td>
			            <td>pwd2</td>
			            <td>토르</td>
			            <td>thur@gamil.com</td>
			            <td>아스가르드</td>
			        </tr>
			        
			        <tr class="odd">
			            <td>id3</td>
			            <td>pwd3</td>
			            <td>헐크</td>
			            <td>hulk@gmail.com</td>
			            <td>뉴욕</td>
			        </tr>
			
			        <tr>
			            <td>id4</td>
			            <td>pwd4</td>
			            <td>캡틴아메리카</td>
			            <td>cap@gmail.com</td>
			            <td>마블스튜디오</td>
			        </tr>
			
			    </table>
		          
		          
		     </div>
	     </div>
	     
	     
     </div>

</body>
</html>