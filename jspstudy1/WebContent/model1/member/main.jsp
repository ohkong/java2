<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/main.jsp 
	1. 로그인 여부 검증
		로그인 상태 : 현재 화면
			로그인이 admin 인 경우 회원목록 보기 추가 하기
		로그아웃 상태 :  로그인하세요. 메세지 출력후 loginForm.jsp 로 페이지 이동
--%>
<%
	String login = (String)session.getAttribute("login");
	if(login!=null){ %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 관리</title>
</head>
<body>
<h3><%=login %>로 로그인 되었습니다.</h3>
<h3><a href="logout.jsp">로그아웃</a></h3>
<h3><a href="info.jsp?id=<%=login %>">회원정보보기</a></h3>
<%if(login.equals("admin")) {%>
	<h3><a href="list.jsp">회원목록 보기</a></h3>
<% } %>
</body>
</html>
<% } else { %> <%-- 로그아웃상태 --%>
<script>
	alert("로그인하세요")
	location.href="loginForm.jsp"
</script>
<% } %>