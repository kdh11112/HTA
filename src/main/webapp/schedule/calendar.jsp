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
<style>
   .fc-daygrid-day-frame:hover{
      background: skyblue;
   }
</style>
<script>
$(document).ready(function() {
     var calendarEl = document.getElementById('calendar');
     var calendar = new FullCalendar.Calendar(calendarEl, {
       //... 이전 코드 ...

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
   });

</script>

<select name="일정선택" id="select">
   <option value="" id="personal_schedule">개인일정</option>
   <option value="" id="department_schedule">부서일정</option>
   <option value="" id="company_schedule">회사일정</option>
</select>
<main>
   <div id='calendar'></div>
</main>