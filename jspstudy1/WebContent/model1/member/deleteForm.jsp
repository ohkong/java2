<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/list.jsp 
	1. �Ķ���� �����ϱ�
	2. login ���� �����ϱ�
		�α׾ƿ������� ���
			�α����ϼ���. �޼��� ����� loginForm.jsp �������� �̵�
		�����ڰ� �ƴϸ鼭 id �Ķ���� ������ login ������ �ٸ����
			���θ� Ż�� �����մϴ�. �޼��� ����� main.jsp �������� �̵�
	3. ���� ȭ�� ����ϱ�
--%>
<%
	request.setCharacterEncoding("euc-kr");
	String id=request.getParameter("id");
	String login=(String)session.getAttribute("login");
	if(login==null){ %>
	<script>
	 	alert("�α����� �ʿ��մϴ�");
	 	location.href="loginForm.jsp";
	 </script>
	<% } else if(!login.equals("admin") && !login.equals(id)) {%>
	<script>
		alert("���θ� Ż�� �����մϴ�.");
		location.href="main.jsp";
	</script>
	<% } else {%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� Ż�� ��й�ȣ �Է�</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function inputcheck(f){
		if(f.pass.value==""){
			alert("��й�ȣ�� �Է��ϼ���")
			f.pass.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<form action="delete.jsp" method="post" onsubmit="return inputcheck(this)">
	<input type="hidden" name="id" value="<%=id%>">
		<table><caption>ȸ����й�ȣ �Է�</caption>
		<tr><th>��й�ȣ</th><td><input type="password" name="pass"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="Ż���ϱ�"/></td></tr>
	</table>
</form>
</body>
</html>
<%}%>