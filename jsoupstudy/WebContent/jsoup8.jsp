<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/jsoup8.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>공공 데이터 가져오기</title>
<style type="text/css">
	table,td,th{
		border:2px solid grey;
		border-collapse:collapse;
		text-align:center;
	}
</style>
</head>
<body>
<%
	String apiurl = "http://openapi.airport.kr/openapi/service/StatusOfPassengerFlights/getPassengerArrivals?serviceKey=N3Ri4GA%2BDRt1ZjEOEEgV7Q6MTNMrbXJxxFJXDbB2nHOpvX0bagIkjCNc3Zqu7RsvB%2BjtzCkvectYkisXkeMSDw%3D%3D";
	String line="";
	String str = "";
	
	URL url = new URL(apiurl);
	HttpURLConnection conn = (HttpURLConnection)url.openConnection();
	conn.setRequestProperty("Accept", "application/xml");
	BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
	while((str = br.readLine()) != null){
		line += str;
	}
	//line : api 서버가 전달해준 내용 저장하는 문자열 객체
	Document doc = null;
	String html = "<table><tr><th>출발공항</th><th>항공사</th><th>비행기</th>"
				+"<th>예정시간</th><th>변경시간</th><th>정보</th></tr>";
	try{
		doc = Jsoup.parse(line);	//xml 데이터를 파싱하여 DOM 객체로 리턴
		int cnt = 0;
		Elements e1 = doc.select("item");
		for(Element ele : e1){
			html += "<tr><td>"+ele.select("airport").get(0).text()+"</td>";
			html += "<td>"+ele.select("airline").get(0).text()+"</td>";
			html += "<td>"+ele.select("flightid").get(0).text()+"</td>";
			html += "<td>"+ele.select("scheduledatetime").get(0).text()+"</td>";
			html += "<td>"+ele.select("estimateddatetime").get(0).text()+"</td>";
			try{
				html += "<td>"+ele.select("remark").get(0).text()+"&nbsp;</td></tr>";
			}catch(IndexOutOfBoundsException e){
				html +="<td>&nbsp;</td></tr>";
			}
		}
		html += "</table>";
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<%=html %>
</body>
</html>