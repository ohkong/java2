<%@page import="ojhgdsingle.MainDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>password찾기</title>
</head>
<body>
	<table>
		<tr>
			<th>비밀번호</th>
			<td>**${fn:substring(pass,2,pass.length())}</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="닫기"
				onclick="self.close()"></td>
		</tr>
	</table>
</body>
</html>
