<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>test1</title>
</head>
<body>
	<form method="post" name="f">
		x:<input type="text" name="num1" value="${param.num1}" size="5">
		<select name="op">
			<option>+</option>
			<option>-</option>
			<option>*</option>
			<option>-</option>
		</select>
		<script type="text/javascript">
var op= '${param.op}';
if(op == '') op = "+" //���� op�� �� ���ڿ��̸� + �׷��� ������ �Էµ� ���Ǹ� ������־�~
document.forms[0].op.value=op;
</script>
		y:<input type="text" name="num2" value="${param.num2}" size="5">
		<input type="submit" value="="> 
	</form>
</body>
</html>