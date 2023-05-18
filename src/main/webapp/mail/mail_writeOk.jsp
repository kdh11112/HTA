<%@page import="vo.MailVO"%>
<%@page import="dao.MailDAO"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mail_writeOk.jsp</title>
</head>
<body>
 <%

	//	1. 파라미터값 가져오기
			//작성자 writer  e_number
			String writer = request.getParameter("writer");
 			int intwriter = Integer.parseInt(writer);
 
 			//수신자 reciver  e_number2
			String reciver = request.getParameter("reciverId");
 			//제목 
 			String title =  request.getParameter("title");
 			//내용
			String contents =  request.getParameter("contents");
			//첨부파일 -> 일단패스
			String file =  request.getParameter("file");
			//참조인
			String cc =  request.getParameter("cc");
			
			
	// 	2. 이 값이 널이면 list.jsp 리다이렉트
		if(writer == null || title == null || contents == null ||
			writer.equals("") || title.equals("") || contents.equals("")){
         System.out.println("널값");
         response.sendRedirect("mail_list.jsp");
      }        //널이 아니면 객체생성    
		   else{
		         MailDAO dao = new MailDAO();
		         MailVO vo = new MailVO();
		         
		         
		    	 vo.setENumber(intwriter);
		    	 
		         
		         
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