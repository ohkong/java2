<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게임게시판 글쓰기</title>
<script type="text/javascript">
function inputcheck() {
	f = document.f;
	if(f.pass.value=="") {
		alert("비밀번호를 입력하세요");
		f.pass.focus();
		return;
	}
// 	if(f.subject.value=="") {
// 		alert("제목을 입력하세요");
// 		f.subject.focus();
// 		return;
// 	}
	if(f.content.value=="") {
		alert("내용을 입력하세요");
		f.content.focus();
		return;
	}
	f.submit();
}
</script>
</head>
<body>
<form action="write.do" method="post" enctype="multipart/form-data" name="f">
<input type="hidden" name="btype" value="${param.btype}">
<input type="hidden" name="id" value="${sessionScope.login}">
<table class="w3-table-all"><caption>게임한판 글쓰기</caption>
<tr><th>글쓴이</th><td colspan="3">${sessionScope.login}</td></tr>
<tr><th>비밀번호</th><td colspan="3"><input type="password" name="pass" class="w3-input w3-border"></td></tr>
<tr><th>제목</th><td colspan="3"><input type="text" name="title" class="w3-input w3-border"></td></tr>
<tr><th>내용</th><td colspan="3"><textarea rows="15" name="content"  id="content1" class="w3-input w3-border"></textarea></td></tr>
<tr><td colspan="4" class="w3-center">
<input type="button" value="게시물등록" onclick="javascript:inputcheck()"></td></tr>
</table>
</form>
</body>
</html>