<%@page import="vo.ScheduleVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ScheduleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    ScheduleDAO dao = new ScheduleDAO();
    ArrayList<ScheduleVO> list = dao.selectAll();
%>

[<% for (int i = 0; i < list.size(); i++) { %>
  {
    "id": "<%= list.get(i).getENumber() %>",
    "title": "<%= list.get(i).getSContents() %>",
    "start": "<%= list.get(i).getSStarDate() %>",
    "end": "<%= list.get(i).getSEndDate() %>"
  }<%= (i != list.size() - 1) ? ',' : "" %>
<% } %>]