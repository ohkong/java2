<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/upload/upload.jsp 
	enctype="multipar/form-data"로 actio 되었으므로
	request 객체를 직접 사용할 수 없다.
	=> MultipartRequest 객체를 이용하여 사용됨.
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>파일 업로드 결과</title>
</head>
<body>
<%
	//application.getRealPath("/") : 웹어플리케이션 폴더 경로
	//uploadPath : 웹처플리케이션 폴더 경로/upload/
	//				=> 서버의 업로드 파일이 저장되는 위치
	String uploadPath = application.getRealPath("/")+"upload/";
	int size = 10*1024*1024; //10M (10메가)
	File f = new File(uploadPath);
	if(!f.exists())f.mkdirs(); //폴더가 없으면 폴더생성.
	/*
	new MultipartRequest => 파일업로드 완성
		request : 파라미터정보, 파일정보, 파일내용 저장하고 있는 요청객체.
		uploasPath : 업로드되는 폴더 정보
		size : 업로드되는 최대 파일의 크기
		euc-kr : 파라미터 인코딩 설정
	*/
	MultipartRequest multi = new MultipartRequest(request, uploadPath,size,"euc-kr");
	
	String name = multi.getParameter("name"); //name 파라미터값
	String title = multi.getParameter("title");	
	String fname = multi.getFilesystemName("file1"); //파일의 이름
%>
업로드 위치 : <%=uploadPath %><br>
올린사람 : <%=name %><br>
제목 : <%=title %><br>
파일 : <a href="<%=fname %>"><%=fname %></a><br>
</body>
</html>