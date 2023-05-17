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
		       
		</style>
		<script type="text/javascript">
				var url = null;
				var option = null;
				var title = null;
			$(function(){
				$(".position2").on("click",function(){
					url = "../emp_search/info.jsp";
					option = "width = 825px, height = 650px, top = 100, left = 200, location = no";
					title = '자식창1';
					window.open(url,title,option,"window.opener");
				})

				
			})
			
			$(function(){
				$(".position3").on("click",function(){
					url = "../emp_search/info.jsp";
					option = "width = 825px, height = 650px, top = 100, left = 200, location = no";
					title = '자식창2';
					window.open(url,title,option,"window.opener");
				})
			})
			
			window.addEventListener("message", receiveMessageFromChild, false);
	
				function receiveMessageFromChild(event) {
				  console.log(event.data);
				  var dataArray = event.data.split(",");
					for(var i=0; i<dataArray.length; i++){
						if(title == '자식창1'){
					    document.getElementById('data-placeholder1').innerHTML = dataArray[1]; 
					    document.getElementById('data-placeholder2').innerHTML = dataArray[2]; 						
					}else if(title == '자식창2'){
					    document.getElementById('data-placeholder3').innerHTML = dataArray[1]; 
					    document.getElementById('data-placeholder4').innerHTML = dataArray[2]; 	
					}
				}
				}
			
		</script>
    </head>
    <body class="sb-nav-fixed">
    <%
    	Object obj = session.getAttribute("vo");
    	String name = null;
    	String dname = null;
    	String position = null;
    	int num = 0;
    	LocalDate now = LocalDate.now();
    	if(obj != null){
    		EmployeeVO vo = (EmployeeVO)obj;
    		name = vo.geteName();
    		dname = vo.getdName();
    		position = vo.geteOfficialResponsibilities();
    		num = vo.geteNumber();
    		
    	}
    	
    	
    
    %>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark"><%@ include file="../menu/navi.jsp" %></nav>
        <div id="layoutSidenav"> 
        	<div id="layoutSidenav_nav"><%@ include file="../menu/side.jsp" %></div>  
           	 	<div id="layoutSidenav_content">
            		<form action="approvalFormOK.jsp" method="get">
		            	<main>
		                    <div class="container-fluid px-4">
		                        <h1 class="mt-4">전자결재 작성</h1>
									<div class="card mb-4">
									    <div class="card-header">
									        <table class="table table-striped">
									            <tr>
									                <th>기안담당 : <%=name %></th>
									                <th>기안부서 : <%=dname %></th>
									                <th>기안일자 : <%=now %></th>
									            </tr> 
									        </table>
									    </div>
									     <table id="myTable">
										    <tr>
										        <td rowspan="4">결재</td>
										    </tr>
									        <tr>
									            <th><%=position %></th>
									            <th class="position2" id="data-placeholder2"></th>
									            <th class="position3" id="data-placeholder4"></th>
									        </tr>
									        <tr>
									            <td><%=name %></td>
									            <td class="position2" id="data-placeholder1"></td>
									            <td class="position3" id="data-placeholder3"></td>
									        </tr>
									        <tr>
									            <td><img src="../img/stamp/e_<%=num%>.png" /></td>
									            <td class="position2"></td>
									            <td class="position3"></td>
									        </tr>
									    </table>
									</div>
		
		                            <table class="table table-striped">
										<tr>
											<textarea class="summernote" name="contents"></textarea>
										</tr>
										<tr>
											<td colspan="2">
												<input class="btn btn-primary" type="submit" value="제출하기" />
												<input class="btn btn-primary" type="submit" value="임시저장" />
												<input class="btn btn-info" type="reset" value="다시쓰기" />
											</td>
										</tr>
		                            </table>
		                    </div>
		                 </main>
           			 </form>
				<footer class="py-4 bg-light mt-auto"><%@ include file="../menu/footer.jsp" %></footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/scripts.js"></script><!-- 사이드바 열고 닫기 -->

        <script type="text/javascript">
        		$('.summernote').summernote({
        		  disableDragAndDrop: true,
				  height: 300,                 // 에디터 높이
				  minHeight: null,             // 최소 높이
				  maxHeight: null,             // 최대 높이
				  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
					// 한글 설정
				  placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
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
			})	
		</script>
    </body>
</html>