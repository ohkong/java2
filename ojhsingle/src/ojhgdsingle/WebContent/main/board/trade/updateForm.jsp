<%@page import="ojhgdsingle.Board"%>
<%@page import="ojhgdsingle.MainDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ŷ��Խ��� �Խñ� ����</title>

</head>
<body>
	<form action="update.do" method="post" enctype="multipart/form-data"
		name="f">
		<input type="hidden" name="btype" value="${param.btype}">
		<input type="hidden" name="num" value="${ b.num }"> <input
			type="hidden" name="file2" value="${ b.file1==null?'':b.file1 }">
		<table class="w3-table-all">
			<caption>�ŷ��Խ��� �Խñ� �����ϱ�</caption>
			<tr>
				<th class="w3-center">�۾���</th>
				<td><input type="text" name="id" readonly value="${ b.id}" class="w3-input w3-border"></td>
			</tr>
			<tr>
				<th class="w3-center">��й�ȣ</th>
				<td><input type="password" name="pass" class="w3-input w3-border"></td>
			</tr>
			<tr>
				<th class="w3-center">����</th>
				<td><input type="text" name="title" value="${ b.title}" class="w3-input w3-border"></td>
			</tr>
			<tr>
				<th class="w3-center">����</th>
				<td><textarea rows="15" name="content" id="content1">${b.content}</textarea></td>
				<script>CKEDITOR.replace("content1",{
					filebrowserImageUploadUrl : "imgupload.do"
				})</script>
			</tr>
			<tr>
				<td colspan="2" class="w3-center">
					<input type="button" value="�Խù� ����" onclick="location.href='info.do?num=${param.num}&btype=${param.btype}'"></td>
			</tr>
		</table>
	</form>
</body>
</html>