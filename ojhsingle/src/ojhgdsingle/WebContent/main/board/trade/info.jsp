<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ŷ��Խ��� �Խù� �󼼺���</title>
</head>
<body>
<form>
<input type="hidden" name="btype" value="${param.btype}">
<input type="hidden" name="num" value="${param.num}">
<input type="hidden" name="id" value="${param.id}">
<table class="w3-table-all"><caption>�ŷ��Խ��� �Խù� �� ����</caption>
<tr><th width="20%">�۾���</th><td colspan="3" width="80%" style="text-align:left">${b.id}</td></tr>
<tr><th>����</th><td style="text-align:left" colspan="3">
	<c:if test="${b.getTradetype()!=''}">
	[${b.getTradetype()==1?'�˴ϴ�':'��ϴ�'}] 
	</c:if>
	${b.title}</td></tr>
<tr><th>����</th>
<td colspan="3"><table style="width:100%; height:250px;">
<tr><td style="border-width:0px; vertical-align:top; text-align:left">${b.content}</td></tr></table></td></tr>
<tr><td colspan="4" class="w3-center">
		<c:if test="${sessionScope.login == b.id}">
				<a href = "updateForm.do?num=${param.num}&btype=${param.btype}">����</a>
				<a href = "deleteForm.do?num=${param.num}&btype=${param.btype}">����</a>
		</c:if>
				<a href = "list.do?btype=${param.btype}">���</a></td></tr>
				<tr><th colspan="4" class="w3-center">��� ���</th></tr>
			<tr><th>�ۼ� ����</th><th>��� ����</th><th>��� �ۼ���</th><td></td></tr>
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
				<td><c:if test="${sessionScope.login==r.id2}">
					<a href = "">����</a></c:if>
					<c:if test="${sessionScope.login==r.id2 || sessionScope.login==b.id}">
					<a href = "">����</a></c:if></td>
				</tr>
			</c:forEach>
</table>
</form>
	<div>
<form action=reply.do method="post" name="f">
	<input type="hidden" name="rtype" value="3">
	<input type="hidden" name="num" value="${param.num}">
	<input type="hidden" name="id2" value="${sessionScope.login}">
	<input type="hidden" name="btype" value="${param.btype}">
		<table class="w3-table-all">
			<tr><td colspan="2"><textarea rows="4" cols="80" name="rcontent"></textarea></td>
				<td><input type="submit" value="��� ���"></td></tr> 
				</table>
</form>
		
	</div>
</body>
</html>