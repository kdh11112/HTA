<%@page import="vo.ScheduleVO"%>
<%@page import="dao.ScheduleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String content = request.getParameter("content");
	String start_date = request.getParameter("start_date");
	String end_date = request.getParameter("end_date");
	out.println("content : " + content);
	out.println("start_date : " + start_date);
	out.println("end_date : " + end_date);
	
	ScheduleDAO dao = new ScheduleDAO();
	dao.addScheduleTest(content, start_date, end_date);


%>
