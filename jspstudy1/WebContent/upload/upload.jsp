<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/upload/upload.jsp 
	enctype="multipar/form-data"�� actio �Ǿ����Ƿ�
	request ��ü�� ���� ����� �� ����.
	=> MultipartRequest ��ü�� �̿��Ͽ� ����.
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���ε� ���</title>
</head>
<body>
<%
	//application.getRealPath("/") : �����ø����̼� ���� ���
	//uploadPath : ��ó�ø����̼� ���� ���/upload/
	//				=> ������ ���ε� ������ ����Ǵ� ��ġ
	String uploadPath = application.getRealPath("/")+"upload/";
	int size = 10*1024*1024; //10M (10�ް�)
	File f = new File(uploadPath);
	if(!f.exists())f.mkdirs(); //������ ������ ��������.
	/*
	new MultipartRequest => ���Ͼ��ε� �ϼ�
		request : �Ķ��������, ��������, ���ϳ��� �����ϰ� �ִ� ��û��ü.
		uploasPath : ���ε�Ǵ� ���� ����
		size : ���ε�Ǵ� �ִ� ������ ũ��
		euc-kr : �Ķ���� ���ڵ� ����
	*/
	MultipartRequest multi = new MultipartRequest(request, uploadPath,size,"euc-kr");
	
	String name = multi.getParameter("name"); //name �Ķ���Ͱ�
	String title = multi.getParameter("title");	
	String fname = multi.getFilesystemName("file1"); //������ �̸�
%>
���ε� ��ġ : <%=uploadPath %><br>
�ø���� : <%=name %><br>
���� : <%=title %><br>
���� : <a href="<%=fname %>"><%=fname %></a><br>
</body>
</html>