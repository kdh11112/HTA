<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
#div1{
	border:2px solid skyblue;
}

div {
	width: 500px;
	height: 600px;
	border: 2px solid darkgray;
	float: left;
	text-align: center;
	margin-left:30px;
}

#txt {
	margin-top:10px;
	width: 200px;
	height: 30px;
}

.cursor {
	cursor: pointer;
	color: blue;
}

img {
	width: 30px;
	height: 20px;
}
#div1{
	width: 200px;
	height:600px;
}
</style>

<script>

	$(function() {
		$("#plan").on("mousedown", function() {
			$("#span").html("");
			$.ajax({
				url : "pro.jsp",
				success : function(data) {
					var data2 = data.trim();
					//var data2 = data;
					var dList = data2.split(",");
					for (var i = 0; i < dList.length; i++) {
						var m = dList[i];
						var dList2 = m.split(" ")
						if (dList2[7] == "PLANNING") {
							$("#span").append(m)
							var date = new Date();
							var month = date.getMonth();
							console.log(date.getHours()+":"+date.getMinutes());
							$("#span").append(month);
							
						}
					}
				}
			})
		})
	})

	$(function() {
		$("#devel").on("mousedown", function() {
			$("#span").html("");
			$.ajax({
				url : "pro.jsp",
				success : function(data) {
					//var data2 = data.trim();
					var data2 = data;
					var dList = data2.split(",");
					for (var i = 0; i < dList.length; i++) {
						var m = dList[i];
						var dList2 = m.split(" ")
						if (dList2[7] == "DEVELOP") {
							$("#span").append(m)

						}
					}
				}
			})
		})
	})
	$(function() {
		$("#human").on("mousedown", function() {
			$("#span").html("");
			$.ajax({
				url : "pro.jsp",
				success : function(data) {
					//var data2 = data.trim();
					var data2 = data;
					var dList = data2.split(",");
					for (var i = 0; i < dList.length; i++) {
						var m = dList[i];
						var dList2 = m.split(" ")
						if (dList2[7] == "HUMAN") {
							$("#span").append(m)
						}

					}
				}
			})
		})
	})
	$(function(){
		$("#search").on("click",function(){
		var txt = $("#txt").val();
			$("#span").html("");
			$.ajax({
				url:"pro.jsp",
				success:function(data){
					var data2 = data.trim();
		            var dList = data2.split(",");
		            for(var i=0;i<dList.length;i++){
		            	var m = dList[i];
		                var dList2 = m.split(" ")
		                if(txt == dList2[3] ){
		                	$("#span").append(m)
		                	
			            }
					}
				}
			})
		})
	})
</script>
</head>
<body>
	<%
	
	
	%>
	
	<div id="div1">
	
		<p class="cursor" id="plan"><img src="../images/fo.png" alt="" />기획팀</p>
		<p class="cursor" id="devel"><img src="../images/fo.png" alt="" />개발팀</p>
		<p class="cursor" id="human"><img src="../images/fo.png" alt="" />인사팀</p>
		<p class="cursor" id="ATTENDANCE"><img src="../images/fo.png" alt="" />출근</p>
	</div>

	<div>
		<input type="text" name="txt" id="txt" /></input> <input type="button"
			value="검색" id="search" /></input> </br><br/> <b>사번 이름 직급 부서명</b><br/> <span id="span"></span>
	</div>

</body>


</html>