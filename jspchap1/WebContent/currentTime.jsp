<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%-- 1/WebContent/currentTime.jsp  
 	1. http://localhost:8080/jspchap1/currentTime.jsp ��û.
 	2. WAS ����
 	currentTime.jsp => �������� ���� => ������
 					   ����. => �������.
 	
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �ð�</title>
</head>
<body>
<%
   Calendar c = Calendar.getInstance();
   int h = c.get(Calendar.HOUR_OF_DAY); //����ð�
   int m = c.get(Calendar.MINUTE);	//���� ��
   int s = c.get(Calendar.SECOND);	//���� ��
%>
<h1>���� �ð���<%=h %>�� <%=m %>�� <%=s %>�� �Դϴ�.</h1>
</body>
</html>