<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--  5/WebContent/responseex1.jsp  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>response ��ü ����</title>
</head>
<body>
<h2>���� �ۼ����� ������ ȭ�鿡 ��µ��� �ʽ��ϴ�.</h2>
<h3>response ��ü�� �������� ����� ������ �ִ� ��ü �Դϴ�.<br>
���ο� ��� ���۸� ������ �־, �������� ����� �����մϴ�.<br>
responser ��ü�� ���� �귯�������� �ٸ� �������� �ٽ� ��û�ϵ��� �� �� �����ϴ�.
=> �̷��� ����� redirect ��� �մϴ�.
</h3>
<%response.sendRedirect("responseex2.jsp"); %>
</body>
</html>