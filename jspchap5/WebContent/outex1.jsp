<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--  5/WebContent/outex1.jsp  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>out ���� ��ü ����</title>
</head>
<body>
<h3>out ��ü�� response��ü�� ��¹��ۿ� �����͸� ������ �� �ִ� ��½�Ʈ�� ��ü��</h3>
<%
	int sum = 0;
	for(int i = 1;i<=10;i++){
		sum+=i;
%>  
1����<%=i %> ������ �κ��� : <%=sum %><br>
<% }%>
1���� 10������ �� : <%=sum %>
<hr>
<%
	sum = 0;
	for(int i = 1;i<=10;i++){
		sum+=i;
		out.println("1����"+i+"������ �κ���:"+sum+"<br>");
	}
	out.println("1���� 10������ ��:"+sum+"<br>");
%> 
</body>
</html>