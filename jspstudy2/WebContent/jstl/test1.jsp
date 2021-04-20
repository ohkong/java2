<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/jstl/test1.jsp --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jstl을 이용한 간단한 연산</title>
</head>
<body>
<form method="post">
x:<input type="text" name="num1" value="${param.num1}" size="5">
<select name="op">
	<option>+</option>
	<option>-</option>
	<option>*</option>
	<option>/</option>
</select>
<script type="text/javascript">
		var op = '${param.op}';
		if (op == '')
			op = "+";
		document.forms[0].op.value=op;
	</script>
y:<input type="text" name="num2" value="${param.num2}" size="5">
<input type="submit" value="="><br>
<fmt:parseNumber value="${param.num1}" var="num1"/>
<fmt:parseNumber value="${param.num2}" var="num2"/>
<c:choose>
	<c:when test="${param.op.equals('+')}">
		<c:set var="result" value="${num1+num2}"/>
		<h2>${num1} ${param.op} ${num2} = ${result}</h2>
	</c:when>
	<c:when test="${param.op.equals('-')}">
		<c:set var="result" value="${num1-num2}"/>
		<h2>${num1} ${param.op} ${num2} = ${result}</h2>
	</c:when>
	<c:when test="${param.op.equals('*')}">
		<c:set var="result" value="${num1*num2}"/>
		<h2>${num1} ${param.op} ${num2} = ${result}</h2>
	</c:when>
	<c:when test="${param.op.equals('/')}">
		<c:set var="result" value="${num1/num2}"/>
		<h2>${num1} ${param.op} ${num2} = ${result}</h2>
	</c:when>
</c:choose>
</form>
</body>
</html>