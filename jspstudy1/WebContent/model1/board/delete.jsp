<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/delete.jsp --%>
<%
	request.setCharacterEncoding("euc-kr");
int num = Integer.parseInt(request.getParameter("num"));
String pass = request.getParameter("pass");
String msg = "�Խñ��� ��й�ȣ�� Ʋ�Ƚ��ϴ�.";
String url = "deleteForm.jsp?num=" + num;
BoardDao dao = new BoardDao();
Board board = dao.selectOne(num);
if (board == null) {
	msg = "���°Խñ��Դϴ�.";
	url = "list.jsp";
}else {
	//pass : �Էµ� ��й�ȣ
	//board.getpass() : db�� ��ϵ� ��й�ȣ
	if (pass.equals(board.getPass())) {
		if (dao.delete(num)) {
			msg = "�Խñ� ���� ����";
			url = "list.jsp";
		} else {
			msg = "�Խñ� ���� ����";
			url = "info.jsp?num=" + num;
		}
	}
}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>