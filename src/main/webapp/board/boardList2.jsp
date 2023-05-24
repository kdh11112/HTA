<%@page import="vo.EmployeeVO"%>
<%@page import="dao.BoardDAO"%>
<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
		<!-- include libraries(jQuery, bootstrap) -->
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
		<link rel="shortcut icon" href="#">
		<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
		<title>글목록</title>
		<style type="text/css">
			a, a:hover {
			color: #000000;
			text-decoration: none;
			}
		</style>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>

<body class="sb-nav-fixed">
	<%
		
		//전체 게시물 건수를 출력?
	    BoardDAO dao = new BoardDAO();
	    int totalCount = dao.getTotalCount();       
	    
	    //한 페이지당 게시물건수 : 20
	    int recordPerPage = 20;
	    int totalPage = (totalCount%recordPerPage==0) ? totalCount/recordPerPage : totalCount/recordPerPage+1;
	    
	    
	    String cp = request.getParameter("cp");
	    int currentPage = 0;
	    if(cp != null){         
	    currentPage = Integer.parseInt(cp);
	    }else{
	       currentPage = 1;
	    }
	
	    int startNo = (currentPage - 1)*recordPerPage + 1;
	    int endNO = currentPage*recordPerPage;
	      
		//시작페이지번호
		int startPage = 1;
		
		//끝페이지번호
		int endPage = totalPage;
		
		//시작페이지 미세조정
		if(currentPage <= 5){
		   startPage = 1;
		}else if(currentPage >= 6){
		   startPage = currentPage - 4;
		}
		
		//끝페이지 번호
		if(totalPage - currentPage <=5){
		   endPage = totalPage;
		}else if(totalPage - currentPage > 5){
		   if(currentPage<=5){
		      if(totalPage >10){
		         endPage = 10;
		      }else{
		         endPage = totalPage;
		      }
		   }else{
		      endPage = currentPage+4;
		   }
		}

	%>
         <main>
			<div class="container-fluid px-4">
       		<div class="card mb-4">
       		
       			<table class="table table-striped"
						style="text-align: center; border: 1ps solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
				<%
					ArrayList<BoardVO> list = dao.selectAll(startNo,recordPerPage);
					for(BoardVO vo : list){
				%>
					<tr>
                    <td><%=vo.getbNo() %></td>
                    <td><a href="boardDetail.jsp?bno=<%=vo.getbNo()%>"><%=vo.getbTitle() %></a></td>
                    <td><%=vo.getbWriter() %></td>
                    <td><%=vo.getbView() %></td>
                    <td><%=vo.getbRegdate() %></td>
                    </tr>
               <%
         			}
     			%>
                 </tbody>
               </table>
               
               <td colspan="4">
				<% for(int i =startPage;i<=endPage ; i++){
					%>
				<a href="boardList.jsp?cp=<%=i%>">[<%=i%>]</a>
				<%
					}
				%>
				</td>
       	</div>
       </div>
       	</main>
       </div>
	</div>

</body>
</html>