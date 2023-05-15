<%@page import="hj.EmployeeVO"%>
<%@page import="hj.EmployeeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String birth = request.getParameter("datepicker");
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
	vo.setE_name(name);
	vo.setE_gender(gender);
	vo.setE_id(id);
	vo.setE_password(password);
	vo.setE_birth(birth);
	vo.setE_postal_code(postalcode);
	vo.setE_address1(address1);
	vo.setE_address2(address2);
	vo.setE_phone_number(phonenumber);
	
	dao.empRegister(vo);
	dao.close();


%>
