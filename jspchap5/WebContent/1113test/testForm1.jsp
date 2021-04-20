<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>간단한 계산기</title>
<script type="text/javascript">
function inputcheck(f,kbn){
	if(f.num1.value==""){
		alert("숫자를 입력하세요");
		f.num.focus();
		return;
	}
	if(isNaN(f.num1.value)){
		alert("숫자만 입력하세요");
		f.num.focus();
		f.num.value="";
		return;
	}
	if(f.num2.value==""){
		alert("숫자를 입력하세요");
		f.num.focus();
		return;
	}
	if(isNaN(f.num2.value)){
		alert("숫자만 입력하세요");
		f.num.focus();
		f.num.value="";
		return;
	}
	f.kbn.value = kbn;
	f.submit(); //submit 발생시킴. onsubmit 이벤트 발생안됨.
				//파라미터 num,kbn를 가지고, exam1.jsp 페이지 호출
}
</script>
</head>
<body>
<form action="test1.jsp" method="post">
<input type="hidden" name="kbn">
숫자1: <input type="text" name="num1"><br>
숫자2: <input type="text" name="num2"><br>
<input type="button" value="+" onclick="inputcheck(this.form,'+')">
<input type="button" value="-" onclick="inputcheck(this.form,'-')">
<input type="button" value="*" onclick="inputcheck(this.form,'*')">
<input type="button" value="/" onclick="inputcheck(this.form,'/')"> 
</form>
</body>
</html>