<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보 보기</title>
</head>
<body>
<div>
	<div style="border:1px solid black">
		<table class="w3-table-all"><caption>회원 정보 보기</caption>
		<tr><td rowspan="8" width="30%">
		<img src="picture/${mem.picture}" width="200" height="250"></td>
			<th width="20%">아이디</th>
			<td>${mem.id}</td></tr>
		<tr><th>이름</th>
			<td>${mem.name}</td></tr>
		<tr><th>전화번호</th>
			<td>${mem.tel}</td></tr>
		<tr><th>거주지역</th>
			<td>${mem.region}</td></tr>
		<tr><th>개인 큐 보유여부</th>
			<td>${mem.getCue()==1?"보유":"미보유"}</td></tr>
		<tr><th>당구 종목/점수</th>
			<td>${mem.getKind1()==1?"3구":mem.getKind1()==2?"4구":"국제식 대대"}/${mem.score1}
				<c:if test="${mem.getKind2() != ''}">
				,&nbsp;&nbsp;&nbsp;${mem.getKind2()==1?"3구":mem.getKind2()==2?"4구":"국제식 대대"}/${mem.score2}
				</c:if>
				<c:if test="${mem.getKind3() != ''}">
				,&nbsp;&nbsp;&nbsp;${mem.getKind3()==1?"3구":mem.getKind3()==2?"4구":"국제식 대대"}/${mem.score3}
				</c:if></td></tr>
		<tr><th>총 경기 횟수/승/패</th>
			<td>${mem.totgame}전&nbsp;&nbsp;&nbsp;${mem.win}승&nbsp;${mem.lose}패</td></tr>
		<tr><th>승률</th>
			<td><c:set var="avg" value="${(mem.win/mem.totgame)}" />
				<fmt:formatNumber value="${avg}" type="percent" /></td></tr>
		<tr><td colspan="3" class="w3-center">
		<input type="button" value="수정" onclick="location.href='updateForm.me?id=${mem.id}'">
			<c:if test="${param.id!='admin' && sessionScope.login !='admin'}">
				<input type="button" value="탈퇴" onclick="location.href='deleteForm.me?id=${mem.id}'">
			</c:if>
			</td></tr>
		</table>
	</div>
	<br>
	<br>
<div>
	<table class="w3-table-all">
		<caption>나의 게시글</caption>
		<tr><th>번호</th><th>제목</th><th>작성일자</th></tr>
		<c:forEach var="b" items="${list}">
		<tr>
		<td>${boardnum}</td>
		<c:set var="boardnum" value="${boardnum+1}"/>
      <td style = "text-align:left">${b.title}</td>
      <td><fmt:formatDate var="rdate" value="${b.regdate}"
               pattern="yyyy-MM-dd"/>
               <c:if test="${today == rdate }">
               <fmt:formatDate value="${b.regdate}" pattern="HH:mm"/>
               </c:if>
               <c:if test="${today != rdate }">
               <fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd"/>
               </c:if></td> 
</c:forEach>
	</table>
</div>
</div>
</body>
</html>
