<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>대회게시판 글쓰기</title>

<script type="text/javascript">
function inputcheck() {
	f = document.f;
	if(f.name.value=="") {
		alert("글쓴이를 입력하세요");
		f.name.focus();
		return;
	}
	if(f.pass.value=="") {
		alert("비밀번호를 입력하세요");
		f.pass.focus();
		return;
	}
	/*
	if(f.subject.value=="") {
		alert("제목을 입력하세요");
		f.subject.focus();
		return;
	}
	
	if(f.content.value=="") {
		alert("내용을 입력하세요");
		f.content.focus();
		return;
	}
	*/
	
	f.submit();
}
</script>
</head>
<body>
<form action="write.do" method="post" enctype="multipart/form-data" name="f">
<input type="hidden" name="btype" value="${param.btype}">
<input type="hidden" name="id" value="${sessionScope.login}">
<table class="w3-table-all"><caption>대회소식 글쓰기</caption>
<tr><td>글쓴이</td><td>${sessionScope.login}</td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pass" class="w3-input w3-border"></td></tr>
<tr><td>제목</td><td><input type="text" name="title" class="w3-input w3-border"></td></tr>
<tr><td>내용</td><td><textarea rows="15" name="content"  id="content1" class="w3-input w3-border"></textarea></td></tr>
<script>CKEDITOR.replace("content1",{
	filebrowserImageUploadUrl : "imgupload.do"
})</script>
<tr><td>첨부파일</td><td><input type="file" name="file1"></td></tr>
<tr><td colspan="2" class="w3-center"><input type="button" value="게시물등록" onclick="javascript:inputcheck()"></td></tr>
</table>
</form>
</body>
</html>