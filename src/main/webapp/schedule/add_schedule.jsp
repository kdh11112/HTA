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
		height:500px;
		border: 1px solid black;
	}
	#datepicker{
		margin-top:100px;
		margint
	}
	#title{
	font-size:30px;
	padding-left:90px;
	}
	input{
		width:150px;
	}
	#start_date{
		margin-left:10px;
	}
</style>
</head>
<body>
	<div id=page><span id="title">일정추가</span>
	<div id="start_date">시작일
		<input type="text" name="" id="datepicker" />
	<div id="end_date">종료일
		<input type="text" name="" id="datepicker2" />
	</div>
	</div>
</body>
</html>