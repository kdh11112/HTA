<%@page import="dao.AddfileDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.BoardDAO"%>
<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	//upload 디렉토리의 실제 경로 얻어오기
	String saveDir = request.getRealPath("/upload");
	//첨부파일 최대 크기
	int maxFileSize = 1024*1024*30;

	MultipartRequest mr = new MultipartRequest(request, saveDir, maxFileSize, "UTF-8", new DefaultFileRenamePolicy());
	
	//파라미터값 가져오기
	String title = mr.getParameter("title");
	String ename = mr.getParameter("ename");
	String content = mr.getParameter("content");
	String enumber = mr.getParameter("enumber");
	int eNumber = 0;
	/* out.println("writer : "+ename);
	out.println("enumber : "+enumber);  */
	if(enumber != null)
		eNumber = Integer.parseInt(enumber);
	
	BoardVO vo = new BoardVO();
	
	//파일의 원래 이름
	String bno = mr.getParameter("bno");
	int bNo = 0;
	if(bno != null)
		bNo = Integer.parseInt(bno);
	
	String fName = mr.getOriginalFileName("fName");
	
	String fLoc = saveDir;
	
	//db에도 저장되어 있어야 함
	AddfileDAO dao = new AddfileDAO();
	dao.upload(bNo, fName, fLoc);
	
	//2. 이 값이 null이면 list.jsp 리다이렉트
	// equals: 아무값도 안줬을때도 넘어가게 하기위해
	if(title == null /* || ename == null  */ || content == null
		|| title.equals("") ||/*  ename.equals("") || */ content.equals("") ){
		response.sendRedirect("boardList.jsp");
	//3. null이 아니면 dao객체 생성
	}else if(title != null && /* ename != null && */ content != null){
		BoardDAO bdao = new BoardDAO();
		vo.setbTitle(title);
		vo.setbWriter(ename);
		vo.setbContent(content);
		vo.seteNumber(eNumber);
	//4. dao.addOne(vo); //db에 저장
  		bdao.addOne(vo);			
	//5. list.jsp 리다이렉트
		response.sendRedirect("boardList.jsp");  
		out.println(title);
	}
	

%>