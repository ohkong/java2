<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/model/idForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디찾기</title>
</head>
<body>
<h3>아이디 찾기</h3>
<form action="id.me" method="post">
	<table class="w3-table-all">
		<tr><th>이메일</th><td><input type="text" name="email"></td></tr>
		<tr><th>전화번호</th><td><input type="text" name="tel"></td></tr>
		<tr><td colspan="2"><input type="submit" value="아이디찾기"></td></tr>
	</table>
</form>
</body>
</html>