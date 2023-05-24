<%@page import="vo.EmployeeVO"%>
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


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="../js/summernote/summernote-lite.js"></script>
<script src="../js/summernote/lang/summernote-ko-KR.js"></script>
<script>
  $(document).ready(function() {
    initializeSummernote(); // Summernote 초기화 함수 호출
  });

  // Summernote 초기화 함수
  function initializeSummernote() {
    // 이미 Summernote가 초기화되었는지 확인
    if (!$('.summernote').summernote('code')) {
      $('.summernote').summernote({
        height: 450,
        width: 1300,
        codemirror: {
          theme: 'monokai'
        },
        toolbar: [
          // [groupName, [list of button]]
          ['fontname', ['fontname']],
          ['fontsize', ['fontsize']],
          ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
          ['color', ['forecolor', 'color']],
          ['table', ['table']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['height', ['height']],
          ['insert', ['picture', 'link', 'video']],
          ['view', ['fullscreen', 'help']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
        fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72']
      });
    }
  }

  // 페이지 로드 함수
  function loadPage(page) {
    var url = "mailRecivebox.jsp?cp=" + page;
    $.ajax({
      url: url,
      dataType: "html",
      success: function(response) {
        $(".right_main").html(response);
        initializeSummernote(); // Summernote 초기화
      },
      error: function(xhr, status, error) {
        console.error(error);
      }
    });
  }
</script>
</head>

<body>

<%
  Object obj = session.getAttribute("vo");
  if (obj == null) {
    response.sendRedirect("/HTA_Project_semi/login2.jsp");
    /* 로그인 되어 있을때만 화면에 출력
    그렇지 않으면 login.jsp 되돌려보내기 */
  } else {
    // 전체 게시물 건수를 출력 ?
    EmployeeVO vo2 = (EmployeeVO) obj;
    int enumber = vo2.geteNumber();
    
    MailDAO dao = new MailDAO();

    // 총게시물 건수 ? :
    
    int totalCount = dao.getTotalCountRecive(enumber);
    // 한 페이지당 게시물 건수 : 10
    int recordPerPage = 10;
    // 총 페이지 수 :
    int totalPage = (totalCount % recordPerPage == 0) ? (totalCount / recordPerPage)
        : (totalCount / recordPerPage) + 1;

    // 현재페이지 번호
    String cp = request.getParameter("cp");
    
    int currentPage = 0;
    if (cp != null) {
      currentPage = Integer.parseInt(cp);
    } else {
      currentPage = 1;
    }
    // 1페이지 : 시작번호 1: 끝번호 : 20
    // 2페이지 : 시작번호 21: 끝번호 : 40
    // 3페이지 : 시작번호 41: 끝번호 : 60

    // 시작번호
    int startNo = (currentPage - 1) * recordPerPage + 1;
    // 끝 번호
    int endNo = currentPage * recordPerPage;

    // 시작페이지번호
    int startPage = 1;
    int endPage = totalPage;
    // 끝페이지 번호

    // 시작페이지 미세조정
    if (currentPage <= 5) {
      startPage = 1;
    } else if (currentPage >= 6) {
      startPage = currentPage - 4;
    }
    // 끝페이지 번호
    if (totalPage - currentPage <= 5) {
      endPage = totalPage;
    } else if (totalPage - currentPage > 5) {
      if (currentPage <= 5) {
        if (totalPage > 10) {
          endPage = 10;
        } else {
          endPage = totalPage;
        }
      } else {
        endPage = currentPage + 4;
      }
    }
%>

<table class="table table-striped" style="text-align: center; border: 1ps solid #dddddd">
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
      ArrayList<MailVO> list = dao.selectAllRecive(startNo, endNo, enumber);
      for (MailVO vo : list) {
    %>
    <tr>
      <td><%= vo.getMNumber() %></td>
      <td><a href="#" onclick="loadPage(<%= vo.getMNumber() %>); return false;"><%= vo.getMTitle() %></a></td>
      <td><%= vo.getENumber() %></td>
      <td><%= vo.getMRegdate() %></td>
    </tr>
    <%
      }
    %>
    <tr>
      <td colspan="4">
        <%
          for (int i = startPage; i <= endPage; i++) {
        %>
        <a href="#" onclick="loadPage(<%= i %>); return false;">[<%= i %>]</a>
        <%
          }
        }
        %>
      </td>
    </tr>
  </tbody>
</table>

</body>
</html>
