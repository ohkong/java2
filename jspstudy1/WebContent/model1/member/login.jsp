<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/login.jsp 
	1. �Ķ���Ͱ� ����.
	2. db�� ������ �о(MemberDao.selectOne(id)),
		���̵�� ��й�ȣ�� ��.
	3. ���̵� ���°�� 
		���̵� �����ϴ�. �޼��� ����� loginForm.jsp ������ �̵�.
	   ��й�ȣ�� Ʋ�����
	   	��й�ȣ�� Ʋ���ϴ�. �޼��� ����� loginForm.jsp ������ �̵�.
	   ���̵�, ��й�ȣ ��ġ.
	   		- session ��ü�� �α��� ���� ����
	   		- �̸����� �α��� �߽��ϴ�. �޼��� �����, main.jsp ������ �̵�
--%>
<%
	String msg="���̵� Ȯ���ϼ���";
	String url="loginForm.jsp";
	//1.�Ķ���� ����
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	//2.db ���� �б�.
	Member mem = new MemberDao().selectOne(id);
	//3. ���̵�, ��й�ȣ ����
	if(mem !=null) {
		if(pass.equals(mem.getPass())){ //��й�ȣ�� �������. �α��μ���
			session.setAttribute("login", id); 	//�α������� ����
			msg = mem.getName() + "���� �α��� �߽��ϴ�.";
			url = "main.jsp";
		}else {
			msg = "��й�ȣ�� Ʋ���ϴ�.";
		}
	}
%>
<script>
	alert("<%=msg%>")
	location.href="<%=url%>";
</script>