<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/jsoup3.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�λ꺣� ���� ���� ��������</title>
</head>
<body>
<%
	String url = "https://www.doosanbears.com/players/batters/20";
	String line = "";
	String title = "";
	try{
		Document doc = Jsoup.connect(url).get();
		Elements div = doc.select(".tableBWrite1");
		for(Element src : div){
			out.println(src.toString());
			System.out.println(src.toString());
		}
	}catch(IOException e){
		e.printStackTrace();
	}
%>
</body>
</html>