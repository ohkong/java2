<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
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
    <font size="1"><a href="javascript:win_upload()">사진등록</a></font>
    </td><th>아이디</th><td><input type="text" name="id"></td></tr>
    <tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
    <tr><th>이름</th><td><input type="text" name="name"></td></tr>
    <tr><th>개인 큐 보유</th><td><input type="radio" name="cue" value="1">보유
    					<input type="radio" name="cue" value="2" checked>미보유</td></tr>
    <tr><th>전화번호</th><td colspan="2"><input type="text" name="tel"></td></tr>
  	<tr><th>거주지역</th><td colspan="2"><input type="text" name="region" value="도 시"> 00도 00시 단위로 작성</td></tr>
  	<tr><th>당구점수 (해당 종목 선택후 점수 입력)</th><td>
  		<select name="kind1">
			<option value="">종목1</option>
			<option value="1">3구</option>
			<option value="2">4구</option>
			<option value="3">국제식 대대</option>
		</select></td><td><input type="text" name="score1"></td></tr>
	<tr><th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(3개중 최소 1개 입력)</th><td>
  		<select name="kind2">
			<option value="">종목2</option>
			<option value="1">3구</option>
			<option value="2">4구</option>
			<option value="3">국제식 대대</option>
		</select></td><td><input type="text" name="score2"></td></tr>
	<tr><th>&nbsp;</th><td>
  		<select name="kind3">
			<option value="">종목3</option>
			<option value="1">3구</option>
			<option value="2">4구</option>
			<option value="3">국제식 대대</option>
		</select></td><td><input type="text" name="score3"></td></tr>
  	<tr><td colspan="3" class="w3-center"><input type="submit" value="회원가입"></td></tr>
  </table>
</form>
</body>
</html>