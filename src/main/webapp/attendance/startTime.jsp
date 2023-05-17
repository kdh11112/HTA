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
	//시간을 받아오는 파라미터
	String id = request.getParameter("id");
	String date1 = request.getParameter("workingDate");
	String startTime = request.getParameter("officeGoingHour");
	
	int enumber = Integer.parseInt(id);
	
	//dao 객체 생성
	AttendenceDAO dao =  new AttendenceDAO();
	//vo객체 생성
	AttendenceVO vo = new AttendenceVO();
	
	vo.setEnumber(enumber);

	dao.addOne(vo);
	
	
	
	//dao.close();
%>
	
</body>
</html>