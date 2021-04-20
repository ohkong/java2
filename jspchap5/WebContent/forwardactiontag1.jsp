<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%--  5/WebContent/forwardactiontag1.jsp  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>forward action 태그 예제</title>
</head>
<body>
<h3>이 페이지는 forwardactiontag2.jsp 로 forward 됩니다.
이 파일의 내용은 출력되지 않습니다.</h3>
<jsp:forward page="forwardactiontag2.jsp">
	<jsp:param value="****" name="test" />
	<jsp:param value="forward test" name="add" />
</jsp:forward>
</body>
</html>