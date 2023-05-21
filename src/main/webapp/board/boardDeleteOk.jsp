<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//1. 파라미터 값 가져오기 : bno
		String b = request.getParameter("bno");
	//2. null이 아니면
		if(b!=null){
	//3. 숫자로 형변환
		int bno = Integer.parseInt(b);
	//4. dao객체 생성
		BoardDAO dao = new BoardDAO();
	//5. dao.deleteOne(bno);
		dao.deleteOne(bno);
		}
	//6. list.jsp로 redirect
		response.sendRedirect("boardList.jsp"); 

%>