<%@page import="vo.AttendenceVO"%>
<%@page import="dao.AttendenceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//시간을 받아오는 파라미터
	String id = request.getParameter("id");
/* 	String date1 = request.getParameter("workingDate");
	String startTime = request.getParameter("officeGoingHour"); */
	
	int enumber = Integer.parseInt(id);
	
	//dao 객체 생성
	AttendenceDAO dao =  new AttendenceDAO();
	//vo객체 생성
	AttendenceVO vo = new AttendenceVO();
	
	vo.setEnumber(enumber);

	// id ==> 30 인 사원의 출근기록이 있는지 확인 
	AttendenceVO vo2 = dao.getStartTime(enumber);
	int result =0;
	if(vo2 ==null){
		result = dao.addOne(vo);
	}else{
		result=0;
	}
	// 있으면 0을 리턴한다.
	
	
	// 없다면 insert 
	
	
	out.println(result);
	
	
	//dao.close();
%>
