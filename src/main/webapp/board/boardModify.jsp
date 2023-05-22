<%@page import="vo.EmployeeVO"%>
<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
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

		td{
			text-align : left !important;
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
	//1. 전달받은 파라미터의 값 가져오기
		String b = request.getParameter("bno");
	//2. bno null 이 아니면
		if(b != null){
	//3. 숫자로 형 변환 
			int bno = Integer.parseInt(b);
	//4. dao 객체 
			BoardDAO dao = new BoardDAO();
	//5. dao를 통해서 지정한 게시물 가져오기(vo): dao.selectOne(bno);
			BoardVO vo = dao.selectOne(bno);
	//6. 화면에 출력(테이블 형태로 출력)
			if(vo!=null){
	//7. 자원반납 dao.close();
			dao.close();
	
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
	
	<form action="boardModifyOk.jsp" method="post" accept-charset="UTF-8" enctype="multipart/form-data">
	<table>
		<tr>
			<th>제목 *</th>
            <td><input type="text" name="title" value="<%=vo.getbTitle() %>" /></td>
        </tr>
        <tr>
			<th>사원명 *</th>
			<td><%=vo.getbWriter() %></td>        
        </tr>
        <tr>
			<th>조회수</th>
			<th><%=vo.getbView() %></th>        
        </tr>
        <tr>
        	<th>작성일시</th>
        	<th><%=vo.getbRegdate() %></th>
        	<input type="hidden" name="bno" value="<%=vo.getbNo() %>"/>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td><input type="file" name="filename"></td>
        </tr>
		<tr>
			<th>내용</th>
			<td><textarea class="summernote" name="content"><%=vo.getbContent() %></textarea></td>
		</tr>
		<tr>
			<td colspan="6">
			<a href="boardList.jsp">
			<input type="button" value="목록" />
			</a>
			<a href="boardModifyOk.jsp">
			<input type="submit" value="수정" />
			</a>
			</td>
		</tr>
		<%
		}
		dao.close();
			}
		%>
	</table>
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
	$(".summernote").summernote({
		disableDragAndDrop: true,
		height: 300,                 // 에디터 높이
		minHeight: null,             // 최소 높이
		maxHeight: null,
		//에디터에 커서 이동
		focus: true,
		toolbar: [
			//글꼴설정
			['fontname',['fontname']],
			//글자 크기 설정
			['fontsize',['fontsize']],
			//굵기, 기울임꼴, 밑줄, 취소선, 서식지우기
			['style',['bold','italic','underline','strikethrough','clear']],
			//글자색
			['color',['forecolor','color']],
			//표만들기
			['table',['table']]
		],	
		//추가한 글꼴
		fontNames: ['Arial', 'Arial Black', '맑은고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
		//추가한 폰트 사이즈
		fontSizes: ['8','9','10','11','12','14','16','18','20','21']
		
	});
	
	</script>
</body>
</html>