<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- /WebContent/model2/ajax/exchange2.jsp 
	map �Ӽ� : ������, [�ڵ�, �Ÿű�����, �ĽǶ�, ��Ƕ�]
	date �Ӽ� : ȯ�� ������	
--%>
<table class="w3-table-all">
	<caption>KEB�ϳ�����:${date}</caption>
	<tr><th rowspan="2" style="vertical-align:middle">�ڵ�</th>
		<th rowspan="2" style="vertical-align:middle">������</th>
		<th colspan="2" class="w3-center">����</th></tr>
	<tr><th>�ĽǶ�</th><th>��Ƕ�</th></tr>
	<c:forEach var="d" items="${map}">
	<tr><td class="w3-center">${d.key}(${d.value[0]})</td><td>${d.value[1]}</td>
		<td>${d.value[2]}</td><td>${d.value[3]}</td></tr>
	</c:forEach>
</table>