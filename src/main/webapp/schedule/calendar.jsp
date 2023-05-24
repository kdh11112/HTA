<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>일정 캘린더</title>
  <link rel="stylesheet" href="/HTA_Project_semi/css/calendar.css">
  <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<style>
	#span1{
		color: #3788d8;
		font-weight: bold;
	}
	#span2{
		color: #FF6060;
		font-weight: bold;
	}
	#span3{
		color: #66E6B6;
		font-weight: bold;
	}
	#info_color{
	position: absolute;
	margin-top: 110px;
	margin-left: 320px;
	font-weight: bold;
	font-size: 15px;
	}
</style>
<body>
  <select name="schedule_Type" id="select">
    <option value="전체" id="">전체일정</option>
    <option value="개인" id="personal_schedule">개인일정</option>
    <option value="부서" id="department_schedule">부서일정</option>
    <option value="회사" id="company_schedule">회사일정</option>
  </select>
  <main>
  <div id="info_color">
  	<span>개인일정<span id="span1">■</span></span>
  	<span>부서일정<span id="span2">■</span></span>
  	<span>회사일정<span id="span3">■</span></span>
    </div>
    <div id='calendar'></div>
  </main>

  <script>
    var calendar;

    $(document).ready(function() {
      var calendarEl = document.getElementById('calendar');
      calendar = new FullCalendar.Calendar(calendarEl, {
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
        events: [],
        eventTimeFormat: { // 이벤트 시작 시간 형식 설정
          hour: 'numeric',
          minute: '2-digit',
          meridiem: 'short'
        }
      });

      // 일정 데이터를 가져와서 이벤트 설정
      loadAllEvents();

      function loadAllEvents() {
    	  // 개인 일정 가져오기
    	  $.ajax({
    	    url: "/HTA_Project_semi/schedule/personal_load_schedule.jsp",
    	    data: {
    	      schedule_Type: "개인"
    	    },
    	    success: function(response) {
    	      var personalData = JSON.parse(response);

    	      // 부서 일정 가져오기
    	      $.ajax({
    	        url: "/HTA_Project_semi/schedule/department_load_schedule.jsp",
    	        data: {
    	          schedule_Type: "부서"
    	        },
    	        success: function(response) {
    	          var departmentData = JSON.parse(response);

    	          // 회사 일정 가져오기
    	          $.ajax({
    	            url: "/HTA_Project_semi/schedule/company_load_schedule.jsp",
    	            data: {
    	              schedule_Type: "회사"
    	            },
    	            success: function(response) {
    	              var companyData = JSON.parse(response);

    	              var allData = personalData.concat(departmentData).concat(companyData);
    	              calendar.setOption('events', allData); // 달력의 events 옵션 업데이트
    	              calendar.render(); // 달력 다시 렌더링
    	            }
    	          });
    	        }
    	      });
    	    }
    	  });
    	}

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
            url: "/HTA_Project_semi/schedule/delete_schedule.jsp",
            data: {
              title: info.event._def.title
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

      $("#select").change(function() {
        var selectedValue = $(this).val(); // 선택된 일정 유형의 값을 가져옴

        if (selectedValue == "전체") {
          loadAllEvents();
        } else if (selectedValue == "개인") {
          $.ajax({
            url: "/HTA_Project_semi/schedule/personal_load_schedule.jsp",
            data : {
              schedule_Type: selectedValue
            },
            success: function(response) {
              var data = JSON.parse(response);
              calendar.setOption('events', data); // 달력의 events 옵션 업데이트
              calendar.render(); // 달력 다시 렌더링
            }
          });
        } else if (selectedValue == "부서") {
          $.ajax({
            url: "/HTA_Project_semi/schedule/department_load_schedule.jsp",
            data : {
              schedule_Type: selectedValue
            },
            success: function(response) {
              var data = JSON.parse(response);
              calendar.setOption('events', data); // 달력의 events 옵션 업데이트
              calendar.render(); // 달력 다시 렌더링
            }
          });
        } else if (selectedValue == "회사") {
        	 $.ajax({
                 url: "/HTA_Project_semi/schedule/company_load_schedule.jsp",
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
</body>
</html>