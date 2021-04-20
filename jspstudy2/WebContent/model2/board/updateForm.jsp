<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 글쓰기</title>

<script type="text/javascript">
	function file_delete() {
		document.f.file2.value = "";
		file_desc.style.display = "none"; //보이지않도록
	}
</script>

</head>
<body>
	<form action="update.do" method="post" enctype="multipart/form-data"
		name="f">
		<input type="hidden" name="num" value="${ b.num }"> <input
			type="hidden" name="file2" value="${ b.file1==null?'':b.file1 }">
		<table class="w3-table-all">
			<caption>게시판 수정하기</caption>
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="name" value="${ b.name}" class="w3-input w3-border"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" class="w3-input w3-border"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="subject" value="${ b.subject}" class="w3-input w3-border"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="15" name="content" id="content1">${b.content}</textarea></td>
				<script>CKEDITOR.replace("content1",{
					filebrowserImageUploadUrl : "imgupload.do"
				})</script>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td style="text-align: left"><c:if test="${!empty b.file1}">
						<div id="file_desc">
							${b.file1 } <a href="javascript:file_delete()">[첨부파일 삭제]</a>
						</div>
					</c:if> <input type="file" name="file1" value="${ b.file1}"></td>
			</tr>
			<tr>
				<td colspan="2" class="w3-center"><a href="javascript:document.f.submit()">[게시물수정]</a></td>
			</tr>


		</table>
	</form>
</body>
</html>