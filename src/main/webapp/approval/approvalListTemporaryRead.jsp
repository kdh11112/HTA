<%@page import="java.util.Map"%>
<%@page import="vo.ApprovalVO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="vo.EmployeeVO"%>
<%@page import="dao.EmployeeDAO"%>
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
		<!-- include libraries(jQuery, bootstrap) -->
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
		<link rel="shortcut icon" href="#">
		<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="../js/summernote/summernote-lite.js"></script>
		<script src="../js/summernote/lang/summernote-ko-KR.js"></script>
		<link rel="stylesheet" href="../css/summernote/summernote-lite.css">
        <title>테이블?</title>
        <style>
		    #myTable {
		        border-collapse: collapse;
		        width: 100%;
		    }
		    
		    #myTable th, #myTable td{
		        text-align: center;
		        padding: 8px;
		        border: 1px solid black;
		        width: 200px;
		    }
		    
		    #myTable th {
		        background-color: #d3d3d3;
		    }
		    
		    #myTable tr:nth-child(even) {
		        background-color: #f2f2f2;
		    }
		    input:focus {
		    	outline:none;

		    }
		    input {
		    	border: none; 
		    	background: transparent; 
		    	text-align: center; 
		    }
		    
		    #con { pointer-events: none !important; }
		</style>

    </head>
    <body class="sb-nav-fixed">
    <%
    	Object obj = session.getAttribute("vo");
    	String name = null;
    	String dname = null;
    	String position = null;
    	String of1st = null;
    	String of2rd = null;
    	String stamp = null;
    	int num = 0;
    	LocalDate now = LocalDate.now();
    	if(obj != null){
    		EmployeeVO vo = (EmployeeVO)obj;
    		name = vo.geteName();
    		dname = vo.getdName();
    		position = vo.geteOfficialResponsibilities();
    		num = vo.geteNumber();
    		stamp = vo.getEstamp();
    		
    	} 
    	
    	String pageNum = request.getParameter("pageNum");

    	if(pageNum != null){
    		int no = Integer.parseInt(pageNum);
    		
    		ApprovalDAO dao = new ApprovalDAO();
    		
    		ApprovalVO vo = dao.selectOne(no);
    		of1st = (String)ApprovalDAO.map.get("of1st");
    		of2rd = (String)ApprovalDAO.map.get("of2rd");
    		
    	
    	if(vo != null){
    		

    	
    
    %>
    	<script type="text/javascript">
			$(function(){
				$("input[value='제출하기']").on("click",function(){
					/*  var elem = document.getElementById("stampSelf");
					 elem.style.display=""; */
					 var stamp = "<%=stamp%>";
					 console.log(stamp);
					 $("#imgTd1").append($("<img>").attr("src",stamp));
					 
					 
					document.frm.method="get";
					document.frm.action="approvalListTemporaryReadOk.jsp";
					 document.frm.submit();  
				})
				
			})
		</script>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark"><%@ include file="../menu/navi.jsp" %></nav>
        <div id="layoutSidenav"> 
        	<div id="layoutSidenav_nav"><%@ include file="../menu/side.jsp" %></div>  
           	 	<div id="layoutSidenav_content">
            		<form action="approvalListTemporaryReadOk.jsp" name="frm" method="get">
		            	<main>
		                    <div class="container-fluid px-4">
		                        <h1 class="mt-4">전자결재 작성</h1>
									<div class="card mb-4">
									    <div class="card-header">
									        <table class="table table-striped">
									            <tr>
									                <th>기안담당 : <%=vo.getaName() %></th>
									                <th>기안부서 : <%=dname %></th>
									                <th>기안일자 : <%=vo.getaStartDate() %></th>
									            </tr> 
									        </table>
									    </div>
									     <table id="myTable">
										    <tr>
										        <td rowspan="4">결재</td>
										    </tr>
									        <tr>
									        	<input type="hidden" name="pageNum" value="<%=pageNum %>"/>
									            <th><%=vo.getaDepartmentName() %></th>
									            <!-- <th class="position2" id="data-placeholder2"></th> -->
									        	<th class="position2"><input type="text" id="data-placeholder2" name="data-placeholder2" value="<%=of1st %>"  readonly></th>
									            <th class="position3"><input type="text" id="data-placeholder4" name="data-placeholder4" value="<%=of2rd %>" readonly></th>
									            <!-- <input type="text" id="data-placeholder2" name="data-placeholder1"> -->
									        </tr>
									        <tr>
									            <td><%=vo.getaName() %></td>
									            <td class="position2"><input type="text" id="data-placeholder1" name="data-placeholder1" value="<%=vo.getaName1st() %>" readonly></td>
									            <td class="position3"><input type="text" id="data-placeholder3" name="data-placeholder3" value="<%=vo.getaName2nd() %>" readonly></td>
									        </tr>
									        <tr>
									            <td id="imgTd1" style="height: 50px"></td>
									            <td class="position2"></td>
									            <td class="position3"></td>
									        </tr>
									    </table>
									</div>

		                            <table class="table table-striped">
		                            	
			                            	
		                            	<tr><td>제목 <input class="titles" type="text" name="title" value="<%=vo.getaTitle() %>" id="title" style="width: 90%; text-align: left;" /></td></tr>
										<tr>
											<td><textarea class="summernote" id="con" name="contents"><%=vo.getaContent()%></textarea></td>
											<td><input type="hidden" name="contentsHidden" value="<%=vo.getaContent() %>"/></td>
										</tr>
										<tr>
											<td colspan="2">
												 <input class="btn btn-info" type="button" value="제출하기" />
											</td>
										</tr>
		                            </table>
		                    </div>
		                 </main>
           			 </form>
				<footer class="py-4 bg-light mt-auto"><%@ include file="../menu/footer.jsp" %></footer>
            </div>
           			 <%
    		}
    	dao.close();
    	}
           			 %>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/scripts.js"></script><!-- 사이드바 열고 닫기 -->

		<script type="text/javascript">
		$(document).ready(function() {
		    $('.summernote').summernote({
		        height: 300,
		        minHeight: null,
		        maxHeight: null,
		        focus: true,
		        placeholder: '최대 2048자까지 쓸 수 있습니다',
		        toolbar: [
		            ['fontname', ['fontname']],
		            ['fontsize', ['fontsize']],
		            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		            ['color', ['forecolor','color']],
		            ['para', ['ul', 'ol', 'paragraph']],
		            ['height', ['height']]
		        ],
		        fontNames: ['맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		    });

		});
		</script>
    </body>
</html>