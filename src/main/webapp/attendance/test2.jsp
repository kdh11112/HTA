<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset='utf-8' />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link href='../css/main.css' rel='stylesheet' />
<script src='../js/main.js'></script>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="../css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<link rel="shortcut icon" href="#">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>Insert title here</title>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="../attendance/main.css" />
<script>
	
			//출근시간 출력함수
			function startTime() {
				var now = new Date();//현재 날짜시간을 now에 저장
				console.log(now);
				console.dir(now);
				$("input[value='출근']").on("click", function() {
					console.log("출근");
				})


				var timeEle = document.getElementById("span");
				timeEle.value = startTime;
				$("#span").html(now.getHours() + ":" + now.getMinutes());

			
			}


</script>

</head>


<body>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark"><%@ include
			file="../menu/navi.jsp"%></nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav"><%@ include file="../menu/side.jsp"%></div>
		<div id="layoutSidenav_content">
			<main>
			<input type="button" value="출근" onclick="startTime();"/>
			
				<h2>근태관리</h2>
				<div class="container-fluid px-4">

					<div id="month_frame" class="frame" onselectstart="return false;"
						ondragstart="return false;" style="top: 101px; display: block;">
						<h3 class="blind">월간 일정 보기</h3>
						<div class="monthly_calendar">
							<table cellpadding="0" cellspacing="0" class="week">

								<tbody>

									<tr class="_grid_header">
										<th class="sun" title="일">일</th>
										<th title="월">월</th>
										<th title="화">화</th>
										<th title="수">수</th>
										<th title="목">목</th>
										<th title="금">금</th>
										<th title="토">토</th>
									</tr>
								</tbody>
							</table>

							<div class="month_table fifth">
								<div class="_schedule_container table_container">
									<div class="month_row" style="height: 20%">
										<table cellpadding="0" cellspacing="0" class="grid">
											<tbody>
												<tr>
													<td class="_month_cell month_schedule_drop" id="span" dayindex="0" >&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="1">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="2">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="3">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="4">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="5">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="6">&nbsp;</td>
												</tr>
											</tbody>
										</table>
										<table cellpadding="0" cellspacing="0" class="schedule_list">
											<tbody>
												<tr class="date">
													<td dayindex="0" class="sun disable"><strong
														class="_move_day_view" dayindex="0">30</strong></td>
													<td dayindex="1" class=""><strong
														class="_move_day_view" dayindex="1">1</strong></td>
													<td dayindex="2" class=""><strong
														class="_move_day_view" dayindex="2">2</strong></td>
													<td dayindex="3" class=""><strong
														class="_move_day_view" dayindex="3">3</strong></td>
													<td dayindex="4" class=""><strong
														class="_move_day_view" dayindex="4">4</strong> <span
														class="day_info"><span>(음)</span> 03.15</span></td>
													<td dayindex="5" class="holiday"><strong
														class="_move_day_view" dayindex="5">5</strong> <span
														class="day_info">어린이날</span></td>
													<td dayindex="6" class=""><strong
														class="_move_day_view" dayindex="6">6</strong> <span
														class="day_info">입하</span></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="month_row" style="height: 20%">
										<table cellpadding="0" cellspacing="0" class="grid">
											<tbody>
												<tr>
													<td class="_month_cell month_schedule_drop" dayindex="7">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="8">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="9">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="10">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="11">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="12">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="13">&nbsp;</td>
												</tr>
											</tbody>
										</table>
										<table cellpadding="0" cellspacing="0" class="schedule_list">
											<tbody>
												<tr class="date">
													<td dayindex="7" class="sun"><strong
														class="_move_day_view" dayindex="7">7</strong></td>
													<td dayindex="8" class=""><strong
														class="_move_day_view" dayindex="8">8</strong></td>
													<td dayindex="9" class=""><strong
														class="_move_day_view" dayindex="9">9</strong></td>
													<td dayindex="10" class=""><strong
														class="_move_day_view" dayindex="10">10</strong> <span
														class="day_info"><span>(음)</span> 03.21</span></td>
													<td dayindex="11" class=""><strong
														class="_move_day_view" dayindex="11">11</strong></td>
													<td dayindex="12" class=""><strong
														class="_move_day_view" dayindex="12">12</strong></td>
													<td dayindex="13" class=""><strong
														class="_move_day_view" dayindex="13">13</strong></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="month_row" style="height: 20%">
										<table cellpadding="0" cellspacing="0" class="grid">
											<tbody>
												<tr>
													<td class="_month_cell month_schedule_drop" dayindex="14">&nbsp;</td>
													<td class="_month_cell month_schedule_drop today_area"
														dayindex="15"><div class="outline"
															style="height: 138px">&nbsp;</div></td>
													<td class="_month_cell month_schedule_drop" dayindex="16">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="17">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="18">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="19">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="20">&nbsp;</td>
												</tr>
											</tbody>
										</table>
										<table cellpadding="0" cellspacing="0" class="schedule_list">
											<tbody>
												<tr class="date">
													<td dayindex="14" class="sun"><strong
														class="_move_day_view" dayindex="14">14</strong></td>
													<td dayindex="15" class=""><strong
														class="_move_day_view" dayindex="15">15</strong></td>
													<td dayindex="16" class=""><strong
														class="_move_day_view" dayindex="16">16</strong></td>
													<td dayindex="17" class=""><strong
														class="_move_day_view" dayindex="17">17</strong></td>
													<td dayindex="18" class=""><strong
														class="_move_day_view" dayindex="18">18</strong></td>
													<td dayindex="19" class=""><strong
														class="_move_day_view" dayindex="19">19</strong></td>
													<td dayindex="20" class=""><strong
														class="_move_day_view" dayindex="20">20</strong> <span
														class="day_info"><span>(음)</span> 04.01</span></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="month_row" style="height: 20%">
										<table cellpadding="0" cellspacing="0" class="grid">
											<tbody>
												<tr>
													<td class="_month_cell month_schedule_drop" dayindex="21">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="22">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="23">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="24">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="25">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="26">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="27">&nbsp;</td>
												</tr>
											</tbody>
										</table>
										<table cellpadding="0" cellspacing="0" class="schedule_list">
											<tbody>
												<tr class="date">
													<td dayindex="21" class="sun"><strong
														class="_move_day_view" dayindex="21">21</strong> <span
														class="day_info">소만</span></td>
													<td dayindex="22" class=""><strong
														class="_move_day_view" dayindex="22">22</strong></td>
													<td dayindex="23" class=""><strong
														class="_move_day_view" dayindex="23">23</strong></td>
													<td dayindex="24" class=""><strong
														class="_move_day_view" dayindex="24">24</strong></td>
													<td dayindex="25" class=""><strong
														class="_move_day_view" dayindex="25">25</strong></td>
													<td dayindex="26" class=""><strong
														class="_move_day_view" dayindex="26">26</strong> <span
														class="day_info"><span>(음)</span> 04.07</span></td>
													<td dayindex="27" class="holiday"><strong
														class="_move_day_view" dayindex="27">27</strong> <span
														class="day_info">부처님 오신 날</span></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="month_row" style="height: 20%">
										<table cellpadding="0" cellspacing="0" class="grid">
											<tbody>
												<tr>
													<td class="_month_cell month_schedule_drop" dayindex="28">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="29">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="30">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="31">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="32">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="33">&nbsp;</td>
													<td class="_month_cell month_schedule_drop" dayindex="34">&nbsp;</td>
												</tr>
											</tbody>
										</table>
										<table cellpadding="0" cellspacing="0" class="schedule_list">
											<tbody>
												<tr class="date">
													<td dayindex="28" class="sun"><strong
														class="_move_day_view" dayindex="28">28</strong></td>
													<td dayindex="29" class="holiday"><strong
														class="_move_day_view" dayindex="29">29</strong> <span
														class="day_info">대체공휴일(부처님 오신 날)</span></td>
													<td dayindex="30" class=""><strong
														class="_move_day_view" dayindex="30">30</strong></td>
													<td dayindex="31" class=""><strong
														class="_move_day_view" dayindex="31">31</strong></td>
													<td dayindex="32" class="disable"><strong
														class="_move_day_view" dayindex="32">1</strong></td>
													<td dayindex="33" class="disable"><strong
														class="_move_day_view" dayindex="33">2</strong></td>
													<td dayindex="34" class="disable"><strong
														class="_move_day_view" dayindex="34">3</strong> <span
														class="day_info"><span>(음)</span> 04.15</span></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>

								<div class="_big_sticker_container"></div>

							</div>

						</div>
					</div>

				</div>

			</main>
			<footer class="py-4 bg-light mt-auto"><%@ include
					file="../menu/footer.jsp"%></footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../js/scripts.js"></script>
	<!-- 사이드바 열고 닫기 -->
</body>
</html>