<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>1112testForm2</title>
<style type="text/css">
td{font-size:20px;}
#con{width:400px;height:150px;}
</style>
<script type="text/javascript">
	function inputcheck(f){
		if(f.name.value==''){
			alert("�湮�ڸ� �Է��ϼ���");
			f.name.focus();
			return false;
		}
		if(f.title.value==''){
			alert("���� �Է��ϼ���");
			f.title.focus();
			return false;
		}
		if(f.content.value==''){
			alert("���븦 �Է��ϼ���");
			f.content.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<form action="test2.jsp" method="post" onsubmit="inputcheck(this)">
<table>
<tr><td>�湮��</td><td><input type="text" name="name"></td></tr>
<tr><td>����</td><td><input type="text" name="title"></td></tr>
<tr><td>����</td><td><input type="text" name="content" id="con"></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="�۾���"></td></tr>
</table>
</form>
</body>
</html>