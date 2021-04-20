<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%--  5/WebContent/applicationex2.jsp  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%=application.getAttribute("test") %><br>
<%=session.getAttribute("test") %>
</body>
</html>