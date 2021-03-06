<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/updateForm.jsp 
	1. id 파라미터 조회
	2. login 정보 조회.
		- 로그아웃 : "로그인 하세요" 출력. loginForm.jsp 페이지 이동.
	3. 내정보가 아니면서 admin도 아닌경우
		- 내정보만 수정 가능합니다 출력. main.jsp 페이지 이동
	4. id 정보를 db에서 읽어 Member 객체에 저장
	5. Member 객체를 화면에 출력
--%>
<%
String id=request.getParameter("id");
String login =(String)session.getAttribute("login");
%>
<% if(login==null){ %>
	<script>
	alert("로그인 하세요");
	location.href="loginForm.jsp";
	</script>
<% 
	} else if(!login.equals("admin")&&!login.equals(id)){
%>
<script>
	alert("내정보 수정만 가능합니다.");
	location.href="main.jsp";
</script>
	<% } else{ //정상적인거래. 본인거래, 관리자인경우 다른사용자 정보도 가능
		// mem : id에 해당하는 사용자 상세 정보 저장
	Member mem = new MemberDao().selectOne(id); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function inputcheck(f){
		if(f.pass.value==""){
			alert("비밀번호를 입력하세요.");
			f.pass.focus();
			return false;
		}
		return true;
	}
	function win_passchg(){
		var op = "width=500, height=250, left=50, top=150";
		open("passwordForm.jsp","",op);
	}
	function win_upload(){
		var op = "width=500, height=550, left=50, top=150";
		open("pictureForm.jsp","",op);
	}
</script>
</head>
<body>
<form action="update.jsp" name="f" method="post" onsubmit="return inputcheck(this)">
 <input type="hidden" name="picture" value="<%=mem.getPicture()%>">
  <table><caption>회원 정보 수정</caption>
  <tr><td rowspan="4" valign="bottom">
    <img src="picture/<%=mem.getPicture() %>" width="100" height="120" id="pic"><br>
    <font size="1"><a href="javascript:win_upload()">사진수정</a></font>
    </td><th>아이디</th><td><input type="text" name="id" readonly value="<%=mem.getId() %>"></td></tr>
    <tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
    <tr><th>이름</th><td><input type="text" name="name" value="<%=mem.getName() %>"></td></tr>
    <tr><th>성별</th><td><input type="radio" name="gender" value="1" <%=mem.getGender()==1?"checked":""%>>남
    					<input type="radio" name="gender" value="2" <%=mem.getGender()==2?"checked":""%>>여</td></tr>
    <tr><th>전화번호</th><td colspan="2"><input type="text" name="tel" value="<%=mem.getTel() %>"></td></tr>
  	<tr><th>이메일</th><td colspan="2"><input type="text" name="email" value="<%=mem.getEmail() %>"></td></tr>
  	<tr><td colspan="3"><input type="submit" value="회원수정">
  	<%if(!login.equals("admin")||id.equals("admin")) {%>
  						<input type="button" value="비밀번호수정" onclick="win_passchg()"></td></tr>
  				<% } %>
  </table>
</form>
</body>
</html>
<% } %>