<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--  5/WebContent/ExamForm1.jsp  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function inputcheck(f,kbn){
		if(f.num.value==""){
			alert("���ڸ� �Է��ϼ���");
			f.num.focus();
			return;
		}
		if(isNaN(f.num.value)){
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
<form action="exam1.jsp" method="post">
	<input type="hidden" name="kbn">
	<input type="text" name="num">������ �� ���ϱ�
	<input type="button" value="��ü�հ�" onclick="inputcheck(this.form,0)">
	<input type="button" value="¦���հ�" onclick="inputcheck(this.form,2)">
	<input type="button" value="Ȧ���հ�" onclick="inputcheck(this.form,1)">
</form>
</body>
</html>