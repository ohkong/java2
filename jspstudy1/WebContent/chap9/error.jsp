<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContetn/chap9/error.jsp --%>
<%@ page isErrorPage="true"%> <%-- exception 객체 전달. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>오류페이지</title>
</head>
<body>
<h1>파라미터 name을 입력해주세요.</h1>
<h1>계속 오류 발생시 전산부로 전화 요망<br>
 담당자 : 홍길동, 전화:1234</h1>
<h2><%=exception.getMessage() %></h2>
<%// exception.printStackTrace(response.getWriter()); --%>
<%-- 오류 페이지의 용량이 500바이트 미만인 경우 일부 브라우저에서는
	http 오류페이지를 출력함. 그러므로 500바이트 이상이 되도록 오류페이지의 내용을 생성해야함 --%>
</body>
</html>