<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/upload/uploadForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���ε� ����</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<!-- 
	enctype="multipart/form-data" : ���� ���ε�� ���õ� ������ ������� 
									������ �����ϵ��� ����
	���� ���ε带 �ϱ����ؼ��� enctype="multipart/form-data" �Ӽ��� 
	form�� �����ؾ���.  method="post" ������
	-- ���ǻ��� --
	upload.jsp ������������ request ��ü�� ������� �Ұ�.
	: cos.jar ���Ͽ� ������ MultipartRequest ��ü�� ����ؾ���.
 -->
<body>
<form action="upload.jsp" method="post" enctype="multipart/form-data">
	<table>
		<tr><th>�ø����</th><td><input type="text" name="name"></td></tr>
		<tr><th>����</th><td><input type="text" name="title"></td></tr>
		<tr><th>����</th><td><input type="file" name="file1"></td></tr>
		<tr><td colspan="2"><input type="submit" value="����"></td></tr>
	</table>

</form>
</body>
</html>