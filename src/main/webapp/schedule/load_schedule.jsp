<%@page import="vo.EmployeeVO"%>
<%@page import="vo.ScheduleVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ScheduleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	Object obj = session.getAttribute("vo");
	int eNumber = 0;
	String dName = null;
	
	if(obj != null){
		EmployeeVO vo = (EmployeeVO)obj;
		eNumber = vo.geteNumber();
		dName = vo.getdName();
		String sType = request.getParameter("schedule_Type");
	    ScheduleDAO dao = new ScheduleDAO();
	    ArrayList<ScheduleVO> list = dao.selectAll(dName, eNumber);
	    ArrayList<ScheduleVO> list2 = dao.departmentLoadSchedule(dName,sType);
	    dao.close();
%>

[<% for (int i = 0; i < list.size(); i++) { %>
  {
    "title": "<%= list.get(i).getSContents() %>",
    "start": "<%= list.get(i).getSStarDate() %>",
    "end": "<%= list.get(i).getSEndDate() %>"
  }<%= (i != list.size() - 1) ? ',' : "" %>
<% } %>

<% for (int i = 0; i < list2.size(); i++) { %>
  {
    "title": "<%= list2.get(i).getSContents() %>",
    "start": "<%= list2.get(i).getSStarDate() %>",
    "end": "<%= list2.get(i).getSEndDate() %>",
    "backgroundColor":"#ff6060",
	"borderColor":"#ff6060"
  }<%= (i != list2.size() - 1) ? ',' : "" %>
<% } %>]
<%}%>