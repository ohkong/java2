<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContetn/chap7/bookForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �ۼ�</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<form action="book.jsp" method="post">
	<table>
		<tr><td>�ۼ���</td>
			<td><input type="text" name="writer"></td></tr>
		<tr><td>����</td>
			<td><input type="text" name="title"></td></tr>
		<tr><td>����</td>
			<td><textarea rows="5" cols="60" name="content"></textarea></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="���� ���"></td></tr>
	</table>
</form>
</body>
</html>