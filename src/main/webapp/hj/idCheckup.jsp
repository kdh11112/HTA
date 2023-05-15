<%@page import="hj.EmployeeDAO"%>
<%@page import="hj.EmployeeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//1.파라미터값 가져오기: idCheckup.jsp?id=aaa
String id = request.getParameter("id");
//2.ID가 null이 아니면 
if(id!=null){
//3. MemberDAO
	EmployeeDAO dao = new EmployeeDAO();
//4. dao.getOne(aaa)
	EmployeeVO vo = dao.getOne(id);
//5. vo가 널이면 회원 존재한다는 뜻 : 화면에 true 출력
	if(vo==null){
		out.println(true);
//6. vo가 널이 아니면 회원 존재하지 않는다는 뜻: false 출력
	}else if(vo!=null){
		out.println(false);
	}
	
}

%>