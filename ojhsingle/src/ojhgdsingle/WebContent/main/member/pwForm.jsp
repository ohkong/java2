<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>찾기</title>
</head>
<body>
<h3>비밀번호찾기</h3>
<form action="pw.me" method="post">
	<table class="w3-table-all">
		<tr><th>아이디</th><td><input type="text" name="id"></td></tr>
		<tr><th>이름</th><td><input type="text" name="name"></td></tr>
		<tr><th>전화번호</th><td><input type="text" name="tel"></td></tr>
		<tr><td colspan="2"><input type="submit" value="비밀번호찾기"></td></tr>
	</table>
</form>
</body>
</html>