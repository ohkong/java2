<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/info.jsp --%>
<%
	request.setCharacterEncoding("euc-kr");
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDao dao = new BoardDao();
	Board b = dao.selectOne(num);	//num�� �ش��ϴ� �Խù� ��ȸ
	dao.readcntAdd(num);	//��ȸ�� ����
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� �� ����</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
	<table>
		<caption>�Խù� �� ����</caption>
		<tr>
			<th width="20%">�۾���</th>
			<td width="80%" style="text-align:left"><%=b.getName()%></td>
		</tr>
		<tr>
			<th>����</th>
			<td style="text-align:left"><%=b.getSubject()%></td>
		</tr>
		<tr>
			<th>����</th>
			<td><table style="width:100%; height:250px;">
			<tr>
			<td style="border-width:0px; vertical-align: 
			top; text-align:left"><%=b.getContent()%></td></tr>
			</table></td>
		</tr>
		<tr>
			<th>÷������</th>
			<td><% if(b.getFile1()==null || b.getFile1().equals("")){ %>
			&nbsp;
			<%}else{ %>
			<a href="file/<%=b.getFile1()%>"><%=b.getFile1()%></a>
			<%} %></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href="replyForm.jsp?num=<%=b.getNum() %>">[�亯]</a> 
            	<a href="updateForm.jsp?num=<%=b.getNum() %>">[����]</a>
				<a href="deleteForm.jsp?num=<%=b.getNum() %>">[����]</a> 
				<a href="list.jsp">[���]</a></td>
		</tr>
	</table>
</body>
</html>