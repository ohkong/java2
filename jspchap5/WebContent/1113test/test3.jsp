<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>session�� ��ϵ� ��¥�� ��ȸ�ϱ�</title>
</head>
<body>
<%
String date = (String)session.getAttribute("date");
session.removeAttribute("date");
if(date==null){%>
<script type="text/javascript">
	alert("��ϵ� ��¥�� �����ϴ�.");
	history.go(-1);
</script>
<% }%>
�ݰ����ϴ�. ��ϵ� ��¥ : <%=date %>
</body>
</html>