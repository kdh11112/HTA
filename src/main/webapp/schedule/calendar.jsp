<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="calendar.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script>
$(document).ready(function() {
  var calendarEl = document.getElementById('calendar');
  var calendar = new FullCalendar.Calendar(calendarEl, {
    //... 이전 코드 ...

    dateClick: function(info) {
      var date = info.dateStr;
      if (date) {
        // 클릭한 일자 요소를 선택하고 값을 설정
        var dayElement = info.dayEl;
        dayElement.innerHTML = date; 
        openWindow(date); // 수정된 부분: date 값을 인자로 전달
      }
    }
  });

  calendar.render();
});

function openWindow(date) {
    // 작은 윈도우 창 열기
    var windowFeatures = "width=320,height=550,scrollbars=yes";
    var windowObject = window.open("flatpickr.html?date=" + date, "작은 윈도우 창", windowFeatures);
    windowObject.focus();
}

</script>

<select name="일정선택" id="select">
	<option value="" id="personal_schedule">개인일정</option>
	<option value="" id="department_schedule">부서일정</option>
	<option value="" id="company_schedule">회사일정</option>
</select>
<main>
	<div id='calendar'></div>
</main>
