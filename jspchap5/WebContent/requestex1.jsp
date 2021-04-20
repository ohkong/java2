<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--  5/WebContent/requestex1.jsp  
	 String request.getParameter(파라미터이름) : 파라미터값을 한개 리턴
	 String[] request.getParameterValues(파라미터이름) : 파라미터값을 여러개 리턴
	 Enumeration request.getParameterNames() : 요청객체에 존재하는 파라미터이름을 모두 리턴ㄴ
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>전송된 파라미터값 출력하기</title>
</head>
<body>
<%
   //파라미터코드값을 EUC-KR로 인식. 한글파라미터 인코딩을 설정.
   // GET 방식에서는 사용안됨.
   request.setCharacterEncoding("EUC-KR");

   String name=request.getParameter("name");
   String age=request.getParameter("age");
   String gender=request.getParameter("gender");
   String hobby=request.getParameter("hobby");
   String year=request.getParameter("year");
%>
이름 : <%=name %><br>
나이 : <%=age %><br>
성별 : <%=gender.equals("1")?"남자":"여자" %><br>
취미 : <%=hobby %><br>
출생년도 : <%=year %><br>
<h3>모든 취미 정보 조회하기</h3>
취미 : 
<% 
//String[] request.getParameterValues(파라미터이름)
	String[] hobbies = request.getParameterValues("hobby");
	for(String h : hobbies){%>
	<%=h %>&nbsp;&nbsp;
	<%} %>
<h3>모든 파라미터 정보 조회하기</h3>
<table>
	<tr><td>파라미터이름</td><td>파라미터값</td></tr>
<%
//getParameterNames() : 모든파라미터의 이름들 리턴
//Enumeration : 반복자. Iterator 구버전.
	Enumeration e = request.getParameterNames();
	while(e.hasMoreElements()){
		String pname = (String)e.nextElement();
		String[] values = request.getParameterValues(pname);
%>
<tr><td><%=pname %></td>
<td><% for(String v : values){ %>
<%=v %>&nbsp;&nbsp;
	<% } %></td></tr>
<% } %>
</table>
</body>
</html>