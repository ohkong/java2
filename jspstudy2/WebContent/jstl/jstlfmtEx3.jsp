<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/jstl/jstlfmtEx3.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>fmt �±� : ���ڵ�</title>
</head>
<body>
<% //request.setCharacterEncoding("euc-kr"); %>
<fmt:requestEncoding value="euc-kr"/>
<form method="post" name="f">
�̸� : <input type="text" name="name" value="${param.name}"><br>
�Ի��� : <input type="text" name="hiredate" value="${param.hiredate}">yyyy-MM-dd ���·� �Է�<br>
�޿� : <input type="text" name="salary" value="${param.salary}"><br>
<%--
	paramValues.job : job �Ķ���͵��� �迭 ����
	${fn:join(�迭,',')} : �迭�� ��ҵ��� ,�� �����Ͽ� ���ڿ� ����
	${fn:contains(���ڿ�,'����')} : ���ڿ����ο� ���� ���ڿ� ����?
 --%>
<c:set var="jobs" value="${fn:join(paramValues.job,',')}"/>
������ : <input type="checkbox" name="job" value="����"
			<c:if test="${fn:contains(jobs,'����')}">checked</c:if>>����
		 <input type="checkbox" name="job" value="����"
		 	<c:if test="${fn:contains(jobs,'����')}">checked</c:if>>����
		 <input type="checkbox" name="job" value="��"
		 	<c:if test="${fn:contains(jobs,'��')}">checked</c:if>>��
		 <input type="checkbox" name="job" value="���"
		 	<c:if test="${fn:contains(jobs,'���')}">checked</c:if>>���<br>
<input type="submit" value="����">
</form>
<hr>
�̸� : ${param.name}<br>
�Ի��� : ${param.hiredate}<br>
�޿� : ${param.salary}<br>
������ : ${param.job}<br>
������ : <c:forEach var="j" items="${paramValues.job}">
	${j}&nbsp;&nbsp;&nbsp;
	</c:forEach>

<h3>�Ի����� yyyy�� MM�� dd�� E���� ���·� �����, �޿�,������ ���ڸ����� , ���,  ���� : �޿� * 12</h3>


�̸� : ${param.name}<br>
<c:catch var="formatexception">
<fmt:parseDate value="${param.hiredate}" pattern="yyyy-MM-dd" var="hiredate"/>
</c:catch>
�Ի��� : <c:if test="${formatexception==null}"> 
<fmt:formatDate value="${hiredate}" pattern="yyyy�� MM�� dd�� E����"/><br>
</c:if>
<c:if test="${formatexception!=null}">
�Ի����� yyyy-MM-dd ���·� �Է��ϼ���<br>
</c:if>

�޿� : <fmt:formatNumber value="${param.salary}" pattern="###,###"/><br>
���� : <fmt:formatNumber value="${param.salary *12 }" pattern="###,###"/><br>
������ : <c:forEach var="j" items="${paramValues.job}">
	${j}&nbsp;&nbsp;&nbsp;
	</c:forEach>
</body>
</html>