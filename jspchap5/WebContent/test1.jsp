<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>1112test1</title>

</head>
<body>
<%
	int s = Integer.parseInt(request.getParameter("num"));
	int alls =0;
	int evens=0;
	int odds=0;
	for(int i = 0;i<=s;i++){
		alls+=i;
		if(i%2==0)evens+=i;
		else odds+=i;
	}
	
%>

<%=s %>������ �� : <%=alls %><br>
<%=s %>������ ¦���� : <%=evens %><br>
<%=s %>������ Ȧ���� : <%=odds %><br>
</body>
</html>