<%@page import="vo.EmployeeVO"%>
<%@page import="vo.ApprovalVO"%>
<%@page import="dao.ApprovalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%
	String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(pageNum);
	Object obj = session.getAttribute("vo");
	if(obj != null){
			
	EmployeeVO vo = (EmployeeVO)obj;
		
  	ApprovalDAO dao3 = new ApprovalDAO();
  	ApprovalVO vo3 = new ApprovalVO();
  	vo3.setaNumber(num);
  	EmployeeVO empVO = new EmployeeVO();
  	empVO.seteOfficialResponsibilities(vo.geteOfficialResponsibilities());
  	empVO.setEstamp(vo.getEstamp());
  	dao3.updateOne(vo3, empVO);
  	response.sendRedirect("approvalListWait.jsp"); 

	}
%>