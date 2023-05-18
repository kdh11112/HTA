<%@page import="vo.EmployeeVO"%>
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
    
		Object obj = session.getAttribute("vo");
    	int eNum = 0;
    	if(obj != null){
    		EmployeeVO vo = (EmployeeVO)obj;
    		eNum = vo.geteNumber();
    	}
    	
    	ApprovalDAO dao = new ApprovalDAO();
    	int totalCount = dao.getTotalCount(eNum);
    	//페이징 10개씩
    	int recordPerPage = 10;
    	int totalPage = (totalCount%recordPerPage == 0) ? totalCount/recordPerPage : totalCount/recordPerPage+1;
    	
    	String pageNum = request.getParameter("pageNum");
    	int currentPage = 0;
    	/* int pageNumInt = Integer.parseInt(pageNum); */
    	if(pageNum != null){
    		currentPage = Integer.parseInt(pageNum);
    	}else{
    		currentPage = 1;
    	}
    	
    	int startNo = (currentPage -1) * recordPerPage +1;
    	int endNo = currentPage * recordPerPage;
    	
    	//시작페이지
    	int startPage = 1;
    	//끝페이지
    	int endPage = totalPage;
    	
    	int prevPage = currentPage > 1 ? currentPage - 1 : 1;
    	int nextPage = currentPage < totalPage ? currentPage + 1 : totalPage;
    	
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
                                    	ArrayList<ApprovalVO> list = dao.selectAll(startNo,endNo,eNum);
                                    	for(ApprovalVO vo : list){
                                    		
                                    	
                                    %>
                                    	<tr style="line-height: 2;">
                                    		<td><%=vo.getaNumber() %></td>
                                    		<td><a href="approvalModify.jsp?pageNum=<%=vo.getaNumber() %>"> <%=vo.getaTitle() %></a></td>
                                    		<td><%=vo.getaName() %></td>
                                    		<td><%=vo.getaStartDate() %></td>
                                    		<td><%=vo.getaStatus() %></td>
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
									      <a class="page-link" href="approvalList.jsp?pageNum=<%=prevPage %>" aria-label="Previous">
									        <span aria-hidden="true">&laquo;</span>
									      </a>
									    </li>
                                	<%
                                		for(int i=startPage; i<=endPage; i++){
                                			
                                	%>
									    <li class="page-item">
									  <a class="page-link" href="approvalList.jsp?pageNum=<%=i%>"> <%=i %></a>
									    </li>
                                	<%
                                		}
                                	%>
									    <li class="page-item">
									      <a class="page-link" href="approvalList.jsp?pageNum=<%=nextPage %>" aria-label="Next">
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
