<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���� ����</title>
</head>
<body>
<div>
	<div style="border:1px solid black">
		<table class="w3-table-all"><caption>ȸ�� ���� ����</caption>
		<tr><td rowspan="8" width="30%">
		<img src="picture/${mem.picture}" width="200" height="250"></td>
			<th width="20%">���̵�</th>
			<td>${mem.id}</td></tr>
		<tr><th>�̸�</th>
			<td>${mem.name}</td></tr>
		<tr><th>��ȭ��ȣ</th>
			<td>${mem.tel}</td></tr>
		<tr><th>��������</th>
			<td>${mem.region}</td></tr>
		<tr><th>���� ť ��������</th>
			<td>${mem.getCue()==1?"����":"�̺���"}</td></tr>
		<tr><th>�籸 ����/����</th>
			<td>${mem.getKind1()==1?"3��":mem.getKind1()==2?"4��":"������ ���"}/${mem.score1}
				<c:if test="${mem.getKind2() != ''}">
				,&nbsp;&nbsp;&nbsp;${mem.getKind2()==1?"3��":mem.getKind2()==2?"4��":"������ ���"}/${mem.score2}
				</c:if>
				<c:if test="${mem.getKind3() != ''}">
				,&nbsp;&nbsp;&nbsp;${mem.getKind3()==1?"3��":mem.getKind3()==2?"4��":"������ ���"}/${mem.score3}
				</c:if></td></tr>
		<tr><th>�� ��� Ƚ��/��/��</th>
			<td>${mem.totgame}��&nbsp;&nbsp;&nbsp;${mem.win}��&nbsp;${mem.lose}��</td></tr>
		<tr><th>�·�</th>
			<td><c:set var="avg" value="${(mem.win/mem.totgame)}" />
				<fmt:formatNumber value="${avg}" type="percent" /></td></tr>
		<tr><td colspan="3" class="w3-center">
		<input type="button" value="����" onclick="location.href='updateForm.me?id=${mem.id}'">
			<c:if test="${param.id!='admin' && sessionScope.login !='admin'}">
				<input type="button" value="Ż��" onclick="location.href='deleteForm.me?id=${mem.id}'">
			</c:if>
			</td></tr>
		</table>
	</div>
	<br>
	<br>
<div>
	<table class="w3-table-all">
		<caption>���� �Խñ�</caption>
		<tr><th>��ȣ</th><th>����</th><th>�ۼ�����</th></tr>
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
