<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/pw.jsp --%>
<%
	String id = request.getParameter("id");
String email = request.getParameter("email");
String tel = request.getParameter("tel");
MemberDao dao = new MemberDao();
String pass = dao.pwSearch(id, email, tel);
if (pass != null) { //id ã�����
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>passwordã��</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
	<table>
		<tr>
			<th>��й�ȣ</th>
			<td><%="**" + pass.substring(pass.length() - 2, pass.length())%></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="�ݱ�"
				onclick="self.close()"></td>
		</tr>
	</table>
</body>
</html>
<%
	} else {
%>
<script>
	alert("������ �´� password�� ã���� �����ϴ�.");
	location.href = "pwForm.jsp";
</script>
<%
	}
%>