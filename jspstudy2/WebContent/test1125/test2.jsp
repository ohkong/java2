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
�̸�:<input type="text" name="name" value="${param.name }"><br>
����:<input type="text" name="age" value="${param.age }"><br>
����:<input type="checkbox" name="gender" value="��"
<c:if test="${fn:contains(genders,'��') }">checked</c:if>>��
<input type="checkbox" name="gender" value="��"
<c:if test="${fn:contains(genders,'��') }">checked</c:if>>��<br>
����⵵: <select name="year"><option>2000</option><option>2001</option><option>2002</option><option>2003</option>
<option>2004</option><option>2005</option><option>2006</option><option>2007</option>
</select>

<input type="submit" value="����">
</form><hr>
�̸�:${param.name }<br>
����:${param.age}<br>
����:${param.gender == 1?"��":"��" }<br>
����⵵:${param.year }<br>
����:��${2020-param.year}<br>
</body>
</html>