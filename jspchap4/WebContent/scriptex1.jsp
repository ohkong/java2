<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  <%--  4/WebContent/scriptex1.jsp   --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>스크립트 예제</title>
</head>
<body>
<% //스크립스팃(Scriptlet) : 메서드 선언 불가
	System.out.println("스크립트 예제");
	String msg = "스크립트 예제";
	for(int i=1;i<=10;i++){
%>
<%-- 표현식 : 화면(브라우저)에 값을 출력
	1. 값이 존재해야함 : 변수, 수식, 리턴값이 있는 함수
	2. ; 종료안함.
	3. 한줄 주석 불가능함
 --%>
<%=i +":" + this.msg + page.getClass() /*표현식*/ %><br>
<%-- <%= /* System.out.println() */ %> --%>  <%-- 값이 필요함. void인 메서드는 안됨 --%>
<% } %>
<%! //선언문 : 멤버로 생성됨ㄴ
	String msg = "선언문으로 선언한 msg 변수"; //멤버벼수
	String getMsg() {					 //멤버메서드
		return msg;
	}
%>
</body>
</html>