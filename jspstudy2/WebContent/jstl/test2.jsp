<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/jstl/test2.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jstl�� �̿��� ������ �����Է�</title>
</head>
<body>
<fmt:requestEncoding value="euc-kr"/>
<c:if test="${param.name==null}">
<form method="post" name="f">
�̸� : <input type="text" name="name"><br>
���� : <input type="text" name="age"><br>
���� : <input type="radio" name="gender" value="1">��
	  <input type="radio" name="gender" value="2">��<br>
������� : <select name="year">
	<c:forEach  var="i" begin="1980" end="2000">
	<option>${i}</option>
	</c:forEach>
</select><br>
<input type="submit" value="����">
</form>
</c:if>
<c:if test="${param.name!=null}">
�̸� : ${param.name}<br>
���� : ${param.age}<br>
���� : ${param.gender==1?"��":"��"}<br>
������� : ${param.year}<br>
���� : ��${2020-param.year}<br>
</c:if>
</body>
</html>