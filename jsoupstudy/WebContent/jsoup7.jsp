<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.IOError"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/jsoup7.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSON ������ ��������</title>
<style type="text/css">
	table,td,th{border : 2px solid grey;
				border-collapse : collapse;
				text-align : center;}
</style>
</head>
<body>
<%
	String url = "http://fx.kebhana.com/FER1101M.web";
	String line = "";
	String title = "";
	try{
		//�ҽ� ��ü
		String kebhana = Jsoup.connect(url).get().text();	
		System.out.println(kebhana);
		String strJson = kebhana.substring(kebhana.indexOf("{"));	
		JSONParser jsonParser = new JSONParser();
		JSONObject json = (JSONObject)jsonParser.parse(strJson.trim());
		JSONArray array = (JSONArray)json.get("����Ʈ");
		String html = "<table><caption>"+json.get("��¥").toString()+"���� ȯ��</caption>";
		html += "<tr><th>��ȭ��</th><th>�Ÿű�����</th><th>�����ĽǶ�</th>"
				+"<th>������Ƕ�</th><th>����ȯ�����Ƕ�</th><th>����ȯ�����Ƕ�</th></tr>";
				
		for(int i = 0; i < array.size(); i++){
			JSONObject obj = (JSONObject)array.get(i);
			String str = obj.get("��ȭ��").toString();
			html += "<tr><td>"+obj.get("��ȭ��").toString() + "</td>";
			html += "<td>"+obj.get("�Ÿű�����").toString() + "</td>";
			html += "<td>"+obj.get("�����ĽǶ�").toString() + "</td>";
			html += "<td>"+obj.get("������Ƕ�").toString() + "</td>";
			html += "<td>"+obj.get("�۱�_����ȯ�����Ƕ�").toString() + "</td>";
			html += "<td>"+obj.get("�۱�_����ȯ�����Ƕ�").toString() + "</td></tr>";
		}
		out.println(html + "</table>");
	}catch(IOException e){
		e.printStackTrace();
	}
%>
</body>
</html>