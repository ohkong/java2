<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/jstl/exam2.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Էµ� �������� �� ���ϱ�</title>
</head>
<body>
<form method="post">
	���� : <input type="text" name="num" value="${param.num}">
		<input type="submit" value="���ڱ����� �� ���ϱ�">
</form>
<c:forEach var="i" begin="1" end="${param.num}">
		<c:set var="sum" value="${sum+i}" />
</c:forEach>
�հ� : <c:out value="${sum}"/><br>
<h3>if �±׸� �̿��Ͽ� ¦�� Ȧ�� ����ϱ�</h3>
<c:if test="${sum%2==0}">
${sum}�� ¦���Դϴ�.<br>
</c:if>
<c:if test="${sum%2!=0}">
${sum}�� Ȧ���Դϴ�.<br>
</c:if>


<h3>choose when �±׸� ¦�� Ȧ�� �̿��Ͽ� ����ϱ�</h3>
<c:choose>
	<c:when test="${sum%2==0}">
	${sum}�� ¦���Դϴ�.<br>
	</c:when>
	<c:otherwise>
	${sum}�� Ȧ���Դϴ�.<br>
	</c:otherwise>
</c:choose>
</body>
</html>