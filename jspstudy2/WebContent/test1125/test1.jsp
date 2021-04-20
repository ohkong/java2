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
if(op == '') op = "+" //만약 op가 빈 문자열이면 + 그렇지 않으면 입력된 오피를 ㅇ집어넣어~
document.forms[0].op.value=op;
</script>
		y:<input type="text" name="num2" value="${param.num2}" size="5">
		<input type="submit" value="="> 
	</form>
</body>
</html>