<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContetn/chap9/errorForm.jsp --%>
<%-- page errorPage="error.jsp" : ���� ���������� ���� �߻��� error.jsp�� �̵� --%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �߻� ������</title>
</head>
<body>
<% int num = Integer.parseInt("abc"); %>
<%=request.getParameter("name").trim()  %>
</body>
</html>
<%--
	error ������ ������ �켱 ����
	1. �ش� ���������� ���� ������ ������
		<%@ page errorPage="error.jsp" %>
	2. web.xml ���� ����Ŭ�������� ����
		<error-page><exception-type>....
	3.web.xml ���� HTTP ���� �ڵ�� ����
		<error-page><error-code>....
	4.��Ĺ(�������̳�, �����ø����̼Ǽ���)���� �⺻���� �����ϴ� ���� ������.
--%>