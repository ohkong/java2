<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/board.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="UTF-8"/>
<%-- 데이터베이스의 Connection 객체 --%>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
	url="jdbc:mariadb://localhost:3307/classdb"
	user="scott" password="1234"/>
<sql:query var="rs" dataSource="${conn}">
	select * from board where ${param.column} like ?
	<sql:param>%${param.find}%</sql:param>
</sql:query>
<table border="1" style="border-collapse:collapse;">
	<tr><th>번호</th><th>글쓴이</th><th>제목</th><th>내용</th>
	<th>등록일</th><th>조회수</th></tr>
	<c:forEach var="row" items="${rs.rows}">
	<tr><td>${row.num}</td><td>${row.name}</td><td>${row.subject}</td>
	<%--fn:escapeXml : 태그 < > 부분을 일반 문자열로 출력 --%>
	<c:set var="content" value="${fn:escapeXml(row.content)}"/>
	<td>${fn:substring(content,0,20)}
	<c:if test="${fn.length(content)>20}">...</c:if></td>
	<td>${row.regdate}</td><td>${row.readcnt}</td></tr>
	</c:forEach>
</table>