<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���ӰԽ��� �۾���</title>
<script type="text/javascript">
function inputcheck() {
	f = document.f;
	if(f.pass.value=="") {
		alert("��й�ȣ�� �Է��ϼ���");
		f.pass.focus();
		return;
	}
// 	if(f.subject.value=="") {
// 		alert("������ �Է��ϼ���");
// 		f.subject.focus();
// 		return;
// 	}
	if(f.content.value=="") {
		alert("������ �Է��ϼ���");
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
<table class="w3-table-all"><caption>�������� �۾���</caption>
<tr><th>�۾���</th><td colspan="3">${sessionScope.login}</td></tr>
<tr><th>��й�ȣ</th><td colspan="3"><input type="password" name="pass" class="w3-input w3-border"></td></tr>
<tr><th>����</th><td colspan="3"><input type="text" name="title" class="w3-input w3-border"></td></tr>
<tr><th>����</th><td colspan="3"><textarea rows="15" name="content"  id="content1" class="w3-input w3-border"></textarea></td></tr>
<tr><td colspan="4" class="w3-center">
<input type="button" value="�Խù����" onclick="javascript:inputcheck()"></td></tr>
</table>
</form>
</body>
</html>