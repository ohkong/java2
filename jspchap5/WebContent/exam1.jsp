<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String kbn = request.getParameter("kbn");
int s = Integer.parseInt(request.getParameter("num"));
int sum =0;
for(int i = 1;i<=s;i++){
	switch(kbn){
	case "0" :sum+=i;break;
	case "2" :if(i%2==0)sum+=i;break;
	case "1" :if(i%2==1)sum+=i;break;
	}
}
%>
<%=s %>까지의 합계 : <%=(kbn.equals("0"))?"전체합계":kbn.equals("2")?"짝수합계":"홀수합계" %>
:<%=sum %>
</body>
</html>