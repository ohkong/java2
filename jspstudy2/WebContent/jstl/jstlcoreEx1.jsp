<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/jstl/jstlcoreEx1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL core 怕弊</title>
</head>
<body>
<h3>加己 包访 怕弊 : set, remove, out 怕弊</h3>
<% //session.setAttribute("test","Hello JSTL"); %>
<c:set var="test" value="${'Hello JSTL' }" scope="session" />
test 加己 : ${sessionScope.test}<br>
test 加己 : <c:out value="${test}" /><br>
test 加己 : ${test}<br>
<% //sessio.removeAttribute("test"); %>
<c:remove var="test" />
test 加己 : ${test}<br>
</body>
</html>