<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--   4/WebContent/commentex1.jsp   --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSP 에서 사용되는 주석</title>
<%
	String msg = "jsp 주석 예제 입니다.";
%>
</head>
<body>
<h1>jsp 페이지에서 사용되는 주석</h1>
<ol>
<li>jsp 주석 : &lt;%-- jsp 주석표현 --&gt;</li>
<%-- jsp 주석입니다. : jsp 페이지에서만 보여집니다.
	서블릿 변환시 제외되는 부분입니다. 변환된 서블릿에서는 볼수 없습니다.
 --%>
 <li>Java 주석 : &lt;% // java 주석표현 %&gt;</li>
 <%
 	//자바 한줄 주석입니다.
 	/*자바 여러줄 주석입니다. 자바주석은 서블릿이 컴파일될때 주석이므로 
 	서블릿페이지에서 볼수 있습니다.*/
 %>
 <li>HTML 주석 : &lt;!-- // HTML 주석표현 --&gt;</li>
 <!-- html 주석입니다. jsp 페이지나, 서블릿에서는 주석이 아닙니다.
 브라우저의 소스보기에서 볼수 있습니다.
 브라우저가 실행시 주석으로 인식합니다. <%=msg %>
  -->
</ol>
</body>
</html>