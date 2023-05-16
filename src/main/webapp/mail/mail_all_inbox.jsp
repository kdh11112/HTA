<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>임시 받은메일함</h2>


<%-- 
	<%
		Object obj = session.getAttribute("vo");
		if(obj == null)
			response.sendRedirect("../day10/login.jsp");
		/* 로그인 되어 있을때만 화면에 출력
		그렇지 않으면 login.jsp 되돌려보내기 */
	
		// 전체 게시물 건수를 출력 ?
			BoardDAO dao = new BoardDAO();
			// 총게시물 건수 ? :
			int totalCount = dao.getTotalCount();				
			// 한 페이지당 게시물 건수 : 20
			int recordPerPage = 20;
			// 총 페이지 수 :						
			int totalPage = 
			(totalCount%recordPerPage==0)
			?(totalCount/recordPerPage):(totalCount/recordPerPage)+1;
			
			// 303/ 20 = 15
			// 303 / 20 + 1 = 16
			// 현재페이지 번호
			
			String cp = request.getParameter("cp");
			
			int currentPage = 0;
			if(cp != null){
			currentPage = Integer.parseInt(cp);
			}else{
				currentPage = 1;
			}
			
			// 1페이지 : 시작번호 1: 끝번호 : 20

			// 2페이지 : 시작번호 21: 끝번호 : 40
			
			// 3페이지 : 시작번호 41: 끝번호 : 60
			
			
			// 시작번호
			int startNo = (currentPage-1)*recordPerPage+1;
			//     1          (1-1) * 20 +1 = 1
			//     2          (2-1) * 20 +1 = 21
			//     3          (3-1) * 20 +1 = 41
			
			// 끝 번호
			int endNo = currentPage*recordPerPage;
			
			// 시작페이지번호
			int startPage = 1;
			int endPage = totalPage;
			
			// 끝페이지 번호
			//시작페이지 미세조정
			
			if(currentPage<=5){
				startPage =1;
			}else if(currentPage >= 6){
				startPage = currentPage-4;
			}
			// 끝페이지 번호
			if(totalPage - currentPage <= 5){
				endPage = totalPage;
				
			}else if(totalPage - currentPage > 5){
				if(currentPage<=5){
					if(totalPage> 10){
						endPage = 10;
						
					}else{
						endPage = totalPage;
					}
				}else{
					endPage = currentPage+4;
				}
			}
			
			/* 
			out.println("<h5> 총 게시물 수 : " + totalCount + "</h5>");
			out.println("<h5> 한 페이지당 게시물 건수 : " + recordPerPage + "</h5>");
			out.println("<h5> 총 페이지수 : " + totalPage + "</h5>");
			
			out.println("<h5> 현재 페이지번호 : " + currentPage + "</h5>");
			out.println("<h5> 시작번호 : " + startNo + "</h5>");
			out.println("<h5> 끝번호 : " + endNo + "</h5>");
			*/
			
	%>
	
	 --%>
	 
	 
	<table>
		<tr>
			<th>게시물번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>
		
	<%-- 	
		<%
			ArrayList<BoardVO> list = dao.selectAll(startNo, endNo);
			for(BoardVO vo : list){
		%> --%>
		
		<tr>
			<td>게시판번호<%-- <%=vo.getBno() %> --%></td>
			<td><a href="detail.jsp?bno=<%-- <%=vo.getBno()%> --%>"><%-- <%=vo.getTitle() %> --% >   </a></td>
			<td>작성자<%-- <%=vo.getWriter() %> --%></td>
			<td>조회수<%-- <%=vo.getHits() %> --%></td>
		</tr>
		<%-- 
		<%
			}
		%>		
		 --%>
		<tr>
			<td colspan="4"></td>
			<td><a href="write.jsp"><input type="button" value="글쓰기" /></a></td>
		
		</tr>
		<tr>
			<td colspan="4">
			<%-- 
			
			<% for (int i = startPage; i<= endPage ;i++){
				%>
				 --%>
				 
				 
				 
				<a href="list.jsp?cp=1 <%-- <%=i%> --%>">[ i<%-- <%=i %> --%>]</a>
				<%-- <%
			}
				%>
				  --%>
			</td>
		</tr>
			
	</table>
	




</body>
</html>