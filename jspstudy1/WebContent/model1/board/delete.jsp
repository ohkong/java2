<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/delete.jsp --%>
<%
	request.setCharacterEncoding("euc-kr");
int num = Integer.parseInt(request.getParameter("num"));
String pass = request.getParameter("pass");
String msg = "게시글의 비밀번호가 틀렸습니다.";
String url = "deleteForm.jsp?num=" + num;
BoardDao dao = new BoardDao();
Board board = dao.selectOne(num);
if (board == null) {
	msg = "없는게시글입니다.";
	url = "list.jsp";
}else {
	//pass : 입력된 비밀번호
	//board.getpass() : db에 등록된 비밀번호
	if (pass.equals(board.getPass())) {
		if (dao.delete(num)) {
			msg = "게시글 삭제 성공";
			url = "list.jsp";
		} else {
			msg = "게시글 삭제 실패";
			url = "info.jsp?num=" + num;
		}
	}
}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>