<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  <%--  4/WebContent/scriptex1.jsp   --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ũ��Ʈ ����</title>
</head>
<body>
<% //��ũ������(Scriptlet) : �޼��� ���� �Ұ�
	System.out.println("��ũ��Ʈ ����");
	String msg = "��ũ��Ʈ ����";
	for(int i=1;i<=10;i++){
%>
<%-- ǥ���� : ȭ��(������)�� ���� ���
	1. ���� �����ؾ��� : ����, ����, ���ϰ��� �ִ� �Լ�
	2. ; �������.
	3. ���� �ּ� �Ұ�����
 --%>
<%=i +":" + this.msg + page.getClass() /*ǥ����*/ %><br>
<%-- <%= /* System.out.println() */ %> --%>  <%-- ���� �ʿ���. void�� �޼���� �ȵ� --%>
<% } %>
<%! //���� : ����� �����ʤ�
	String msg = "�������� ������ msg ����"; //�������
	String getMsg() {					 //����޼���
		return msg;
	}
%>
</body>
</html>