<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/main.jsp 
	1. �α��� ���� ����
		�α��� ���� : ���� ȭ��
			�α����� admin �� ��� ȸ����� ���� �߰� �ϱ�
		�α׾ƿ� ���� :  �α����ϼ���. �޼��� ����� loginForm.jsp �� ������ �̵�
--%>
<%
	String login = (String)session.getAttribute("login");
	if(login!=null){ %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ����</title>
</head>
<body>
<h3><%=login %>�� �α��� �Ǿ����ϴ�.</h3>
<h3><a href="logout.jsp">�α׾ƿ�</a></h3>
<h3><a href="info.jsp?id=<%=login %>">ȸ����������</a></h3>
<%if(login.equals("admin")) {%>
	<h3><a href="list.jsp">ȸ����� ����</a></h3>
<% } %>
</body>
</html>
<% } else { %> <%-- �α׾ƿ����� --%>
<script>
	alert("�α����ϼ���")
	location.href="loginForm.jsp"
</script>
<% } %>