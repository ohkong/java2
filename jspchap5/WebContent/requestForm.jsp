<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%--  5/WebContent/requestForm.jsp  
   �Ķ���� �̸� : <input type="..." name="�Ķ�����̸�">
 	String request.getParameter("�Ķ�����̸�")
 	 : �Ķ������ ���� �Ѱ� ����
 	 
 	 //���ڵ� ��� ����
 	 request.setCharacterEncoding("���ڵ���") : ������ ���ڵ��� ���
 	 		POST ��Ŀ��� ����. ��û��ü ������ �Ķ������ ������ ���ڵ��ϵ��ϼ���
 	 		�Ķ���� ��ȸ���� ȣ���ؾ���.
 	 GET ��� : ��Ĺ�� ��� server.xml�� 8080��Ʈ �����κп� 
 	 		   URIEncoding="���ڵ���" �߰��ؾ���.
  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>request ��ü ����</title>
</head>
<body>
<h2>request ���� ��ü : Ŭ���̾�Ʈ�� ��û ������ �����ϴ� ��ü</h2>
<form action="requestex1.jsp" method="get">
�̸� : <input type="text" name="name"><br>
���� : <input type="text" name="age"><br>
���� : <input type="radio" name="gender" value="1">��
	   <input type="radio" name="gender" value="2">��<br>
��� : <input type="checkbox" name="hobby" value="�丮">�丮
	 <input type="checkbox" name="hobby" value="����">����
	 <input type="checkbox" name="hobby" value="�߱�">�߱�
	 <input type="checkbox" name="hobby" value="�౸">�౸
	 <input type="checkbox" name="hobby" value="����">����<br>
����⵵ : <select name="year">
<% for(int i=1990;i<2001;i++) {%>
<option><%=i %></option>
<% } %></select>
<input type="submit" value="����">
</form>
</body>
</html>