<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/info.jsp 
 	1. id �Ķ���� ���� ��ȸ.
	2. login ���� ����
    	�α׾ƿ� ���� : '�α��� �ϼ���' �޼��� ��� �� loginForm.jsp
	3. login ���� ���� 2
	   id �Ķ���Ͱ��� login id�� �ٸ� ��� : ������ ��ȸ�� �����մϴ�. �޼��� ���.
	    main.jsp ������ �̵�.
	4. db���� id ������ ������ ��ȸ. : selectOne(id)
	5. ��ȸ�� ������ ȭ�� ����ϱ� 
--%>    
<% 	
	//1. id �Ķ���Ͱ��� ��ȸ
	request.setCharacterEncoding("euc-kr");
	String id=request.getParameter("id");
	//2. login ���� ����
	String login =(String)session.getAttribute("login");
	%>
	<% if(login==null){ %>
	<script>
	alert("�α��� �ϼ���");
	location.href="loginForm.jsp";
	</script>
	<% //3. login ���� ����2 
	} else if(!login.equals("admin")&&!login.equals(id)){
	%>
	<script type="text/javascript">
	alert("������ ��ȸ�� �����մϴ�.");
	location.href="main.jsp";
	</script>
	<% } else{ //�������̰ų� admin ��ȸ
	// 4. db���� id ������ ������ ��ȸ.
	Member mem = new MemberDao().selectOne(id); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���� ����</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
		<table><caption>ȸ�� ���� ����</caption>
		<tr><td rowspan="6" width="30%"><img src="picture/<%=mem.getPicture() %>" 
		width="200" height="210"></td>
			<th width="20%">���̵�</th>
			<td><%=mem.getId() %></td></tr>
		<tr><th>�̸�</th>
			<td><%=mem.getName() %></td></tr>
		<tr><th>����</th>
			<td><%=mem.getGender()==1?"��":"��" %></td></tr>
		<tr><th>��ȭ��ȣ</th>
			<td><%=mem.getTel() %></td></tr>
		<tr><th>�̸���</th>
			<td><%=mem.getEmail() %></td></tr>
		<tr><td colspan="2"><a href="updateForm.jsp?id=<%=mem.getId()%>">[����]</a>
				<%if(!id.equals("admin")&&!login.equals("admin")) {%>
				<a href="deleteForm.jsp?id=<%=mem.getId()%>">[Ż��]</a></td></tr>
			<% } %>
	</table>
</body>
</html>
	<% } %>