<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--  5/WebContent/sessionex1.jsp  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>session ��ü</title>
<%
	session.setMaxInactiveInterval(10); //session �����ð�. 10��
%>
</head>
<body>
<h3>session ���� : ���������� session�� �Ҵ��. Ŭ���̾�Ʈ�� ���� �����ϴ� ����� ����.</h3>
isNew() : <%=session.isNew() %><br> <%--session ��ü ��ü--%>
�����ð� : <%=session.getCreationTime() %><br> <%-- �и���. --%>
�������ӽð� : <%=session.getLastAccessedTime() %><br>
session id : <%=session.getId() %><br> <%-- session�� ���� id��. --%>
</body>
</html>