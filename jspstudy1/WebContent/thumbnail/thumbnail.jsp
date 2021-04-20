<%@page import="java.awt.Graphics2D"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/thumbnail/thumbnail.jsp  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����̹����� ����� �̹��� ����</title>
</head>
<body>
<%
	//�̹��� ���� ���ε� ��ġ ����
	String path = application.getRealPath("/") + "thumbnail/";
	int size = 10*1024*1024; //�ִ� ���ε� ũ��
	//���ε� ����
	MultipartRequest multi = new MultipartRequest(request,path,size,"EUC-KR");
	//fname : <input type="file" name="picture"> ������ ������ �̸�
	// 		  ���ε�� ������ �̸�
	String fname = multi.getFilesystemName("picture");
	// new File(path+fname) :���ε�� ������ ���� ���
	// bi : �̹��� ������ �о �޸𸮿� �ε� => �����̹���
	BufferedImage bi = ImageIO.read(new File(path+fname));
	int width = bi.getWidth()/5;	//�����̹��� ����ũ���� 5����1
	int height = bi.getHeight()/5;	//�����̹��� ����ũ���� 5����1
	//thumb : �����̹���ũ���� 5����1 ũ���� ��ȭ��(�̹�������) ����.
	BufferedImage thumb = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
	//g : �׸��� ����
	Graphics2D g = thumb.createGraphics();
	//g.drawImage : �̹��� �׸���
	g.drawImage(bi,0,0,width,height,null);
	File f = new File(path + "sm_" + fname);
	ImageIO.write(thumb,"jpg",f);
%>
<h3>�����̹���</h3><img src="<%=fname %>"><p>
<h3>������̹���</h3><img src="sm_<%=fname %>"><p>
</body>
</html>