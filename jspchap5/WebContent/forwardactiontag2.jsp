<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%--  5/WebContent/forwardactiontag2.jsp  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>forward action tag 예제</title>
</head>
<body>
forwardactiontag1.jsp?test=1234&id=hong
<h3>forwardactiontag1.jsp에서 forward된 forwardactiontag2.jsp 페이지입니다.</h3>
 test : <%=request.getParameter("test") %><br>
 add : <%=request.getParameter("add") %><br>
 id : <%=request.getParameter("id") %><br>
</body>
</html>