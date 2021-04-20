<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%--  5/WebContent/requestForm.jsp  
   파라미터 이름 : <input type="..." name="파라미터이름">
 	String request.getParameter("파라미터이름")
 	 : 파라미터의 값을 한개 리턴
 	 
 	 //인코딩 방식 설정
 	 request.setCharacterEncoding("인코딩명") : 지정된 인코딩명만 사용
 	 		POST 방식에서 가능. 요청객체 내부의 파라미터의 값들을 인코딩하도록설정
 	 		파라미터 조회전에 호출해야함.
 	 GET 방식 : 톰캣인 경우 server.xml에 8080포트 설정부분에 
 	 		   URIEncoding="인코딩명" 추가해야함.
  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>request 객체 예제</title>
</head>
<body>
<h2>request 내장 객체 : 클라이언트의 요청 정보를 저장하는 객체</h2>
<form action="requestex1.jsp" method="get">
이름 : <input type="text" name="name"><br>
나이 : <input type="text" name="age"><br>
성별 : <input type="radio" name="gender" value="1">남
	   <input type="radio" name="gender" value="2">여<br>
취미 : <input type="checkbox" name="hobby" value="요리">요리
	 <input type="checkbox" name="hobby" value="여행">여행
	 <input type="checkbox" name="hobby" value="야구">야구
	 <input type="checkbox" name="hobby" value="축구">축구
	 <input type="checkbox" name="hobby" value="독서">독서<br>
출생년도 : <select name="year">
<% for(int i=1990;i<2001;i++) {%>
<option><%=i %></option>
<% } %></select>
<input type="submit" value="전송">
</form>
</body>
</html>