<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--  5/WebContent/requestex1.jsp  
	 String request.getParameter(�Ķ�����̸�) : �Ķ���Ͱ��� �Ѱ� ����
	 String[] request.getParameterValues(�Ķ�����̸�) : �Ķ���Ͱ��� ������ ����
	 Enumeration request.getParameterNames() : ��û��ü�� �����ϴ� �Ķ�����̸��� ��� ���Ϥ�
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���۵� �Ķ���Ͱ� ����ϱ�</title>
</head>
<body>
<%
   //�Ķ�����ڵ尪�� EUC-KR�� �ν�. �ѱ��Ķ���� ���ڵ��� ����.
   // GET ��Ŀ����� ���ȵ�.
   request.setCharacterEncoding("EUC-KR");

   String name=request.getParameter("name");
   String age=request.getParameter("age");
   String gender=request.getParameter("gender");
   String hobby=request.getParameter("hobby");
   String year=request.getParameter("year");
%>
�̸� : <%=name %><br>
���� : <%=age %><br>
���� : <%=gender.equals("1")?"����":"����" %><br>
��� : <%=hobby %><br>
����⵵ : <%=year %><br>
<h3>��� ��� ���� ��ȸ�ϱ�</h3>
��� : 
<% 
//String[] request.getParameterValues(�Ķ�����̸�)
	String[] hobbies = request.getParameterValues("hobby");
	for(String h : hobbies){%>
	<%=h %>&nbsp;&nbsp;
	<%} %>
<h3>��� �Ķ���� ���� ��ȸ�ϱ�</h3>
<table>
	<tr><td>�Ķ�����̸�</td><td>�Ķ���Ͱ�</td></tr>
<%
//getParameterNames() : ����Ķ������ �̸��� ����
//Enumeration : �ݺ���. Iterator ������.
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