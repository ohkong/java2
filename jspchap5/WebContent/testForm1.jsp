<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>1112testForm1</title>
<script type="text/javascript">
	function inputcheck(f){
		//���ڰ��� �Է¾ȵǸ� ���ڸ� �Է��ϼ��� �޼��� ����ϰ�, �Է� focus�� �Է�ĭ���� �����ϱ�
		if(f.num.value==''){
			alert("���ڸ� �Է��ϼ���");
			f.num.focus();
			return false;
		}
		if(isNaN(f.num.value)){
			alert("���ڸ� �Է��ϼ���");
			f.num.focus();
			f.num.value="";
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<form action="test1.jsp" method="post"
onsubmit="inputcheck(this)">
<input type="text" name="num">������ �� ���ϱ�
<input type="submit" value="�հ�" >
</form>
</body>
</html>