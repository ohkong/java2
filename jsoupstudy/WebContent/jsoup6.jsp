<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.IOError"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/jsoup6.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSON ������ ��������</title>
</head>
<body>
<%
	String url = "http://fx.kebhana.com/FER1101M.web";
	String line = "";
	String title = "";
	try{
		//�ҽ� ��ü
		String kebhana = Jsoup.connect(url).get().text();	//��ü �ҽ� ����
		System.out.println(kebhana);
		String strJson = kebhana.substring(kebhana.indexOf("{"));	//���� json ����
		JSONParser jsonParser = new JSONParser();
		JSONObject json = (JSONObject)jsonParser.parse(strJson.trim());	//json ������ ������ �Ľ�
		out.println("ȯ��������:"+json.get("��¥").toString()+"<br>");
		JSONArray array = (JSONArray)json.get("����Ʈ");
		for(int i = 0; i < array.size(); i++){
			JSONObject obj = (JSONObject)array.get(i);
			String str = obj.get("��ȭ��").toString();
			out.println(str + "&nbsp;&nbsp; : &nbsp;&nbsp;");
			out.println(obj.get("�Ÿű�����").toString()+"<br>");
		}
	}catch(IOException e){
		e.printStackTrace();
	}
%>
</body>
</html>