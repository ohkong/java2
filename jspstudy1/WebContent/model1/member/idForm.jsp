<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/model/idForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디찾기</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<h3>아이디 찾기</h3>
<form action="id.jsp" method="post">
	<table>
		<tr><th>이메일</th><td><input type="text" name="email"></td></tr>
		<tr><th>전화번호</th><td><input type="text" name="tel"></td></tr>
		<tr><td colspan="2"><input type="submit" value="아이디찾기"></td></tr>
	</table>
</form>
</body>
</html>