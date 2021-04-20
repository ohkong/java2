<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/20201218/ajax2-2.jsp --%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri ="http://java.sun.com/jsp/jstl/sql" %>
<fmt:requestEncoding value="UTF-8"/>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
	url="jdbc:mariadb://localhost:3307/classdb"
	user="scott" password="1234"/>
<sql:query var="rs" dataSource="${conn}">
	select * from member where id = ?
	<sql:param>${param.id}</sql:param>
</sql:query>
<c:if test="${!empty rs.rows}"><%--아이디가 일치하는 경우 --%>
	<h1 class="find">아이디가 존재합니다</h1>
</c:if>
<c:if test="${empty rs.rows}"><%--아이디가 일치하지 않는 경우 --%>
	<h1 class="notfound">사용가능한 아이디 입니다.</h1>
</c:if>