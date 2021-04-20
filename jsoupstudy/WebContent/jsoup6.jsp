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
<title>JSON 데이터 가져오기</title>
</head>
<body>
<%
	String url = "http://fx.kebhana.com/FER1101M.web";
	String line = "";
	String title = "";
	try{
		//소스 전체
		String kebhana = Jsoup.connect(url).get().text();	//전체 소스 리턴
		System.out.println(kebhana);
		String strJson = kebhana.substring(kebhana.indexOf("{"));	//순수 json 형태
		JSONParser jsonParser = new JSONParser();
		JSONObject json = (JSONObject)jsonParser.parse(strJson.trim());	//json 형태의 파일을 파싱
		out.println("환율기준일:"+json.get("날짜").toString()+"<br>");
		JSONArray array = (JSONArray)json.get("리스트");
		for(int i = 0; i < array.size(); i++){
			JSONObject obj = (JSONObject)array.get(i);
			String str = obj.get("통화명").toString();
			out.println(str + "&nbsp;&nbsp; : &nbsp;&nbsp;");
			out.println(obj.get("매매기준율").toString()+"<br>");
		}
	}catch(IOException e){
		e.printStackTrace();
	}
%>
</body>
</html>