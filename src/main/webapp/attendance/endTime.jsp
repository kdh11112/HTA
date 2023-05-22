<%@page import="vo.AttendenceVO"%>
<%@page import="dao.AttendenceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	

	//dao 객체 생성
	AttendenceDAO dao =  new AttendenceDAO();
	AttendenceVO vo = new AttendenceVO();
	int enumber = Integer.parseInt(id);
	
	int result=0;
	//db에 가서 endTime값을 가져오기
	vo = dao.getEndTime(enumber);
	
	//null이면 업데이트  result=1
			if(vo==null){
				AttendenceVO vo2 = dao.getEndTime(enumber);
				result = dao.endTimeAddOne(enumber);
			//	vo.setEnumber(enumber);	
			}
	//아니면 result=0

	//vo.setOfficeGoingHour(endTime);
	//int id = Integer.parseInt(time);
	
	//dao.endTimeAddOne(id);

	//result값이 1이면 성공 0이면 실패

	out.println(result);

	
	//dao.close();
%>
