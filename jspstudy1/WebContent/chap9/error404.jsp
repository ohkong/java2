<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContetn/chap9/error404.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��û������ ����</title>
</head>
<body>
<h1>��û�Ͻ� �������� �������� �ʽ��ϴ�.</h1>
<h2>URL �ּҰ� �ùٸ��� Ȯ���� �ּ���</h2>
<h3>��û�� URL : <%=request.getRequestURL() %></h3>
<h3>��û�� URI : <%=request.getRequestURI() %></h3>
</body>
</html>