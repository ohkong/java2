<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
<script type="text/javascript">
	function win_upload(){
		var op = "width=500, height=500, left=50, top=150";
		open("pictureForm.me","",op);
	}
</script>
</head>
<body>
<form action="join.me" name="f" method="post">
 <input type="hidden" name="picture" value="">
  <table class="w3-table-all"><tr><td rowspan="4" valign="bottom">
    <img src="" width="100" height="120" id="pic"><br>
    <font size="1"><a href="javascript:win_upload()">�������</a></font>
    </td><th>���̵�</th><td><input type="text" name="id"></td></tr>
    <tr><th>��й�ȣ</th><td><input type="password" name="pass"></td></tr>
    <tr><th>�̸�</th><td><input type="text" name="name"></td></tr>
    <tr><th>���� ť ����</th><td><input type="radio" name="cue" value="1">����
    					<input type="radio" name="cue" value="2" checked>�̺���</td></tr>
    <tr><th>��ȭ��ȣ</th><td colspan="2"><input type="text" name="tel"></td></tr>
  	<tr><th>��������</th><td colspan="2"><input type="text" name="region" value="�� ��"> 00�� 00�� ������ �ۼ�</td></tr>
  	<tr><th>�籸���� (�ش� ���� ������ ���� �Է�)</th><td>
  		<select name="kind1">
			<option value="">����1</option>
			<option value="1">3��</option>
			<option value="2">4��</option>
			<option value="3">������ ���</option>
		</select></td><td><input type="text" name="score1"></td></tr>
	<tr><th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(3���� �ּ� 1�� �Է�)</th><td>
  		<select name="kind2">
			<option value="">����2</option>
			<option value="1">3��</option>
			<option value="2">4��</option>
			<option value="3">������ ���</option>
		</select></td><td><input type="text" name="score2"></td></tr>
	<tr><th>&nbsp;</th><td>
  		<select name="kind3">
			<option value="">����3</option>
			<option value="1">3��</option>
			<option value="2">4��</option>
			<option value="3">������ ���</option>
		</select></td><td><input type="text" name="score3"></td></tr>
  	<tr><td colspan="3" class="w3-center"><input type="submit" value="ȸ������"></td></tr>
  </table>
</form>
</body>
</html>