<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/el/elEx2.jsp 
	EL(Expression Language, 표현언어) : 표현식을 대체 할 수 있는 언어
		${값} 으로 표현함
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>elEx1.jsp의 결과화면</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String tel = "010-1111-2222";
	pageContext.setAttribute("tel", tel);
	pageContext.setAttribute("test", "pageContext test 속성");
	request.setAttribute("test", "request test 속성");
	application.setAttribute("test", "application test 속성");
%>
<h3>JSP의 스크립트를 이용하여 파라미터와 속성값 출력</h3>
pageConext test 속성값 : <%=pageContext.getAttribute("test") %><br>
session test 속성값 : <%=session.getAttribute("test") %><br>
today 속성값 : <%=session.getAttribute("today") %><br>
name 파라미터값 : <%=request.getParameter("name") %><br>
tel 변수값 : <%=tel %><br>
tel 속성값 : <%=pageContext.getAttribute("tel") %><br>
noAttr 속성값 : <%=pageContext.getAttribute("noAttr") %><br><br>
noparam 파라미터값 : <%=request.getParameter("noparam") %><br>

<h3>JSP의 EL(표현)를 이용하여 파라미터와 속성값 출력</h3>
test 속성값 : ${test}<br>
session test 속성값 : ${sessionScope.test}<br>
today 속성값 : ${today}<br>
name 파라미터값 : ${param.name}<br>
tel 변수값 : EL로 표현 못함. <%=tel %><br>
tel 속성값 : ${tel}<br>
noAttr 속성값 : ${noAttr}<br>
noparam 파라미터값 : ${param.noparam}<br>
<br>
<h3>영역을 설정하여 test 속성값을 출력하기</h3>
\${test}=${test}<br>
\${pageScope.test}=${pageScope.test}<br>
\${requestScope.test}=${requestScope.test}<br>
\${sessionScope.test}=${sessionScope.test}<br>
\${applicationScope.test}=${applicationScope.test}<br>
\${tel}=${tel}<br>
\${requestScope.tel}=${requestScope.tel}<br>
\${today}=${today}<br>
\${sessionScope.today}=${sessionScope.today}<br>
<%--
	${test} : 영역담당 객체에 저장된 속성 중 이름이 test인 속성값을 리턴
		1. pageContext 객체에 저장된 속성 중 이름이 test 속성의 값을 리턴.
		2. 1번이 없는 경우 
			request 객체에 저장된 속성 중 이름이 test 속성인 값을 리턴
		3. 1,2번이 없는 경우 
			session 객체에 저장된 속성 중 이름이 test 속성인 값을 리턴
		4. 1,2,3번이 없는 경우 
			application 객체에 저장된 속성 중 이름이 test 속성인 값을 리턴
		5. 1,2,3,4 번이 없는 경우
			null이 아니고 아무것도 출력되지 않는다.
	--직접 영역 담당 객체에 저장된 속성을 지정하여 출력하기
		pageContext 객체의 속성중 이름이 test인 속성의 값 : ${pageScope.test}
		request 객체의 속성중 이름이 test인 속성의 값 : ${requestScope.test}
		session 객체의 속성중 이름이 test인 속성의 값 : ${sessionScope.test}
		application 객체의 속성중 이름이 test인 속성의 값 : ${applicationScope.test}
 --%>
</body>
</html>