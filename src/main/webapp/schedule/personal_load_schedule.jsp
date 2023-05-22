 <%@page import="java.util.ArrayList"%>
<%@page import="vo.EmployeeVO"%>
<%@page import="vo.ScheduleVO"%>
<%@page import="dao.ScheduleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	Object obj = session.getAttribute("vo");
	int eNumber = 0;
	
	if(obj != null){
		EmployeeVO vo = (EmployeeVO)obj;
		eNumber = vo.geteNumber();
		String sType = request.getParameter("schedule_Type");
	    ScheduleDAO dao = new ScheduleDAO();
	    ArrayList<ScheduleVO> list = dao.personalLoadSchedule(eNumber,sType);
	    %>

	    [<% for (int i = 0; i < list.size(); i++) { %>
		      {
		        "title": "<%= list.get(i).getSContents() %>",
		        "start": "<%= list.get(i).getSStarDate() %>",
		        "end": "<%= list.get(i).getSEndDate() %>"
		      }<%= (i != list.size() - 1) ? ',' : "" %>
		<% } %>]
	<%}%>