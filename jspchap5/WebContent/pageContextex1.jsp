<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--  5/WebContent/pageContextex1.jsp  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>pageContext ����</title>
</head>
<body>
<h2>pageContext ��ü : ���� �������� �ڿ��� �����ϴ� ��ü<br>
					  page ������ ����ϰ� �ִ� ��ü��.</h2>
<h3>������� ��ü�� �Ӽ����� �޼��带 ����� ������.<br>
	pageContext.setAttribute("�Ӽ���","�Ӽ���")<br>
	Object pageContext.getAttribute("�Ӽ���")<br>
	pageContext.removeAttribute("�Ӽ���")<br>
</h3>
<% if(request == pageContext.getRequest()) { %>
request ��ü�� pageContext.getRequest()�� ������ ��ü�� ���� ��ü��<br>
<% } %>
<% if(response == pageContext.getResponse()) { %>
response ��ü�� pageContext.getResponse()�� ������ ��ü�� ���� ��ü��<br>
<% } %>
<% if(session == pageContext.getSession()) { %>
session ��ü�� pageContext.getSession()�� ������ ��ü�� ���� ��ü��<br>
<% } %>
</body>
</html>