<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>1112test2</title>
</head>
<body>
<%
  request.setCharacterEncoding("EUC-KR");
  String name=request.getParameter("name");
  String title=request.getParameter("title");
  String content=request.getParameter("content");
  Date today = new Date();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<table border="1"><caption>����</caption>
<tr><td>�湮��</td><td><%=name %></td></tr>
<tr><td>����</td><td><%=title %></td></tr>
<tr><td>����</td><td><%=content %></td></tr>
<tr><td>�����</td><td><%=sdf.format(today) %></td></tr>
</table>
</body>
</html>