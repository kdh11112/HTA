 <%@page import="java.util.ArrayList"%>
<%@page import="vo.EmployeeVO"%>
<%@page import="vo.ScheduleVO"%>
<%@page import="dao.ScheduleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	Object obj = session.getAttribute("vo");
	String dName = null;
	if(obj != null){
		EmployeeVO vo = (EmployeeVO)obj;
		dName = vo.getdName();
		String sType = request.getParameter("schedule_Type");
	    ScheduleDAO dao = new ScheduleDAO();
	    ArrayList<ScheduleVO> list = dao.departmentLoadSchedule(dName,sType);
	    dao.close();
	    %>

	    [<% for (int i = 0; i < list.size(); i++) { %>
		      {
		        "title": "<%= list.get(i).getSContents() %>",
		        "start": "<%= list.get(i).getSStarDate() %>",
		        "end": "<%= list.get(i).getSEndDate() %>",
		        "backgroundColor":"#ff6060",
		        "borderColor":"#ff6060"
		      }<%= (i != list.size() - 1) ? ',' : "" %>
		<% } %>]
	<%}%>
