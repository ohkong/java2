<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/model2/member/password.jsp --%>
<script>
	alert("${msg}");
	<c:if test="${opener}">
		opener.location.href="${url}";
	</c:if>
	<c:if test="${!opener}">
		location.href="${url}";
	</c:if>
	<c:if test="${closer}">
		self.close();
	</c:if>
</script>
