<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%--  5/WebContent/configpageex1.jsp  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>config, page ��ü</title>
</head>
<body>
<h3>config ��ü�� ������ ȯ�溯������ �����ϱ� ���� ��ü</h3>
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
		out.println("page ��ü�� this ��ü�� ���� ��ü��");
	}
%>
</body>
</html>