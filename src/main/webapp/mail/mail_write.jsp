<%@page import="vo.EmployeeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>


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
				<input type="hidden" name="writer" value="<%=name %>" />
				</td>
			</tr>
		
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" id="" /></td>
			</tr>
		
			<tr>
				<th>내용</th>
				<td><textarea class="summernote" name="contents" id="" cols="30" rows="30"></textarea></td>
			</tr>
		
			<tr>
				<td colspan="2">
					<input class="btn btn-primary" type="submit" value="보내기" />
					<input class="btn btn-primary" type="submit" value="예약" />
					<input class="btn btn-primary" type="submit" value="임시저장" />
				</td>
			</tr>
		
		</table>
		
		<script type="text/javascript">
			$('.summernote').summernote({
			  	height: 450,   // 서머노트 에디터 높이
			  	width: 1500,
		 		 codemirror: { // codemirror options
		    theme: 'monokai'
		  }
		});	</script>
		
		
	</form>
	
</div>

	

</body>
</html>