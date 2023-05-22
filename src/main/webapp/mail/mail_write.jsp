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

<script type="text/javascript">
$(document).ready(function() {

	$("#addrList").click(function(){
			var url = "/HTA_Project_semi/emp_search/info_lcm.jsp";
			var option = "width = 825px, height = 650px, top = 100, left = 200, location = no";
			var title = '자식창1';
			window.open(url,title,option,"window.opener");
		})

	
window.addEventListener("message", receiveMessageFromChild, false);
	
	
		
		function receiveMessageFromChild(event) {
			var dataArray = event.data.split(",");
			
			var reciverId = dataArray[0];
			var reciverName = dataArray[1];
			
			$("#reciverId").val(reciverId); <!-- 주소록에서 선택된 수신자 eNumber를 String으로 value값에 담았음.  -->
			$("#reciverName").val(reciverName); <!-- 주소록에서 선택된 수신자 이름을 String으로 value값에 담았음.  -->
		}
		

	
});

</script>



</head>

<body>
<%
		//세션에 잇는 vo(로그인되어있는 계정) 가져오기
	Object obj = session.getAttribute("vo");
	String name = null;
	int writer = 78 ; //기본값 (78은 현재 kdh)
	
	if(obj != null){
		EmployeeVO vo = (EmployeeVO)obj;
		name = vo.geteName();
		writer = vo.geteNumber();
		 
	}
	
	MailDAO dao = new MailDAO();
	EmployeeVO reciverVO = new EmployeeVO();
	
	
	
%>  


<div class="conteiner">

	<form action="mail_writeOk.jsp" method="post">
		<table class = "table table-striped">
			<tr>
				<th>보내는 사람</th>   <!-- 작성자 e_number -->
				<td><input type="text" id="" value="<%=name %>" disabled="disabled" />
					<input type="hidden" name="writer" value="<%=writer %>" />
				</td>
			</tr>
			
			<tr>
				<th>받는 사람</th>   <!-- 수신자 reciver  e_number2 -->
				<td><input type="text" id="reciverName" name="reciverName" value="" disabled="disabled"/> <!-- 주소록에서 선택된 수신자 이름을 value값에 담았음.  -->
				<input id="addrList" class="btn btn-primary" type="button" style="margin-left: 10px" value="주소록" />
				<input type="hidden" name="reciver" value="<%=name/* reciver */ %>" />
				<input type="hidden" id="reciverId" name="reciverId" value=""/> <!-- 주소록에서 선택된 수신자 eNumber를 String으로 value값에 담았음.  -->
				
				</td>
			</tr>
		
			<tr>
				<th>제목</th>  <!-- 제목 title mTitle -->
				<td><input type="text" name="title" id="" style="width: 350px" /></td>
			</tr>
		
			<tr>
				<th>내용</th> <!--  내용 content mContent -->
				<td><textarea class="summernote" name="contents" id="" cols="30" rows="10"></textarea></td>
			</tr>
		
			<tr>
				<td colspan="2">
					<input class="btn btn-primary" type="submit" value="보내기" />
					<input class="btn btn-primary" type="submit" value="예약" />
					<input class="btn btn-primary" type="submit" value="임시저장" />
				</td>
			</tr>
		
		</table>

		
	</form>
	
</div>


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


</body>
</html>