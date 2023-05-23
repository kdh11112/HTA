<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/calendar.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script>
var calendar;
$(document).ready(function() {
     var calendarEl = document.getElementById('calendar');
     calendar = new FullCalendar.Calendar(calendarEl, {
       //... 이전 코드 ...
		headerToolbar: {
			left: 'prev,next today',
			center: 'title',
			right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
       },
       slotMinTime: '09:00:00', // 주간 뷰의 시작 시간 설정
       slotMaxTime: '18:00:00', // 주간 뷰의 종료 시간 설정
       dateClick: function(info) {
         var date = info.dateStr;
         if (date) {
           openWindow(date);
         }
       },
       events: []
     });

     // 일정 데이터를 가져와서 이벤트 설정
     $.ajax({
       url: "load_schedule.jsp",
       success: function(response) {
         var data = JSON.parse(response);
         calendar.setOption('events', data); // 달력의 events 옵션 업데이트
         calendar.render(); // 달력 다시 렌더링
       }
     });

     function openWindow(date) {
       // 작은 윈도우 창 열기
       var windowFeatures = "width=320,height=550,scrollbars=yes";
       var windowObject = window.open("flatpickr.html?date=" + date, "작은 윈도우 창", windowFeatures);
       windowObject.focus();
     }

    calendar.on('eventClick', function (info) { // 이벤트 클릭 핸들러 추가
       var eventId = event.id; // 클릭한 이벤트의 ID 가져오기
       if (confirm("일정을 삭제하시겠습니까?")) {
          // 일정 삭제를 위한 AJAX 요청 보내기
          $.ajax({
             url: "delete_schedule.jsp",
             data: {
            	 title : info.event._def.title
             },
             success: function (response) {
                // 삭제 성공 시 처리할 내용 작성
                window.location.reload();
             },
             error: function () {
                // 삭제 실패 시 처리할 내용 작성
                console.log("일정 삭제 중 오류가 발생했습니다.");
             }
          });
       }
    });
});

$(document).ready(function() {
    $("#select").change(function() {
        var selectedValue = $(this).val(); // 선택된 일정 유형의 값을 가져옴
        // 가져온 값으로 원하는 동작 수행
		if(selectedValue == "전체"){
	        $.ajax({
	            url: "load_schedule.jsp",
	            success: function(response) {
	                var data = JSON.parse(response);
	                calendar.setOption('events', data); // 달력의 events 옵션 업데이트
	                calendar.render(); // 달력 다시 렌더링
	            }
	        });
		}else if(selectedValue == "개인"){
			$.ajax({
	            url: "personal_load_schedule.jsp",
	            data : {
	            	schedule_Type: selectedValue
	            },
	            success: function(response) {
	                var data = JSON.parse(response);
	                calendar.setOption('events', data); // 달력의 events 옵션 업데이트
	                calendar.render(); // 달력 다시 렌더링
	            }
	        });
		}else if(selectedValue == "부서"){
			$.ajax({
	            url: "department_load_schedule.jsp",
	            data : {
	            	schedule_Type: selectedValue
	            },
	            success: function(response) {
	                var data = JSON.parse(response);
	                calendar.setOption('events', data); // 달력의 events 옵션 업데이트
	                calendar.render(); // 달력 다시 렌더링
	            }
	        });
		}
    });
});

</script>

<select name="schedule_Type" id="select">
   <option value="전체" id="">전체일정</option>
   <option value="개인" id="personal_schedule">개인일정</option>
   <option value="부서" id="department_schedule">부서일정</option>
   <option value="회사" id="company_schedule">회사일정</option>
</select>
<main>
   <div id='calendar'></div>
</main>