<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/update.jsp 
	
	1. 모든 파라미터 정보를 Member 객체에 저장 => useBean 태그
	2. 입력된 비밀번호와, db에 저장된 비밀번호 비교
		관리자인 경우 관리자 비밀번호로 비교하기
		- 같지 않은 경우 : "비밀번호 오류" 메세지 출력 updateForm.jsp 페이지 이동
	3. 파라미터를 저장하고 있는 Member 객체를 이용하여 db 정보 수정.
		int MemberDao.update(Member)
	 결과가 0이하면 수정실패 메세지 출력후, updateForm.jsp 페이지 이동
	 	  1이상이면 수정 성공    info.jsp페이지 이동
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>update</title>
<link rel="stylesheet" href="../../css/main.css">
<%request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="mem" class="model.Member"/>
<jsp:setProperty property="*" name="mem"/>
<%  MemberDao dao = new MemberDao();
	String login =(String)session.getAttribute("login");
	Member dbmem = null;
	if(login.equals("admin")){ //관리자 로그인
		dbmem=dao.selectOne(login);
	} else {		//일반사용자 로그인
		dbmem=dao.selectOne(mem.getId());
	}
	String msg = "비밀번호가 틀렸습니다.";
	String url = "updateForm.jsp?id="+mem.getId();
	if(mem.getPass().equals(dbmem.getPass())){
			int result = dao.update(mem);	// 입력된 내용을 db에 수정
			if(result>0){
				msg="수정 성공";
				url="info.jsp?id="+mem.getId();
			} else {
				msg = "수정실패";
			}
	}
%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
</head>
<body>

</body>
</html>