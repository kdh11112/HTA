<%@page import="vo.EmployeeVO"%>
<%@page import="java.io.File"%>
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
	<link href="../css/layout.css" rel="stylesheet">
	<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	<link rel="shortcut icon" href="#">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>	
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	      rel="stylesheet">
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
		
	<title>게시글보기</title>

</head>
<body class="sb-nav-fixed">
<%

	//저장된 쿠키 불러오기
	Cookie[] cookieFromRequest = request.getCookies();
	String cookieValue = null;
	for(int i = 0; i<cookieFromRequest.length; i++){
		// 요청정보로부터 쿠키를 가져온다.
		cookieValue = cookieFromRequest[0].getValue();
	}
	
	//글 목록 -> 글 상세 : 글번호
	String bno = request.getParameter("bno");
	
	//쿠키 세션 입력
	if(session.getAttribute(bno+":cookie") == null){
		session.setAttribute(bno+":cookie", bno+":"+cookieValue);
	}else{
		session.setAttribute(bno+":cookie ex", session.getAttribute(bno+":cookie"));
		if(!session.getAttribute(bno+":cookie").equals(bno+":"+cookieValue)){
			session.setAttribute(bno+":cookie", bno+":"+cookieValue);
		}
	}
	BoardVO vo = new BoardVO();

	
	//1. 전달받은 파라미터의 값 가져오기
		String b = request.getParameter("bno");
	//2. bno null 이 아니면
		if(b != null){
	//3. 숫자로 형 변환 
			int bNo = Integer.parseInt(b);
	//4. dao 객체 
			BoardDAO dao = new BoardDAO();
	//5. dao를 통해서 지정한 게시물 가져오기(vo): dao.selectOne(bno);
			vo = dao.selectOne(bNo);
			
			if(!session.getAttribute(bno+":cookie").equals(session.getAttribute(bno+":cookie ex"))){
				dao.countUpdate(vo);
				//가시적으로 조회수 1 +해줌
				vo.setbView(vo.getbView()+1);
			}
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
				<h1 class="mt-4">BOARD</h1>
				<div class="card mb-4">
				<table>
				<colgroup>
                    <col style="width:150px">
                    <col style="width:850px">
                </colgroup>
                <tbody>
                    <tr>
                        <th>제목</th>
                        <td><%=vo.getbTitle() %></td>
                    </tr>
                    <tr>
                        <th>조회수</th>
                        <td><%=vo.getbView() %></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td><%=vo.getbWriter() %></td>
                    </tr>
                    <tr>
                        <th>작성일시</th>
                        <td><%=vo.getbRegdate()%></td>
                    </tr>
                    <input type="hidden" name="bno" value="<%=vo.getbNo() %>"/>
                    <tr>
                        <th>내용</th>
                        <td>
                            <div name="contents" id="summernote" readonly>
                            <%
								String real = "D:\\dev\\eclipse\\web_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\HTA_Project_semi\\upload";
								File viewFile = new File(real+"\\"+bNo+"photo.jpg");
								if(viewFile.exists()){ 
							%>
						<br />
							<tr>
								<td colspan="6"><br><br><img src = "../upload/<%=bNo %>photo.jpg" width="300px" height="300px"><br/><br/><br />
							<% }
							else {
							%>
							<%
								} 
							%>
							<br /><br />
							<%=vo.getbContent() %>
							</div>
	                      </td>
                    </tr>
                    <tr>
						<td colspan="6">
						<a href="boardList.jsp"><input type="button" class="btn btn-secondary" value="목록" /></a>
						<a href="boardModify.jsp?bno=<%=vo.getbNo()%>"><input type="button" class="btn btn-secondary" value="수정" /></a>
						<a href="boardDeleteOk.jsp?bno=<%=vo.getbNo()%>"><input type="button" class="btn btn-secondary" value="삭제" /></a>
						</td>
					</tr>	
                </tbody>
            	</table>
				<input name="bno" type="hidden" value="<%= vo.getbNo() %>" /> 
							<%
							}
								}
							%>
				</div>
			</div>
		</main>
		<footer class="py-4 bg-light mt-auto"><%@ include file="../menu/footer.jsp" %></footer>
		</div>
        </div>
        
        <!--  부트스트랩 JS -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
       	<script src="../js/scripts.js"></script><!-- 사이드바 열고 닫기 -->
      
</body>
</html>