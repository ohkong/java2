<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContetn/jdbc/jdbc2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>emp ���̺� �о� ȭ�鿡 ����ϱ�</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<%
	//����̹� ����
	Class.forName("org.mariadb.jdbc.Driver"); //Ŭ���� ���� �ε�
	//Connection ����
	Connection conn = DriverManager.getConnection
	("jdbc:mariadb://localhost:3306/classdb","scott","1234"); 
	//sql ���� ���� ��ü ����
	Statement stmt = conn.createStatement();
	//sql ���� ����
	ResultSet rs = stmt.executeQuery("select * from student");
	//ResultSetMetaData : ��ȸ�� ���ڵ��� ���� ����
	ResultSetMetaData rsmt = rs.getMetaData();
%>
<table><tr>
<%  //getColumnCount() : ��ȸ�� �÷��� ����
	//getColumnName(i) : ù��° ��ȸ�� �÷��� �̸�
	for(int i = 1;i<=rsmt.getColumnCount();i++){
%>
<th><%=rsmt.getColumnName(i) %></th>
<%} %></tr>
<%	while(rs.next()){ //�о�� ���ڵ� �Ѱ��� 
%>
<tr>
	<%
	//getString(1) : ù��° �÷��� �� 
	for(int i =1;i<=rsmt.getColumnCount();i++) {%>
	<td><%=rs.getString(i) %></td>
	<% } %>
</tr>
<% } %>
</table>
</body>
</html>