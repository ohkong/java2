<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContetn/jdbc/jdbc1.jsp 
	1. ���Ǵ� ��Ű�� : java.sql ��Ű���� ���� Ŭ����
	2. ����̹� �����ϱ� : Class.forName("����̹�Ŭ������")
	3. ���ᰴü ���� : Connection conn = DriverManager.getConnection(..)
	4. dbms�� ��� ���� ��ü ����
			Statement stmt = conn.createStatement();
	5. sql ���� ����
		ResultSet rs = stmt.executeQuery("select ...")
		int cnt = stmt.executeUpdate("insert ...")
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JDBC ����</title>
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
	ResultSet rs = stmt.executeQuery("select * from emp");
	while(rs.next()){ //�о�� ���ڵ� �Ѱ���
%>
<%=rs.getString(1) %>,<%=rs.getString(1) %>,
<%=rs.getString(3) %>,<%=rs.getString(4) %><br>
<%} %>
</body>
</html>