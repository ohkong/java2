<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/join.jsp 
	1. �Ķ���� ������ Member ��ü�� ���� => useBean �׼��±�
		Ŭ���� model.Member
	2. Member ��ü ������ db�� �߰�. member ���̺�
	3. ���Լ��� : loginForm.jsp ������ �̵�
	   ���Խ��� : joinForm.jsp ������ �̵�
--%>

<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="mem" class="model.Member"/>
<%-- �Ķ���Ϳ� Member ��ü�� ������Ƽ�� ���� ��� setProperty�� �̿��Ͽ�
	Member ��ü�� �Ķ���� ���� �����. --%>
<jsp:setProperty property="*" name="mem"/>
<%
	MemberDao dao = new MemberDao();
	//insert ������ ������ ����� ����.
	int result = dao.insert(mem);
	String msg = "ȸ������ ����";
	String url = "joinForm.jsp";
	if(result>0){
		msg = mem.getName() + "�� ȸ������ �Ϸ�";
		url = "loginForm.jsp";
	}
%>
<script>
	alert ("<%=msg%>")
	location.href="<%=url%>";
</script>
