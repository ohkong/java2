<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/updateForm.jsp 
	1. num���� �ش��ϴ� �Խù��� ��ȸ
	2. ��ȸ�� �Խù��� ȭ�鿡 ���
--%>
<% 
	int num = Integer.parseInt(request.getParameter("num"));
	Board b = new BoardDao().selectOne(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� ���� ȭ��</title>
<link rel="stylesheet" href="../../css/main.css">
<script>
	function file_delete(){
		document.f.file2.value="";
		file_desc.style.display="none"; //������ �ʵ��� ����
	}
</script>
</head>
<body>
<form action="update.jsp" method="post" enctype="multipart/form-data" name="f">
	<input type="hidden" name="num" value="<%=b.getNum() %>">
	<input type="hidden" name="file2" value="<%=b.getFile1()==null?"":b.getFile1() %>">
	<table><caption>�Խ��� ���� ȭ��</caption>
		<tr><td>�۾���</td>
			<td><input type="text" name="name" value="<%=b.getName() %>"></td></tr>
		<tr><td>��й�ȣ</td>
			<td><input type="password" name="pass"></td></tr>
		<tr><td>����</td>
			<td><input type="text" name="subject" value="<%=b.getSubject() %>"></td></tr>
		<tr><td>����</td>
			<td><textarea rows="15" name="content"><%=b.getContent() %></textarea></td>
		<tr><td>÷������</td>
			<td style="text-align:left">
			<%if(b.getFile1() !=null && (!b.getFile1().equals(""))) {%>
			<div id="file_desc">
				<%=b.getFile1() %>
				<a href="javascript:file_delete()">[÷������ ����]</a>
			</div>	<%} %>
			<input type="file" name="file1"></td></tr>
		<tr><td colspan="2">
			<a href="javascript:document.f.submit()">[�Խù�����]</a></td></tr>
	</table>
</form>
</body>
</html>