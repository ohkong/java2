<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--  4/WebContent/pagedirectiveex1.jsp  
	page ���þ� ���� : �Ӽ��� �̿��Ͽ� ���� �������� Ư¡�� ����
	    <%@ page �Ӽ�1=�Ӽ���1  �Ӽ�2=�Ӽ���2 ... %>
	    language="java" : �⺻���.
	    contentType : �ݵ�� ����ؾ� ��. 
	    			  ������ ������ MIMEŸ������ ������.
		pageEncoding : ������ �ΰ�� ����� ����.
		import : ���Ǵ� Ŭ������ ��Ű���̸��� ������ �� �ֵ��� ����.
				 ������ ��밡��
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
���� �Ͻ� : <%=sf.format(today) %>
</body>
</html>