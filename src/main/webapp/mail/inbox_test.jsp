<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	table{
	    position: fixed;
		
		width: 1100px;
		margin-top: 20px;
		margin-left: 20px;
		margin-right: auto;
		margin-bottom: auto;
		
		border-bottom: 1px solid black;
	
	}
	
	table, th, td {

	}

tr{border-color: inherit;
    border-style: solid;
    border-width: 0;
}
</style>
</head>

<body>

	<table>
		<tr>
			<th>메일번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>
	
		
		<tr>
			<td>메일번호</td>
			<td><a href="디테일링크">Apple에서 발행한 영수증입니다.</a></td>
			<td>작성자</td>
			<td>조회수</td>
		</tr>


		<tr>
			<td colspan="4"></td>
			<td><a href="write.jsp"><input type="button" value="글쓰기" /></a></td>
		
		</tr>
		<tr>
			<td colspan="4">
			<a href=""> i</a>
				</td>
		</tr>
			
	</table>
	
			
</body>
</html>