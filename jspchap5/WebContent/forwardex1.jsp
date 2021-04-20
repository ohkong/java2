<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--  5/WebContent/forwardex1.jsp  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>forward 하는 페이지</title>
</head>
<body>
<h2>forward 하는 페이지 입니다. 이내용은 화면에 출력되지 않습니다.</h2>
<% pageContext.forward("forwardex2.jsp"); %>
</body>
</html>