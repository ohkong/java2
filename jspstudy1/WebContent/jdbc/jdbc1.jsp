<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContetn/jdbc/jdbc1.jsp 
	1. 사용되는 패키지 : java.sql 패키지에 속한 클래스
	2. 드라이버 설정하기 : Class.forName("드라이버클래스명")
	3. 연결객체 생성 : Connection conn = DriverManager.getConnection(..)
	4. dbms에 명령 전달 객체 생성
			Statement stmt = conn.createStatement();
	5. sql 구문 실행
		ResultSet rs = stmt.executeQuery("select ...")
		int cnt = stmt.executeUpdate("insert ...")
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JDBC 연결</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<%
	//드라이버 설정
	Class.forName("org.mariadb.jdbc.Driver"); //클래스 정보 로드
	//Connection 생성
	Connection conn = DriverManager.getConnection
	("jdbc:mariadb://localhost:3306/classdb","scott","1234"); 
	//sql 구문 전달 객체 생성
	Statement stmt = conn.createStatement();
	//sql 구문 실행
	ResultSet rs = stmt.executeQuery("select * from emp");
	while(rs.next()){ //읽어온 레코드 한개씩
%>
<%=rs.getString(1) %>,<%=rs.getString(1) %>,
<%=rs.getString(3) %>,<%=rs.getString(4) %><br>
<%} %>
</body>
</html>