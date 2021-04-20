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
<title>fmt 태그 : 인코딩</title>
</head>
<body>
<% //request.setCharacterEncoding("euc-kr"); %>
<fmt:requestEncoding value="euc-kr"/>
<form method="post" name="f">
이름 : <input type="text" name="name" value="${param.name}"><br>
입사일 : <input type="text" name="hiredate" value="${param.hiredate}">yyyy-MM-dd 형태로 입력<br>
급여 : <input type="text" name="salary" value="${param.salary}"><br>
<%--
	paramValues.job : job 파라미터들을 배열 리턴
	${fn:join(배열,',')} : 배열의 요소들을 ,로 연결하여 문자열 리턴
	${fn:contains(문자열,'서무')} : 문자열내부에 서무 문자열 존재?
 --%>
<c:set var="jobs" value="${fn:join(paramValues.job,',')}"/>
답당업무 : <input type="checkbox" name="job" value="서무"
			<c:if test="${fn:contains(jobs,'서무')}">checked</c:if>>서무
		 <input type="checkbox" name="job" value="개발"
		 	<c:if test="${fn:contains(jobs,'개발')}">checked</c:if>>개발
		 <input type="checkbox" name="job" value="비서"
		 	<c:if test="${fn:contains(jobs,'비서')}">checked</c:if>>비서
		 <input type="checkbox" name="job" value="운용"
		 	<c:if test="${fn:contains(jobs,'운용')}">checked</c:if>>운용<br>
<input type="submit" value="전송">
</form>
<hr>
이름 : ${param.name}<br>
입사일 : ${param.hiredate}<br>
급여 : ${param.salary}<br>
담당업무 : ${param.job}<br>
담당업무 : <c:forEach var="j" items="${paramValues.job}">
	${j}&nbsp;&nbsp;&nbsp;
	</c:forEach>

<h3>입사일을 yyyy년 MM월 dd일 E요일 형태로 출력을, 급여,연봉은 세자리마다 , 출력,  연봉 : 급여 * 12</h3>


이름 : ${param.name}<br>
<c:catch var="formatexception">
<fmt:parseDate value="${param.hiredate}" pattern="yyyy-MM-dd" var="hiredate"/>
</c:catch>
입사일 : <c:if test="${formatexception==null}"> 
<fmt:formatDate value="${hiredate}" pattern="yyyy년 MM월 dd일 E요일"/><br>
</c:if>
<c:if test="${formatexception!=null}">
입사일은 yyyy-MM-dd 형태로 입력하세요<br>
</c:if>

급여 : <fmt:formatNumber value="${param.salary}" pattern="###,###"/><br>
연봉 : <fmt:formatNumber value="${param.salary *12 }" pattern="###,###"/><br>
담당업무 : <c:forEach var="j" items="${paramValues.job}">
	${j}&nbsp;&nbsp;&nbsp;
	</c:forEach>
</body>
</html>