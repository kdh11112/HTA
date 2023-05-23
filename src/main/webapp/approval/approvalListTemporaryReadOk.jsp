<%@page import="vo.ApprovalVO"%>
<%@page import="dao.ApprovalDAO"%>
<%@page import="vo.EmployeeVO"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		
	String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(pageNum);
	Object obj = session.getAttribute("vo");
	System.out.println(num);
	if(obj != null){
			
	EmployeeVO vo = (EmployeeVO)obj;
		
		ApprovalDAO dao3 = new ApprovalDAO();
		ApprovalVO vo3 = new ApprovalVO();
		dao3.updateTemp(num,vo.getEstamp());
		response.sendRedirect("approvalList.jsp");   



		
	
}


%>