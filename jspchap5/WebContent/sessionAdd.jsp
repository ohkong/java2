<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--  5/WebContent/sessionAdd.jsp  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ٱ��� �߰�</title>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	String product = request.getParameter("product");
	List<String> cart = (List<String>)session.getAttribute("cart");
	if(cart==null){
		cart = new ArrayList<String>();
		session.setAttribute("cart",cart);
	}
	cart.add(product);
%>
<script>
	alert("<%=product%>��(��) ��ٱ��Ͽ� �߰��Ǿ����ϴ�.")
	history.go(-1);
</script>
</body>
</html>