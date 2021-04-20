<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--  4/WebContent/pagedirectiveex1.jsp  
	page 지시어 예제 : 속성을 이용하여 현재 페이지의 특징을 설정
	    <%@ page 속성1=속성값1  속성2=속성값2 ... %>
	    language="java" : 기본언어.
	    contentType : 반드시 기술해야 함. 
	    			  문서의 형식을 MIME타입으로 설정함.
		pageEncoding : 문자의 인고딩 방식을 설정.
		import : 사용되는 클래스의 패키지이름을 생략할 수 있도록 설정.
				 여러번 사용가능
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
</head>
<body>
<%
	Date today = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
현재 일시 : <%=sf.format(today) %>
</body>
</html>