<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- /WebContent/model2/ajax/exchange.jsp 
	list 속성값 : 통화코드, 환율정보
	list2 속성값 : 국가명
--%>
<table class="w3-table-all">
	<caption>수출입은행:
	<fmt:formatDate value="${today}" pattern="yyyy-MM-dd HH:mm"/></caption>
	<tr><td colspan="3" class="w3-center">${list2[0]}:${list[0]}</td></tr>
	<tr><th>기준율</th><th>받을때</th><th>파실때</th></tr>
	<tr><td>${list[3]}</td><td>${list[1]}</td><td>${list[2]}</td></tr>
</table>