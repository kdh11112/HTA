<%@page import="vo.ApprovalVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ApprovalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>내 문서함</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
		<link rel="shortcut icon" href="#">
    </head>
    <body class="sb-nav-fixed">
    <%
    	ApprovalDAO dao = new ApprovalDAO();
    	
    	
    	
    %>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark"><%@ include file="../menu/navi.jsp" %></nav>
        <div id="layoutSidenav"> 
        <div id="layoutSidenav_nav"><%@ include file="../menu/side.jsp" %></div>  
            <div id="layoutSidenav_content">
            	<main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">내 문서함</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                여기에 뭘 넣어볼까?
                            </div>
                            <div class="card-body">
                                <table class="table table-striped .w-auto">
                                    <thead>
                                        <tr>
                                            <th>문서번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>기안일</th>
                                            <th>상태</th>
                                        </tr>
                                    </thead>
                                    <%
                                    	ArrayList<ApprovalVO> list = dao.selectAll();
                                    	for(ApprovalVO vo : list){
                                    		
                                    	
                                    %>
                                    	<tr style="line-height: 2;">
                                    		<td><%=vo.getA_number() %></td>
                                    		<td><%=vo.getA_title() %></td>
                                    		<td><%=vo.getA_name() %></td>
                                    		<td><%=vo.getA_end_date() %></td>
                                    		<td><%=vo.getA_status() %></td>
                                    	</tr>
                                    <%
                                    	}
                                    %>
                                </table>
                                <tr>
                                	<td colspan="4">
                                	<nav aria-label="Page navigation example">
									  <ul class="pagination">
									    <li class="page-item">
									      <a class="page-link" href="#" aria-label="Previous">
									        <span aria-hidden="true">&laquo;</span>
									      </a>
									    </li>
                                	<%
                                		for(int i=0; i<10; i++){
                                			
                                	%>
									    <li class="page-item">
									  <a class="page-link" href="approvalList.jsp?pageNum=<%=i%>"> <%=i %></a>
									    </li>
                                	<%
                                		}
                                	%>
									    <li class="page-item">
									      <a class="page-link" href="#" aria-label="Next">
									        <span aria-hidden="true">&raquo;</span>
									      </a>
									    </li>
									  </ul>
									</nav>
                                			
                                	</td>
                                </tr>
                            </div>
                        </div>
                    </div>
                 </main>
				<footer class="py-4 bg-light mt-auto"><%@ include file="../menu/footer.jsp" %></footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/scripts.js"></script><!-- 사이드바 열고 닫기 -->
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    </body>
</html>
