<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/deleteForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� ���� ȭ��</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<form action="delete.jsp" method="post">
	<input type="hidden" name="num" value="<%=request.getParameter("num")%>">
		<table><caption>ȸ����й�ȣ �Է�</caption>
		<tr><td>�Խñۺ�й�ȣ</td><td><input type="password" name="pass"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="�Խñۻ���"/></td></tr>
	</table>
</form>
</html>