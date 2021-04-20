<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/board/replyForm.jsp : 답변글 쓰기 화면 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 답글 쓰기</title>

</head>
<body>
	<form action="reply.do" method="post" name="f">
		<input type="hidden" name="num" value="${b.num}">
		<input type="hidden" name="grp" value="${b.grp}">
		<input type="hidden" name="grplevel" value="${b.grplevel}">
		<input type="hidden" name="grpstep" value="${b.grpstep}">
		<table class="w3-table-all">
			<caption>게시판 답글 등록</caption>
			<tr>
				<th>글쓴이</th>
				<td><input type="text" name="name" class="w3-input w3-border"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass" class="w3-input w3-border"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject"
					value="RE:${b.subject}"  class="w3-input w3-border"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="content1" rows="15" cols="50"></textarea></td>
				<script>CKEDITOR.replace("content1",{
					filebrowserImageUploadUrl : "imgupload.do"
				})</script>
			</tr>
			<tr>
				<td colspan="2" class="w3-center"><a href="javascript:document.f.submit()">[답변글등록]</a></td>
			</tr>
		</table>
	</form>
</body>
</html>