<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src ="../js/httpRequest.js"></script>

<script>
	$(function(){
	
		$("#datepicker").datepicker({
			showOn: 'button',
			changeMonth: true,
			changeYear: true,
			dateFormat: 'yy.mm.dd',
			prevText: '이전 달',
			nextText: '다음 달',
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNames: ['일','월','화','수','목','금','토'],
			dayNamesShort: ['일','월','화','수','목','금','토'],
			dayNamesMin: ['일','월','화','수','목','금','토'],
			showMonthAfterYear: true,
			yearSuffix: '년'
			});
		
		$("#datepicker2").datepicker({
			showOn: 'button',
			changeMonth: true,
			changeYear: true,
			dateFormat: 'yy.mm.dd',
			prevText: '이전 달',
			nextText: '다음 달',
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNames: ['일','월','화','수','목','금','토'],
			dayNamesShort: ['일','월','화','수','목','금','토'],
			dayNamesMin: ['일','월','화','수','목','금','토'],
			showMonthAfterYear: true,
			yearSuffix: '년'
			});
	})
</script>
<style>
	#page{
		width:300px;
		height:400px;
		border: 1px solid black;
	}
	#title{
	font-size:30px;
	padding-left:90px;
	}
	.date{
		width:120px;
	}
	#start_date,#end_date {
		margin-left:30px;
		font-weight: bold;
	}
	#select{
		margin-left:200px;
		margin-top:30px; 
		font-weight: bold;
		width:80px;
		height:30px;
	}
	#dates{
			margin-top:20px;
	}
	#end_date{
		margin-top:10px;
	}
	#content_area{
		margin-top:20px;
		margin-left:20px;
		font-weight: bold;
	}
	#datepicker.#datepicker{
		width:100px
	}
	.ui-datepicker-trigger{
		margin-left:10px;
	}
</style>
</head>
<body>
	<div id=page><span id="title">일정추가</span>
		<div>
			<span><select name="일정선택"   id="select"></span>
					<option value="" id="personal_schedule">개인일정</option>
					<option value="" id="department_schedule">부서일정</option>
					<option value="" id="company_schedule">회사일정</option>
				  </select>
		</div>
		<div id="dates">
		<div id="start_date">시작일&nbsp;&nbsp;&nbsp;<input type="text" name="" id="datepicker" class="date"/></div>
		<div id="end_date">종료일&nbsp;&nbsp;&nbsp;<input type="text" name="" id="datepicker2" class="date"/></div>
		</div>
		<div id="content_area"><span>일정내용</span>
			 <p><textarea cols="34" rows="10"></textarea></p>			
		</div>
	</div>
		
</body>
</html>