<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContetn/chap7/book.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���뺸��</title>
<link rel="stylesheet" href="../css/main.css">
<% request.setCharacterEncoding("euc-kr"); %>
<%--
	Book book = new chap7.Book();
	request.setAttribute("book",book);
	scope �Ӽ��� ���� �� ��� : page ������
	pageContext.setAttribute("book",book);
 --%>
<jsp:useBean id="book" class="chap7.Book" scope="request"/>
<%--
	property="*" : �Ķ���� �̸��� ������Ƽ �̸��� ���� ���� book ��ü�� ������.
	book.setName(request.getParameter("name"))
	book.setTitle(request.getParameter("title"))
	book.setContent(request.getParameter("content"))
 --%>
<jsp:setProperty property="*" name="book"/>
<%-- �Ķ���Ϳ� ������Ƽ�� �ٸ���� 
	book.setName(request.getParameter("writer"))
--%>
<jsp:setProperty property="name" param="writer" name="book"/>
</head>
<body>
<table><caption>���� ��ȸ</caption>
	<tr><td>�ۼ���</td>
		<td><jsp:getProperty name="book" property="name" />
		,<%=book.getName() %></td></tr>
	<tr><td>����</td>
		<td><jsp:getProperty name="book" property="title" />
		,<%=book.getTitle() %></td></tr>
	<tr><td>����</td>
		<td><jsp:getProperty name="book" property="content" />
		,<%=book.getContent() %></td></tr>
</table>
</body>
</html>