<%@page import="vo.EmployeeVO"%>
<%@page import="vo.ScheduleVO"%>
<%@page import="dao.ScheduleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String schedule_Type =request.getParameter("schedule_Type");
	if(schedule_Type.equals("개인")){
		

		Object obj = session.getAttribute("vo");
		int eNumber = 0;
	
		if(obj != null){
			EmployeeVO vo = (EmployeeVO)obj;
			eNumber = vo.geteNumber();
			
			String contents = request.getParameter("contents");
			String start_date = request.getParameter("start_date");
			String end_date = request.getParameter("end_date");
			String sType = request.getParameter("schedule_Type");
			out.println("<script>window.close();</script>");
			ScheduleDAO dao = new ScheduleDAO();
			if(contents == null){
				out.println("<script>alert('내용을 입력해주세요')</script>");
			}
			dao.addSchedule(contents, start_date, end_date, eNumber,sType);
			dao.close();
		}
	}else if(schedule_Type.equals("부서")){
		

		Object obj = session.getAttribute("vo");
		int eNumber = 0;
		String dName = null;
		
		if(obj != null){
			EmployeeVO vo = (EmployeeVO)obj;
			eNumber = vo.geteNumber();
			String contents = request.getParameter("contents");
			String start_date = request.getParameter("start_date");
			String end_date = request.getParameter("end_date");
			String sType = request.getParameter("schedule_Type");
			out.println("<script>window.close();</script>");
			ScheduleDAO dao = new ScheduleDAO();
			dao.addDepartmentSchedule(contents, start_date, end_date, eNumber, sType);
			dao.close();
			if(contents == null){
				out.println("<script>alert('내용을 입력해주세요')</script>");
			}
		}
	}
%>
