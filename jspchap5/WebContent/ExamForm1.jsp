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
			alert("숫자를 입력하세요");
			f.num.focus();
			return;
		}
		if(isNaN(f.num.value)){
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
<form action="exam1.jsp" method="post">
	<input type="hidden" name="kbn">
	<input type="text" name="num">까지의 합 구하기
	<input type="button" value="전체합계" onclick="inputcheck(this.form,0)">
	<input type="button" value="짝수합계" onclick="inputcheck(this.form,2)">
	<input type="button" value="홀수합계" onclick="inputcheck(this.form,1)">
</form>
</body>
</html>