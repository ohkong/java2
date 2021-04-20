<%@page import="java.awt.Graphics2D"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/picture.jsp--%>
<%
   //���ε� ��ġ : ��������/picture
   String path = application.getRealPath("") 
                + "model1/member/picture/";
   String fname = null;
   File f = new File(path);
   //path�� ������ ������ ���� ��� ���� ����
   if(!f.exists()) {   f.mkdirs();   }
   //���ε� ���� ����
   MultipartRequest multi = new MultipartRequest(request,path,10*1024*1024,"euc-kr");
	//���ε�� ������ �̸�   
   fname = multi.getFilesystemName("picture");
	//new File(path + fname) : ���ε�� �����̹��� ����
	//bi : �޸𸮿� �̹��� ����
   BufferedImage bi = ImageIO.read(new File(path + fname));
   int width = bi.getWidth()/3; 
   int height = bi.getHeight()/3; 
   //�������̹����� �׸��� ���� ��ȭ��.
   BufferedImage thumb = new BufferedImage
		   (width,height,BufferedImage.TYPE_INT_RGB);
   //g : �׸��� ����
   Graphics2D g = thumb.createGraphics();
   g.drawImage(bi,0,0,width,height,null);
   //f : ������ �̹��� ������ ���� ���� ����
   f = new File(path + "sm_" +fname);
   ImageIO.write(thumb,"jpg",f); //thumb �̹����� f ���Ϸ� ����  
%>  
<script type="text/javascript">
   img = opener.document.getElementById("pic");
   img.src = "picture/<%=fname%>";
   //db ������ ���� �Ķ���� ����
   opener.document.f.picture.value= "<%=fname%>";
   self.close();
</script>