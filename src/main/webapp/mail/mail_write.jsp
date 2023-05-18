<%@page import="vo.EmployeeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {

	$("#addrList").click(function(){
			var url = "../emp_search/info.jsp";
			var option = "width = 825px, height = 650px, top = 100, left = 200, location = no";
			var title = '자식창1';
			window.open(url,title,option,"window.opener");
		})

	
});

</script>

</head>

<body>
<%
		//세션에 잇는 vo(로그인되어있는 계정) 가져오기
	Object obj = session.getAttribute("vo");
	String name = null;
	if(obj != null){
		EmployeeVO vo = (EmployeeVO)obj;
		name = vo.geteName();
	}
%>  


<div class="conteiner">

	<form action="mail_writeOk.jsp" method="post">
		<table class = "table table-striped">
			<tr>
				<th>보내는 사람</th>
				<td><input type="text" name="writer" id="" value="<%=name %>" disabled="disabled" />
				<input type="hidden" name="writer" value="<%=name %>" />
				</td>
			</tr>
			
			<tr>
				<th>받는 사람</th>
				<td><input type="text" name="writer" id="" value="받는사람 아이디<%-- <%=name %> --%>" />
				<input id="addrList" class="btn btn-primary" type="button" style="margin-left: 10px" value="주소록" />
				<input type="hidden" name="writer" value="<%=name %>" />
				</td>
			</tr>
		
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" id="" style="width: 150px" /></td>
			</tr>
		
			<tr>
				<th>내용</th>
				<td><textarea class="summernote" name="contents" id="" cols="30" rows="10"></textarea></td>
			</tr>
		
			<tr>
				<td colspan="2">
					<input class="btn btn-primary" type="submit" value="보내기" />
					<input class="btn btn-primary" type="submit" value="예약" />
					<input class="btn btn-primary" type="submit" value="임시저장" />
				</td>
			</tr>
		
		</table>

		
	</form>
	
</div>

	

</body>
</html>