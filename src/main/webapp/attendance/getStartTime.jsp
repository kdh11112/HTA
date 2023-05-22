<%@page import="java.util.ArrayList"%>
<%@page import="vo.AttendenceVO"%>
<%@page import="dao.AttendenceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");//파라미터로 전달 받은 id값 가져오기
int enumber = Integer.parseInt(id);//id값을 정수로 변환

AttendenceDAO dao = new AttendenceDAO();//dao객체 생성
AttendenceVO vo = dao.getStartTime(enumber);//출근시간정보 가죠옴

System.out.println("vo : " + vo);//vo출력 띠버깅

vo.setEnumber(enumber);//vo객체에 사원번호 설정

out.println(vo.getOfficeGoingHour());//츌근시간출력
%>