<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/jstl/jstlfmtEx2.jsp --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>형식 관련 태그 예제2</title>
</head>
<body>
<h3>Format 된 숫자를 일반 숫자로 변경</h3>
<fmt:parseNumber value="20,000" var="num1" pattern="##,###"/>
<fmt:parseNumber value="10,000" var="num2" pattern="##,###"/>
합 :${num1} + ${num2} =  ${num1 + num2}<br>

문제 : 20,000 + 10,000 = 30,000 출력하기<br>
<fmt:formatNumber value="${num1}" pattern="##,###"/> +
<fmt:formatNumber value="${num2}" pattern="##,###"/> =
<fmt:formatNumber value="${num1+num2}" pattern="##,###"/><br>

<fmt:formatNumber value="${num1}" var="snum1" pattern="##,###"/> 
<fmt:formatNumber value="${num2}" var="snum2" pattern="##,###"/> 
<fmt:formatNumber value="${num1+num2}" var="snum3" pattern="##,###"/> <br>
${snum1} + ${snum2} = ${snum3}<br>

<h3>Format 된 날짜를 날짜형으로 변경</h3>
<fmt:parseDate value="2020-12-25 12:00:00" pattern="yyyy-MM-dd HH:mm:ss" var="day"/>
${day}<br>
문제 : 2020-12-25 일의 요일 출력하기<br>
<fmt:formatDate value="${day}" pattern="yyyy-MM-dd E요일"/>
${day}<br>
</body>
</html>