<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--  5/WebContent/forwardex2.jsp  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>forward 된 페이지</title>
</head>
<body>
<h2>forwardex2.jsp 페이지 입니다.</h2>
<%=request.getParameter("id") %><br>
forwardex1.jsp 페이지를 요청하면 이페이지가 출력됩니다.
하지만 url은 forwardex1.jsp 로 남아 있습니다.
</body>
</html>