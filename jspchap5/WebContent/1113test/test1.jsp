<%@page import="javax.swing.border.MatteBorder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>계산</title>
</head>
<body>
<%
String kbn = request.getParameter("kbn");
double num1 = Double.parseDouble(request.getParameter("num1"));
double num2 = Double.parseDouble(request.getParameter("num2"));
double sum=0;
switch(kbn){
	case "+" : sum=num1+num2;break;
	case "-" : sum=num1-num2;break;
	case "*" : sum=num1*num2;break;
	case "/" : sum=num1/num2;break;
}
%>
<%=num1 %> <%=kbn %> <%=num2 %> = <%=Math.round(sum*100)/100.0 %>
</body>
</html>