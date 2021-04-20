<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--  5/WebContent/sessionex1.jsp  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>session 객체</title>
<%
	session.setMaxInactiveInterval(10); //session 유지시간. 10초
%>
</head>
<body>
<h3>session 정보 : 브라우저별로 session이 할당됨. 클라이언트의 정보 저장하는 기능을 가짐.</h3>
isNew() : <%=session.isNew() %><br> <%--session 객체 교체--%>
생성시간 : <%=session.getCreationTime() %><br> <%-- 밀리초. --%>
최종접속시간 : <%=session.getLastAccessedTime() %><br>
session id : <%=session.getId() %><br> <%-- session의 고유 id값. --%>
</body>
</html>