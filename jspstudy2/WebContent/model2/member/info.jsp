<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/model2/member/info.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보 보기</title>
</head>
<body>
		<table class="w3-table-all"><caption>회원 정보 보기</caption>
		<tr><td rowspan="6" width="30%">
		<%--
			${mem.id} : Member객체의 getId()메서드 호출
						getProperty id를 의미함.
		 --%>
		<img src="picture/${mem.picture}" width="200" height="210"></td>
			<th width="20%">아이디</th>
			<td>${mem.id}</td></tr>
		<tr><th>이름</th>
			<td>${mem.name}</td></tr>
		<tr><th>성별</th>
			<td>${mem.getGender()==1?"남":"여"}</td></tr>
		<tr><th>전화번호</th>
			<td>${mem.tel}</td></tr>
		<tr><th>이메일</th>
			<td>${mem.email}</td></tr>
		<tr><td colspan="2"><a href="updateForm.me?id=${mem.id}">[수정]</a>
			<c:if test="${param.id!='admin' && sessionScope.login !='admin'}">
				<a href="deleteForm.me?id=${mem.id}">[탈퇴]</a>
			</c:if>
			</td></tr>
	</table>
</body>
</html>
