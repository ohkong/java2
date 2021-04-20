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
   //업로드 위치 : 현재폴더/picture
   String path = application.getRealPath("") 
                + "model1/member/picture/";
   String fname = null;
   File f = new File(path);
   //path가 지정한 폴더가 없는 경우 폴더 생성
   if(!f.exists()) {   f.mkdirs();   }
   //업로드 파일 생성
   MultipartRequest multi = new MultipartRequest(request,path,10*1024*1024,"euc-kr");
	//업로드된 파일의 이름   
   fname = multi.getFilesystemName("picture");
	//new File(path + fname) : 업로드된 원본이미지 파일
	//bi : 메모리에 이미지 저장
   BufferedImage bi = ImageIO.read(new File(path + fname));
   int width = bi.getWidth()/3; 
   int height = bi.getHeight()/3; 
   //섬네일이미지를 그리기 위한 도화지.
   BufferedImage thumb = new BufferedImage
		   (width,height,BufferedImage.TYPE_INT_RGB);
   //g : 그리기 도구
   Graphics2D g = thumb.createGraphics();
   g.drawImage(bi,0,0,width,height,null);
   //f : 섬네일 이미지 저장을 위한 파일 설정
   f = new File(path + "sm_" +fname);
   ImageIO.write(thumb,"jpg",f); //thumb 이미지를 f 파일로 저장  
%>  
<script type="text/javascript">
   img = opener.document.getElementById("pic");
   img.src = "picture/<%=fname%>";
   //db 저장을 위한 파라미터 설정
   opener.document.f.picture.value= "<%=fname%>";
   self.close();
</script>