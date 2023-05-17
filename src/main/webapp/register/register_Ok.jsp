<%@page import="vo.EmployeeVO"%>
<%@page import="dao.EmployeeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String birth = request.getParameter("birth");
	String postcode = request.getParameter("postcode");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String phonenumber = phone1+phone2+phone3;
	int postalcode = Integer.parseInt(postcode);
	EmployeeDAO dao = new EmployeeDAO();
	EmployeeVO vo = new EmployeeVO();
	/* String phonenumber = phone1.concat(phone2,phone3); */
	vo.seteName(name);
	vo.seteGender(gender);
	vo.seteId(id);
	vo.setePassword(password);
	vo.seteBirth(birth);
	vo.setePostalCode(postalcode);
	vo.seteAddress1(address1);
	vo.seteAddress2(address2);
	vo.setePhonenumber(phonenumber);
	
	dao.empRegister(vo);
	dao.close();

%>


