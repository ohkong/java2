<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContetn/chap9/error.jsp --%>
<%@ page isErrorPage="true"%> <%-- exception ��ü ����. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����������</title>
</head>
<body>
<h1>�Ķ���� name�� �Է����ּ���.</h1>
<h1>��� ���� �߻��� ����η� ��ȭ ���<br>
 ����� : ȫ�浿, ��ȭ:1234</h1>
<h2><%=exception.getMessage() %></h2>
<%// exception.printStackTrace(response.getWriter()); --%>
<%-- ���� �������� �뷮�� 500����Ʈ �̸��� ��� �Ϻ� ������������
	http ������������ �����. �׷��Ƿ� 500����Ʈ �̻��� �ǵ��� ������������ ������ �����ؾ��� --%>
</body>
</html>