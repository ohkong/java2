<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>1112testForm1</title>
<script type="text/javascript">
	function inputcheck(f){
		//숫자값이 입력안되면 숫자를 입력하세요 메세지 출력하고, 입력 focus를 입력칸으로 설정하기
		if(f.num.value==''){
			alert("숫자를 입력하세요");
			f.num.focus();
			return false;
		}
		if(isNaN(f.num.value)){
			alert("숫자만 입력하세요");
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
<input type="text" name="num">까지의 합 구하기
<input type="submit" value="합계" >
</form>
</body>
</html>