<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/jstl/exam2.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>입력된 수까지의 합 구하기</title>
</head>
<body>
<form method="post">
	숫자 : <input type="text" name="num" value="${param.num}">
		<input type="submit" value="숫자까지의 합 구하기">
</form>
<c:forEach var="i" begin="1" end="${param.num}">
		<c:set var="sum" value="${sum+i}" />
</c:forEach>
합계 : <c:out value="${sum}"/><br>
<h3>if 태그를 이용하여 짝수 홀수 출력하기</h3>
<c:if test="${sum%2==0}">
${sum}은 짝수입니다.<br>
</c:if>
<c:if test="${sum%2!=0}">
${sum}은 홀수입니다.<br>
</c:if>


<h3>choose when 태그를 짝수 홀수 이용하여 출력하기</h3>
<c:choose>
	<c:when test="${sum%2==0}">
	${sum}은 짝수입니다.<br>
	</c:when>
	<c:otherwise>
	${sum}은 홀수입니다.<br>
	</c:otherwise>
</c:choose>
</body>
</html>