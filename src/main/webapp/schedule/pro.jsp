<%@page import="vo.ScheduleVO"%>
<%@page import="dao.ScheduleDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <%
      
      ScheduleDAO dao = new ScheduleDAO();
      
      
      ArrayList<ScheduleVO> list = dao.selectAll();
      out.println("<br/>");
      for(ScheduleVO vo : list){
    	  out.println("일정번호: " + vo.getS_NUMBER() + " 일정내용: " + vo.getS_CONTENTS() + " 시작일: " + vo.getS_START_DATE() + " 종료일: " + vo.getS_END_DATE()+" 사번: " +vo.getE_NUMBER() +  "," + "<br/>");
      }
      
      
    /*  String text = request.getParameter("txt");
	 out.println(text);
      if(text != null){
    	  ScheduleDAO dao2 = new ScheduleDAO();

          ScheduleVO vo = dao2.getOneName(text);
    	  if(vo != null){
    		  out.println("사번: " + vo.getEmpno() + " 이름: " + vo.getEname() + " 직급: " + vo.getJob() + " 부서명: " + vo.getDname()+"," + "<br/>");
    	  }
      }  */
      
   %>