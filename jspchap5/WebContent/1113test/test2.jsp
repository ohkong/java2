<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��¥�� session�� ����ϱ�</title>
</head>
<body>
<%
	Date today = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss E");
	String date = sdf.format(today);
	session.setAttribute("date", date);
%>
��ϵ� ��¥ : <%=date %><br>
<a href="test3.jsp">test3.jsp</a>
</body>
</html>