<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--jstl/jstlfmtEx3.jsp --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>test2</title>
</head>
<body>
<%//request.setCharacterEncoding("euc-kr");%>
<fmt:requestEncoding value="euc-kr"/>
<form method="post" name="f">
이름:<input type="text" name="name" value="${param.name }"><br>
나이:<input type="text" name="age" value="${param.age }"><br>
성별:<input type="checkbox" name="gender" value="남"
<c:if test="${fn:contains(genders,'남') }">checked</c:if>>남
<input type="checkbox" name="gender" value="여"
<c:if test="${fn:contains(genders,'여') }">checked</c:if>>여<br>
출생년도: <select name="year"><option>2000</option><option>2001</option><option>2002</option><option>2003</option>
<option>2004</option><option>2005</option><option>2006</option><option>2007</option>
</select>

<input type="submit" value="전송">
</form><hr>
이름:${param.name }<br>
나이:${param.age}<br>
성별:${param.gender == 1?"남":"여" }<br>
출생년도:${param.year }<br>
나이:만${2020-param.year}<br>
</body>
</html>