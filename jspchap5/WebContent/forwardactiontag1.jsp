<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%--  5/WebContent/forwardactiontag1.jsp  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>forward action �±� ����</title>
</head>
<body>
<h3>�� �������� forwardactiontag2.jsp �� forward �˴ϴ�.
�� ������ ������ ��µ��� �ʽ��ϴ�.</h3>
<jsp:forward page="forwardactiontag2.jsp">
	<jsp:param value="****" name="test" />
	<jsp:param value="forward test" name="add" />
</jsp:forward>
</body>
</html>