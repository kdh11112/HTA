<%@page import="java.util.ArrayList"%>
<%@page import="dao.AttendenceDAO"%>
<%@page import="vo.AttendenceVO"%>
<%@page import="org.json.simple.JSONArray"%> <!-- 수정: JSONArray 추가 -->
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
[ { id: 'a', title: '출근', start: '2023-05-10' }, { id: 'b', title: '퇴근',
start: '2023-05-10' } ]
-->
<%
AttendenceDAO dao = new AttendenceDAO();
int enumber = 30;
ArrayList<AttendenceVO> list = dao.getDate(enumber);

JSONArray eventsJsonArray = new JSONArray(); // 수정: eventsJsonArray로 변수명 변경

for (AttendenceVO vo : list) {
    JSONObject eventJsonObject = new JSONObject();
    eventJsonObject.put("start", vo.getOfficeGoingHour());
    eventJsonObject.put("end", vo.getQuittingTime());

    eventsJsonArray.add(eventJsonObject); // 수정: eventsJsonArray에 JSONObject 추가
}
%>