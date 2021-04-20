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
if (pass != null) { //id 찾은경우
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>password찾기</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
	<table>
		<tr>
			<th>비밀번호</th>
			<td><%="**" + pass.substring(pass.length() - 2, pass.length())%></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="닫기"
				onclick="self.close()"></td>
		</tr>
	</table>
</body>
</html>
<%
	} else {
%>
<script>
	alert("정보에 맞는 password를 찾을수 없습니다.");
	location.href = "pwForm.jsp";
</script>
<%
	}
%>