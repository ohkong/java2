<%@page import="ojhgdsingle.Board"%>
<%@page import="ojhgdsingle.MainDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>거래게시판 게시글 수정</title>

</head>
<body>
	<form action="update.do" method="post" enctype="multipart/form-data"
		name="f">
		<input type="hidden" name="btype" value="${param.btype}">
		<input type="hidden" name="num" value="${ b.num }"> <input
			type="hidden" name="file2" value="${ b.file1==null?'':b.file1 }">
		<table class="w3-table-all">
			<caption>거래게시판 게시글 수정하기</caption>
			<tr>
				<th class="w3-center">글쓴이</th>
				<td><input type="text" name="id" readonly value="${ b.id}" class="w3-input w3-border"></td>
			</tr>
			<tr>
				<th class="w3-center">비밀번호</th>
				<td><input type="password" name="pass" class="w3-input w3-border"></td>
			</tr>
			<tr>
				<th class="w3-center">제목</th>
				<td><input type="text" name="title" value="${ b.title}" class="w3-input w3-border"></td>
			</tr>
			<tr>
				<th class="w3-center">내용</th>
				<td><textarea rows="15" name="content" id="content1">${b.content}</textarea></td>
				<script>CKEDITOR.replace("content1",{
					filebrowserImageUploadUrl : "imgupload.do"
				})</script>
			</tr>
			<tr>
				<td colspan="2" class="w3-center">
					<input type="button" value="게시물 수정" onclick="location.href='info.do?num=${param.num}&btype=${param.btype}'"></td>
			</tr>
		</table>
	</form>
</body>
</html>