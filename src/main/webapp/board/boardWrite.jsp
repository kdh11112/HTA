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
		<link rel="shortcut icon" href="#">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script src="../js/summernote/summernote-lite.js"></script>
		<script src="../js/summernote/lang/summernote-ko-KR.js"></script>
		<link rel="stylesheet" href="../css/summernote/summernote-lite.css">
		<title>게시글</title>
		<style type="text/css">

			td {
	        	text-align: left !important;
	   		} 
	   		th{
	   			font-size: 16px;
	   			width: 150px;
	   			padding: 0px 15px;
	   		}
		</style>
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
			<form action="boardWriteOk.jsp" method="post" accept-charset="UTF-8" enctype="multipart/form-data">
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
                   <input type="hidden" name="enumber" value="<%=enumber %>"/></td>
               </tr>
               <tr>
                   <th>첨부파일</th>
                   <td><input type="file" name="file"></td>
               </tr>
               <tr>
                   <th>내용</th>
                   <td><textarea class="summernote" name="content"  ></textarea></td>
               </tr>
           </table>
           <input name="btn" type="submit" class="btn btn-secondary" value="등록">
           <input name="btn" type="reset" class="btn btn-secondary" value="다시작성하기" onclick=reset();>
           <a href="boardList.jsp">
           <input name="btn" type="button" class="btn btn-secondary" value="취소" ></a>
		</form>
				</div>
			</div>
		</main>
		<footer class="py-4 bg-light mt-auto"><%@ include file="../menu/footer.jsp" %></footer>
		</div>
        </div>

		<!--  부트스트랩 JS -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
       	<script src="../js/scripts.js"></script><!-- 사이드바 열고 닫기 -->
      
       	<script>
       		$(function(){
       			$("input[value='다시작성하기']").on("click", function(){
       				$('#title').val('');
       				$('#file').val('');
       				$('.summernote').val('');
       			})
       		})
       	
	       	$('.summernote').summernote({
	       		disableDragAndDrop: true,
				height: 300,                 // 에디터 높이
				minHeight: null,             // 최소 높이
				maxHeight: null,             // 최대 높이
				focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				// 한글 설정
				placeholder: '내용을 입력하세요',	//placeholder 설정
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