<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ select ���� ���� ���</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<%
		String sql = request.getParameter("sql");
	%>
	<form action="test1116.jsp" method="post">
		<textarea rows="5" cols="60" name="sql"></textarea>
		<input type="submit" value="����">
	</form>
	<%
		if (sql != null) {
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/classdb", "scott", "1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		ResultSetMetaData rsmt = rs.getMetaData();
		int count = 0;
		int ccnt = 0;
		while (rs.next()) {
			for (int i = 1; i <= rsmt.getColumnCount(); i++) {
		ccnt++;
			}
			count++;
		}
		rs = stmt.executeQuery(sql);
		rsmt = rs.getMetaData();
	%>
	<table>
		<tr>
			<td colspan=<%=ccnt%> style="text-align: right">��ȸ�� ���ڵ� ���� : <%=count%></td></tr>
		<tr>
			<% for (int i = 1; i <= rsmt.getColumnCount(); i++) { %>
			<th><%=rsmt.getColumnName(i)%></th>
			<% } %></tr>
		<% while (rs.next()) {	%>
		<tr>
			<% for (int i = 1; i <= rsmt.getColumnCount(); i++) { %>
			<td><%=rs.getString(i) %></td>
			<% } %></tr>
		<% } %>
	</table>
	<% } %>
</body>
</html>