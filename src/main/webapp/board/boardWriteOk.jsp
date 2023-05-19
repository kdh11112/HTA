<%@page import="dao.BoardDAO"%>
<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//파라미터값 가져오기
	String title = request.getParameter("title");
	String ename = request.getParameter("ename");
	String content = request.getParameter("content");
	String enumber = request.getParameter("enumber");
	int eNumber = 0;
	/* out.println("writer : "+ename);
	out.println("enumber : "+enumber); */
	if(enumber != null)
		eNumber = Integer.parseInt(enumber);
	
	BoardVO vo = new BoardVO();
	
	//2. 이 값이 null이면 list.jsp 리다이렉트
	// equals: 아무값도 안줬을때도 넘어가게 하기위해
	if(title == null /* || ename == null  */ || content == null
		|| title.equals("") ||/*  ename.equals("") || */ content.equals("") ){
		response.sendRedirect("boardList.jsp");
	//3. null이 아니면 dao객체 생성
	}else if(title != null && /* ename != null && */ content != null){
		BoardDAO dao = new BoardDAO();
		vo.setbTitle(title);
		vo.setbWriter(ename);
		vo.setbContent(content);
		vo.seteNumber(eNumber);
	//4. dao.addOne(vo); //db에 저장
  		dao.addOne(vo);			
	//5. list.jsp 리다이렉트
		response.sendRedirect("boardList.jsp");  
		out.println(title);
	}
	

%>