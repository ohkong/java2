<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ����</title>
<script type="text/javascript">
function inputcheck(f,kbn){
	if(f.num1.value==""){
		alert("���ڸ� �Է��ϼ���");
		f.num.focus();
		return;
	}
	if(isNaN(f.num1.value)){
		alert("���ڸ� �Է��ϼ���");
		f.num.focus();
		f.num.value="";
		return;
	}
	if(f.num2.value==""){
		alert("���ڸ� �Է��ϼ���");
		f.num.focus();
		return;
	}
	if(isNaN(f.num2.value)){
		alert("���ڸ� �Է��ϼ���");
		f.num.focus();
		f.num.value="";
		return;
	}
	f.kbn.value = kbn;
	f.submit(); //submit �߻���Ŵ. onsubmit �̺�Ʈ �߻��ȵ�.
				//�Ķ���� num,kbn�� ������, exam1.jsp ������ ȣ��
}
</script>
</head>
<body>
<form action="test1.jsp" method="post">
<input type="hidden" name="kbn">
����1: <input type="text" name="num1"><br>
����2: <input type="text" name="num2"><br>
<input type="button" value="+" onclick="inputcheck(this.form,'+')">
<input type="button" value="-" onclick="inputcheck(this.form,'-')">
<input type="button" value="*" onclick="inputcheck(this.form,'*')">
<input type="button" value="/" onclick="inputcheck(this.form,'/')"> 
</form>
</body>
</html>