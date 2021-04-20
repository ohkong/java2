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
<title>jstl을 이용한 간단한 정보입력</title>
</head>
<body>
<fmt:requestEncoding value="euc-kr"/>
<c:if test="${param.name==null}">
<form method="post" name="f">
이름 : <input type="text" name="name"><br>
나이 : <input type="text" name="age"><br>
성별 : <input type="radio" name="gender" value="1">남
	  <input type="radio" name="gender" value="2">여<br>
출생연도 : <select name="year">
	<c:forEach  var="i" begin="1980" end="2000">
	<option>${i}</option>
	</c:forEach>
</select><br>
<input type="submit" value="전송">
</form>
</c:if>
<c:if test="${param.name!=null}">
이름 : ${param.name}<br>
나이 : ${param.age}<br>
성별 : ${param.gender==1?"남":"여"}<br>
출생연도 : ${param.year}<br>
나이 : 만${2020-param.year}<br>
</c:if>
</body>
</html>