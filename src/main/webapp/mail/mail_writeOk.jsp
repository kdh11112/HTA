<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeOk.jsp</title>
</head>
<body>
<%--

 <%

	//	1. 파라미터값 가져오기
			String writer = request.getParameter("writer"); 
			String title =  request.getParameter("title");
			String contents =  request.getParameter("contents");
	
			
	// 	2. 이 값이 널이면 list.jsp 리다이렉트
		if(writer == null || title == null || contents == null ||
			writer.equals("") || title.equals("") || contents.equals("")){
         System.out.println("널값");
         response.sendRedirect("list.jsp");
      }            
		   else{
		         BoardDAO dao = new BoardDAO();
		         BoardVO vo = new BoardVO();
		         vo.setTitle(title);
		         vo.setWriter(writer);
		         vo.setContents(contents);
		         vo.setIp(request.getLocalAddr());
		         
		         dao.addOne(vo);
		         
		         response.sendRedirect("list.jsp");
		      }
			// 	5. list.jsp로 리다이렉트

 %>
		<h2>작성자 : <%= writer %></h2>
 		<h2>제목 : <%= title %></h2>
		<h2>내용 : <%= contents %></h2>
		
  --%>
 
</body>
</html>