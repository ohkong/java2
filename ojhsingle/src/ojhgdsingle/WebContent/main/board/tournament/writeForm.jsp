<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ȸ�Խ��� �۾���</title>

<script type="text/javascript">
function inputcheck() {
	f = document.f;
	if(f.name.value=="") {
		alert("�۾��̸� �Է��ϼ���");
		f.name.focus();
		return;
	}
	if(f.pass.value=="") {
		alert("��й�ȣ�� �Է��ϼ���");
		f.pass.focus();
		return;
	}
	/*
	if(f.subject.value=="") {
		alert("������ �Է��ϼ���");
		f.subject.focus();
		return;
	}
	
	if(f.content.value=="") {
		alert("������ �Է��ϼ���");
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
<table class="w3-table-all"><caption>��ȸ�ҽ� �۾���</caption>
<tr><td>�۾���</td><td>${sessionScope.login}</td></tr>
<tr><td>��й�ȣ</td><td><input type="password" name="pass" class="w3-input w3-border"></td></tr>
<tr><td>����</td><td><input type="text" name="title" class="w3-input w3-border"></td></tr>
<tr><td>����</td><td><textarea rows="15" name="content"  id="content1" class="w3-input w3-border"></textarea></td></tr>
<script>CKEDITOR.replace("content1",{
	filebrowserImageUploadUrl : "imgupload.do"
})</script>
<tr><td>÷������</td><td><input type="file" name="file1"></td></tr>
<tr><td colspan="2" class="w3-center"><input type="button" value="�Խù����" onclick="javascript:inputcheck()"></td></tr>
</table>
</form>
</body>
</html>