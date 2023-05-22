<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.ScheduleDAO" %>

<%
  String sContents = request.getParameter("title");
	out.println(sContents);
  // sNumber를 사용하여 일정을 삭제하는 메소드 호출
  ScheduleDAO dao = new ScheduleDAO();
  dao.deleteSchedule(sContents);
  dao.close();
%>