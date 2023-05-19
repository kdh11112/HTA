<%@page import="java.util.ArrayList"%>
<%@page import="vo.MailVO"%>
<%@page import="dao.MailDAO"%>
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
	<%
		Object obj = session.getAttribute("vo");
		if(obj == null)
			response.sendRedirect("/HTA_Project_semi/login.jsp");
		/* 로그인 되어 있을때만 화면에 출력
		그렇지 않으면 login.jsp 되돌려보내기 */
	
		// 전체 게시물 건수를 출력 ?
			MailDAO dao = new MailDAO();
			// 총게시물 건수 ? :
			int totalCount = dao.getTotalCount();				
			// 한 페이지당 게시물 건수 : 20
			int recordPerPage = 10;
			// 총 페이지 수 :						
			int totalPage = 
			(totalCount%recordPerPage==0)
			?(totalCount/recordPerPage):(totalCount/recordPerPage)+1;
			
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
			
	%>

	 
      			<table class="table table-striped"
						style="text-align: center; border: 1ps solid #dddddd">
 
				<thead>
					<tr>
						<th style="background-color: #eeeeee;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
		<%
			ArrayList<MailVO> list = dao.selectAll(startNo, endNo);
			for(MailVO vo : list){
		%> 
					<tr>
                    <td><%=vo.getMNumber() %></td>
                    <td><a href="mailDetail.jsp<%-- ?mno=<%=vo.getMNumber()%> --%>"><%=vo.getMTitle() %></td>
                    <td><%=vo.getENumber() %></td>
                    <td><%=vo.getMRegdate() %></td>
                    </tr>
               <%
         			}
     			%>
                
	 
	 	<tr>
	 		<td colspan="4">
			<% for (int i = startPage; i<= endPage ;i++){
				%>
				 <a href="mail_all_inbox.jsp?cp=<%=i%>">[<%=i %>]</a>
				 <%
			}
				%>
			  </td>
		  </tr>
	 		</tbody>
       </table>




</body>
</html>