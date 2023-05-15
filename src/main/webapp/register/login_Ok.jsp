<%@page import="vo.EmployeeVO"%>
<%@page import="dao.EmployeeDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String e_id = request.getParameter("e_id");
	String e_password = request.getParameter("e_password");
	
	
	if(e_id != null && e_password != null){
		EmployeeDAO dao = new EmployeeDAO();
		EmployeeVO vo = dao.getOne(e_id, e_password);
	
		// 테이블에 있는 정보 제대로 입력했을때 
		if(vo!=null){
			out.println(true);
		// session 내장객체 저장
		// 브라우저 종료되지 않는다면 정보가 사라지지 않음
		// 다른페이지 이동해도 session에서 꺼내면 꺼낼 수 있다
			session.setAttribute("vo", vo);
		
		// 테이블에 없는 정보 입력했을 때 
		}else if(vo==null){
			out.println(false);
		}
	}


%>