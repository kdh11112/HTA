<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.파라미터 값 가져오기
		String b = request.getParameter("bno");
		String title = request.getParameter("title");
		String contents = request.getParameter("content");
		
	//2.bno가 null이 아닐 때
		if(b!=null){
	//3.dao 객체
			int bno = Integer.parseInt(b);
			BoardDAO dao = new BoardDAO();
	//4.vo 객체	
			BoardVO vo = new BoardVO();
	
	//5.setter로 값 지정
			vo.setbNo(bno);
			vo.setbTitle(title);
			vo.setbContent(contents);
			
	//6.dao.updateOne(vo);
			dao.updateOne(vo);
			
	//7.list.jsp로 리다이렉트
			response.sendRedirect("boardList.jsp"); 
		}
	
	%>