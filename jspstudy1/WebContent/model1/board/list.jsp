<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Board"%>
<%@page import="java.util.List"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/list.jsp 
	1. ���������� 10���� �Խù��� ����ϱ�.
		pageNum	�Ķ���Ͱ��� ���� => ���� ���� 1�� �����ϱ�.
	2. �ֱ� ��ϵ� �Խù��� ���� ���� ��ġ��.
	3. db���� �ش� �������� ��µ� ������ ��ȸ�Ͽ� ȭ�鿡 ���.
	     �Խù��� ��ºκ�.
	     ������ ���� ��� ����
	
	20201123 ����
		1. ÷�������� �ִ� ��� @ ǥ���ϱ�
		2. ���� ��ϵ� �Խù��� ��:��:�ʷ� ����ϰ�,
		   ���� ��ϵ� �Խù��� �ƴ� ���� ��-��-�� ��:�� ���� ����ϱ�
		3. ����� ��� �������. ������6 ��
		4. �信���� ��ȸ��ȣ�� ��µǵ��� �����ϱ�
--%>
<%
	int pageNum =1;
	try{
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}catch(NumberFormatException e){}
	int limit =10;	//�������� ����� �Խù��� �Ǽ�
	BoardDao dao = new BoardDao();
	int boardcount = dao.boardCount(); //��ü �Խù� ��� �Ǽ� ����
	//pageNum�� ��µ� �Խù� 10���� List ��ü�� ����
	List<Board> list = dao.list(pageNum,limit);
	//���������
	/*maxpage : ��ü �ʿ��� ������ ����. ������������
		�Խù� �Ǽ�   ������
			11�� :  2
				11.0/10 =1.1 + 0.95 => (int)(2.05) => 2
			30�� :  3
				30.0/10 =3.0 + 0.95 => (int)(3.95) => 3
	*/
	int maxpage = (int)((double)boardcount/limit + 0.95);
	/*
		endpage : ȭ�鿡 ��µ� ������ ������ ��ȣ
		���������� : ������������
			1   :  10
			11  :  20
	*/
	int startpage = ((int)(pageNum/10.0 + 0.9)-1)*10 + 1;
	int endpage = startpage + 9;
	if(endpage>maxpage) endpage = maxpage;
	
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sf.format(new Date());
	SimpleDateFormat todayf = new SimpleDateFormat("HH:mm:ss");
	SimpleDateFormat otherf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	int boardnum = boardcount -(pageNum-1)*limit;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� ��� ����</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table><caption>�Խ��� ���</caption>
<%if(boardcount==0) {%>
<tr><td colspan="5">��ϵ� �Խñ��� �����ϴ�.</td></tr>
<% } else { %>
<tr><td colspan="5" style="text-align:right">�۰���:<%=boardcount %></td></tr>
<tr><th width="8%">��ȣ</th><th width="50%">����</th>
	<th width="14%">�ۼ���</th><th width="17%">�����</th>
	<th width="11%">��ȸ��</th></tr>
<% for(Board b : list){ %>
<tr><td><%=boardnum-- %></td>
	<td style="text-align:left">
	<%-- ÷������ǥ�� --%>
	<%if(b.getFile1()!=null && !b.getFile1().trim().equals("")){%>
		<a href="file/<%=b.getFile1() %>" style="text-decoration:none;">@</a>
	<%}else{%>&nbsp;&nbsp;&nbsp;<%}%>
	<%-- ����� level��ŭ �鿩���� --%>
	<%if(b.getGrplevel()>0){
			for(int i=1;i<b.getGrplevel();i++){%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%}%>��
	<%}%>
	<a href="info.jsp?num=<%=b.getNum() %>">
		<%=b.getSubject()%></a></td>
	<td><%=b.getName() %></td>
	<td><%if(today.equals(sf.format(b.getRegdate()))){ %>
		<%=todayf.format(b.getRegdate()) %>
		<% } else { %><%=otherf.format(b.getRegdate())%><%}%>
	</td>
	<td><%=b.getReadcnt() %></td></tr>
	<%} %>
<tr><td colspan="5"><%-- ������ ó���ϱ� --%>
	<%if(pageNum<=1){ %>[����]<%} else { %>
	<a href="list.jsp?pageNum=<%=pageNum -1%>">[����]</a><% } %>
	<%for(int a=startpage; a<=endpage;a++){ %>
		<%if(a==pageNum){ %>[<%=a %>]<%}else{ %>
			<a href="list.jsp?pageNum=<%=a %>">[<%=a %>]</a>
		<% }
		} %>
	<% if(pageNum>=maxpage){ %>[����] <%}else {%>
	<a href="list.jsp?pageNum=<%=pageNum + 1 %>">[����]</a><%} %>
</td></tr>
<%} %>
	<tr><td colspan="5" style="text-align:right">
		<a href="writeForm.jsp">[�۾���]</a></td></tr>
</table>
</body>
</html>