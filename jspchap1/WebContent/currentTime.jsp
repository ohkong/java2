<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%-- 1/WebContent/currentTime.jsp  
 	1. http://localhost:8080/jspchap1/currentTime.jsp 요청.
 	2. WAS 서버
 	currentTime.jsp => 서블릿으로 변경 => 컴파일
 					   실행. => 응답실행.
 	
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>현재 시간</title>
</head>
<body>
<%
   Calendar c = Calendar.getInstance();
   int h = c.get(Calendar.HOUR_OF_DAY); //현재시간
   int m = c.get(Calendar.MINUTE);	//현재 분
   int s = c.get(Calendar.SECOND);	//현재 초
%>
<h1>현재 시간은<%=h %>시 <%=m %>분 <%=s %>초 입니다.</h1>
</body>
</html>