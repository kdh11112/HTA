<%@page import="dao.EmployeeDAO"%>
<%@page import="vo.EmployeeVO"%>
<%@page import="vo.ProVO"%>
<%@page import="dao.ProDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <%
      
      ProDAO dao = new ProDAO();
      String name = null;
      
      ArrayList<EmployeeVO> list = dao.selectAll();
      for(EmployeeVO vo : list){
    	  name = vo.getE_name();
    	  out.println("사번: " + vo.getE_number() + " 이름: " + vo.getE_name() + " 직급: " + vo.getE_official_responsibilities() + " 부서명: " + vo.getD_name()+",");
      }

     String text = request.getParameter("txt");
	 out.println(text);
      if(text != null){
    	  ProDAO dao2 = new ProDAO();

    	  EmployeeVO vo = dao2.getOneName(text);
    	  if(vo != null){
    		  out.println("사번: " + vo.getE_number() + " 이름: " + vo.getE_name() + " 직급: " + vo.getE_official_responsibilities() + " 부서명: " + vo.getD_name()+"," + "<br/>");
    	  }
      } 
      
      
      
   %>
