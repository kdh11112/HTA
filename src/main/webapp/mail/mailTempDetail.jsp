<%@page import="vo.MailVO"%>
<%@page import="dao.MailDAO"%>
<%@page import="dao.EmployeeDAO"%>
<%@page import="vo.EmployeeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="../js/summernote/summernote-lite.js"></script>
<script src="../js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../css/summernote/summernote-lite.css">

<style>


</style>
</head>

<body>

<%
    
	  String mno = request.getParameter("pages");
	  
	  int m = Integer.parseInt(mno);
	  
      MailDAO dao = new MailDAO();
     
     //메일번호를 주면 메일 vo를 넘겨주는 메서드
	// 5. dao를 통해서 지정한 게시물을 가져오기 (vo) : dao.selectOne(bno)
		 MailVO vo2 = dao.SelectOneMail(m);		 
     
     		int  reciverNo =  vo2.getENumber();
     		int  writerNo =  vo2.getENumber2();
     		
     		EmployeeDAO edao = new EmployeeDAO();
     		
     		EmployeeVO reciverVO = edao.getOne(reciverNo);
     		EmployeeVO writerVO = edao.getOne(writerNo);
     		
     		String reciverName = reciverVO.geteName();
     		String writerName = writerVO.geteName();
     		
     		
		 if(vo2 != null){
    
    
%>
<div class="conteiner">

	
		<table class = "table table-striped">
		
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" id="" style="width: 350px" value="<%= vo2.getMTitle() %>" /></td>
			</tr>
		
			<tr>
				<th>보낸 사람</th> 
				<td><input type="text" id="" value="<%= writerName %>" disabled="disabled" />
					
				</td>
			</tr>
			
			<tr>
				<th>받는 사람</th>  
				<td><input type="text" id="reciverName" name="reciverName" value="<%= reciverName %>" disabled="disabled"/>  
				
				</td>
			</tr>
		
			<tr>
				<th>내용</th>
				<td><textarea  class="summernote" name="contents" id="con" /><%= vo2.getMContent() %></textarea></td>
			</tr>
		
			<tr>
				<td colspan="2">
					<input class="btn btn-primary" type="submit" value="보내기" />
					<input class="btn btn-primary" type="submit" value="임시저장" formaction="/HTA_Project_semi/mail/mailWriteTempSaveOk.jsp" />
				</td>
			</tr>
		
		
		</table>

	
</div>
<%
		 }
  
%>

</body>

<script type="text/javascript">


          $('.summernote').summernote({
            height: 450,
            width: 1300,
            codemirror: {
              theme: 'monokai'
            },
          toolbar: [
  	        // [groupName, [list of button]]
  	        ['fontname', ['fontname']],
  	        ['fontsize', ['fontsize']],
  	        ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
  	        ['color', ['forecolor', 'color']],
  	        ['table', ['table']],
  	        ['para', ['ul', 'ol', 'paragraph']],
  	        ['height', ['height']],
  	        ['insert', ['picture', 'link', 'video']],
  	        ['view', ['fullscreen', 'help']]
  	      ],
  	      fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
  	      fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72']
            
            
          });
       
         
          
          
    </script>


</html>
