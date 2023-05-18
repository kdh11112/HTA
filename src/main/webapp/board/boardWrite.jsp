<%@page import="vo.EmployeeVO"%>
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
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="../css/summernote/summernote-lite.css">
		<!-- include summernote css/js -->
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
		<script src="../js/summernote/lang/summernote-ko-KR.js"></script>
		
		<link rel="shortcut icon" href="#">
		<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
		<title>게시글</title>
		<link rel="stylesheet" href="../css/board.css">
		<style type="text/css">
/* 			a, a:hover {
				color: #000000;
				text-decoration: none;
			} */
			td {
	        	text-align: left !important;
	   		} 
	   		th{
	   			font-size: 16px;
	   			width: 150px;
	   			padding: 0px 15px;
	   		}
		</style>
		<!-- <script src ="../js/httpRequest.js"></script> -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	</head>
	<body class="sb-nav-fixed">
	<%
		Object obj= session.getAttribute("vo");
		String ename = null;
		int enumber=0;
		
		if(obj != null){
			EmployeeVO vo = (EmployeeVO)obj;
			ename = vo.geteName();
			enumber= vo.geteNumber();
		}
	
	%>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark"><%@ include file="../menu/navi.jsp" %></nav>
        <div id="layoutSidenav"> 
        <div id="layoutSidenav_nav"><%@ include file="../menu/side.jsp" %></div>  
        <div id="layoutSidenav_content">
            <main>
	         <div class="container-fluid px-4">
	         	<h1 class="mt-4">게시판</h1>
	         	<div class="card mb-4">
      			<h2>게시글 작성</h2>
			<form action="boardWriteOk.jsp" method="post">
       		<input type="hidden" value="board_write" name="command">
           	<table>
               <tr>
                   <th>제목 *</th>
                   <td><input type="text" name="title"></td>
               </tr>
               <tr>
                   <th>사원명 *</th>
                   <!-- 글자 수정 못하게 하고싶다면 disabled 줌
					disabled은 다음 페이지로 값 전달이 안돼서 hidden 넣어서 전달해줘야 함 -->
                   <td><input type="text" name="ename" value="<%=ename %>" disabled="disabled">
                   <input type="hidden" name="ename" value="<%=ename %>" />
                   <input type="hidden" name="enumber" value="<%=enumber %>" disabled="disabled" /></td>
               </tr>
               <tr>
                   <th>첨부파일</th>
                   <td><input type="file" name="file"></td>
               </tr>
               <tr>
                   <th>내용</th>
                   <td><textarea class="summernote" name="content" cols="100" rows="15" ></textarea></td>
               </tr>
           </table>
           <input name="btn" type="submit" class="btn btn-secondary" value="등록">
           <input name="btn" type="reset" class="btn btn-secondary" value="다시작성하기">
           <a href="boardList.jsp">
           <input name="btn" type="button" class="btn btn-secondary" value="취소" ></a>
		</form>
				</div>
			</div>
		</main>
		<footer class="py-4 bg-light mt-auto"><%@ include file="../menu/footer.jsp" %></footer>
		</div>
        </div>
        
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
       	<script src="../js/scripts.js"></script><!-- 사이드바 열고 닫기 -->
       	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

       	<script>
	       	jQuery.noConflict();
	       	jQuery(document).ready(function($) {
	       	   $(".summernote").summernote({
	       	      height: 150,
	       	      lang: "ko-KR"
	       	   });
	       	});
       	</script>
        	
</body>
</html>