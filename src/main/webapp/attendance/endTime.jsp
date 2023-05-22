<%@page import="vo.AttendenceVO"%>
<%@page import="dao.AttendenceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String time = request.getParameter("id");
	

	//dao 객체 생성
	AttendenceDAO dao =  new AttendenceDAO();
	//vo객체 생성
	//AttendenceVO vo = new AttendenceVO();
	

	//vo.setOfficeGoingHour(endTime);
	int id = Integer.parseInt(time);
	
	dao.endTimeAddOne(id);

	
	//dao.close();
%>
	
</body>
</html>