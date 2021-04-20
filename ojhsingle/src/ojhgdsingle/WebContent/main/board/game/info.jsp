<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 상세보기</title>
</head>
<body>
<form>
<input type="hidden" name="btype" value="${param.btype}">
<input type="hidden" name="num" value="${param.num }">
<input type="hidden" name="id" value="${param.id}">
<table class="w3-table-all"><caption>게시물 상세 보기</caption>
<tr><th width="20%">글쓴이</th><td colspan="4" width="80%" style="text-align:left">${b.id}</td></tr>
<tr><th>제목</th><td colspan="4" style="text-align:left">${b.title}</td></tr>
<tr><th>당구점수</th><td colspan="2">${mem.getKind1()==1?"3구":mem.getKind1()==2?"4구":"국제식 대대"}/${mem.getScore1()}
				<c:if test="${mem.getKind2() != ''}">
				,&nbsp;&nbsp;${mem.getKind2()==1?"3구":mem.getKind2()==2?"4구":"국제식 대대"}/${mem.getScore2()}
				</c:if>
				<c:if test="${mem.getKind3() != ''}">
				,&nbsp;&nbsp;${mem.getKind3()==1?"3구":mem.getKind3()==2?"4구":"국제식 대대"}/${mem.getScore3()}
				</c:if></td><th>거주지역</th><td>${mem.getRegion()}</td></tr>
<tr><th>내용</th>
<td colspan="4"><table style="width:100%; height:250px;">
<tr><td style="border-width:0px; vertical-align:top; text-align:left">${b.content}</td></tr></table></td></tr>
<tr><td colspan="5" class="w3-center">
		<c:if test="${sessionScope.login == b.id}">
				<a href = "updateForm.do?num=${param.num}&btype=${param.btype}">수정</a>
				<a href = "deleteForm.do?num=${param.num}&btype=${param.btype}">삭제</a>
		</c:if>
				<a href = "list.do?btype=${param.btype}">목록</a></td></tr>
				<tr><th colspan="5" class="w3-center">댓글 목록</th></tr>
			<tr><th>작성 일자</th><th>댓글 내용</th><th>댓글 작성자</th><th>경기여부</th><td></td></tr>
			<c:forEach var="r" items="${list1}">
			<tr><td><fmt:formatDate var="rdate" value="${r.rregdate}" pattern="yyyy-MM-dd"/>
               <c:if test="${today == rdate }">
               		<fmt:formatDate value="${r.rregdate}" pattern="HH:mm"/>
               </c:if>
               <c:if test="${today != rdate }">
               		<fmt:formatDate value="${r.rregdate}" pattern="yyyy-MM-dd"/>
               </c:if></td>
				<td>${r.rcontent}</td>
				<td>${r.id2}</td>
				<td><c:if test="${sessionScope.login==b.id}">
					<input type="checkbox" value="gameresult"></c:if></td>
				<td><c:if test="${sessionScope.login==r.id2}">
					<a href = "">수정</a></c:if>
					<c:if test="${sessionScope.login==r.id2 || sessionScope.login==b.id}">
					<a href = "">삭제</a></c:if></td>
				</tr>
			</c:forEach>
</table>
</form>
	<div>
<form action=reply.do method="post" name="f">
	<input type="hidden" name="rtype" value="1">
	<input type="hidden" name="num" value="${param.num}">
	<input type="hidden" name="id2" value="${sessionScope.login}">
	<input type="hidden" name="btype" value="${param.btype}">
		<table class="w3-table-all">
			<tr><td colspan="2"><textarea rows="4" cols="80" name="rcontent"></textarea></td>
				<td><input type="submit" value="댓글 등록"></td></tr> 
				</table>
</form>
		
	</div>

</body>
</html>