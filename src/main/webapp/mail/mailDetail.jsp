<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script>
  $(document).ready(function() {
    initializeSummernote(); // Summernote 초기화 함수 호출
  });

  // Summernote 초기화 함수
  function initializeSummernote() {
    $('.summernote').summernote({
      height: 450, // 서머노트 에디터 높이
      width: 1900,
      codemirror: {
        theme: 'monokai' // codemirror options
      }
    });
  }
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>메일 디테일페이지입니다.</h2>
</body>
</html>