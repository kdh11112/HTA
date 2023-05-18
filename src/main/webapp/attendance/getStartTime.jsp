<%@page import="java.util.ArrayList"%>
<%@page import="vo.AttendenceVO"%>
<%@page import="dao.AttendenceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String id = request.getParameter("id");
int enumber = Integer.parseInt(id);

AttendenceDAO dao = new AttendenceDAO();
AttendenceVO vo = dao.getStartTime(enumber);

System.out.println("vo : " + vo);


vo.setEnumber(enumber);
/* ArrayList<AttendenceVO> list = dao.getDate(enumber); */
vo = dao.getStartTime(enumber);


out.println(vo.getOfficeGoingHour());
%>