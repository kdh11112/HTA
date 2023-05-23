<%@page import="vo.AttendenceVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.AttendenceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //
    String id = request.getParameter("id");//파라미터로 전달 받은 id값 가져오기
    int enumber = Integer.parseInt(id);//id값을 정수로 변환
    
   	AttendenceDAO dao = new AttendenceDAO();//dao객체 생성
    ArrayList<AttendenceVO> vo = dao.getDate(enumber);//출근시간 퇴근시간 정보 가져옴
    System.out.println("getDate:"+vo);//띠버깅
    out.println(vo ); //출퇴근시간출력
    %>