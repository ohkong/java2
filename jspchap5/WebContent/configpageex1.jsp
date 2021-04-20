<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%--  5/WebContent/configpageex1.jsp  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>config, page 객체</title>
</head>
<body>
<h3>config 객체는 서블릿의 환경변수값을 설정하기 위한 객체</h3>
<% 
	Enumeration e = config.getInitParameterNames();
	while(e.hasMoreElements()){
		String s = (String)e.nextElement();
		out.println(s+"="+config.getInitParameter(s)+"<br>");
	}
%>
<hr>
<%
	if(page==this){
		out.println("page 객체와 this 객체는 같은 객체임");
	}
%>
</body>
</html>