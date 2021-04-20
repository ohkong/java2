<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- /WebContent/model2/ajax/exchange2.jsp 
	map 속성 : 국가명, [코드, 매매기준율, 파실때, 사실때]
	date 속성 : 환율 기준율	
--%>
<table class="w3-table-all">
	<caption>KEB하나은행:${date}</caption>
	<tr><th rowspan="2" style="vertical-align:middle">코드</th>
		<th rowspan="2" style="vertical-align:middle">기준율</th>
		<th colspan="2" class="w3-center">현찰</th></tr>
	<tr><th>파실때</th><th>사실때</th></tr>
	<c:forEach var="d" items="${map}">
	<tr><td class="w3-center">${d.key}(${d.value[0]})</td><td>${d.value[1]}</td>
		<td>${d.value[2]}</td><td>${d.value[3]}</td></tr>
	</c:forEach>
</table>