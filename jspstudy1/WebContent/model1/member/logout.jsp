<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/logout.jsp 
//	1. session �α��� ���� ����.
//	2. loginForm.jsp ������ �̵�
	
	1. session �α��� ���� ����.
	2. "�α׾ƿ��ϼ̽��ϴ�" �޼��� ��� ��
	 				loginForm.jsp ������ �̵�
	
--%>
<%
	//session.invalidate(); //������ session ����, ���ο� session���� ����
	session.removeAttribute("login");
	//response.sendRedirect("loginForm.jsp");
%>  

<script>
	alert("�α׾ƿ��ϼ̽��ϴ�.")
	location.href="loginForm.jsp"
</script>
