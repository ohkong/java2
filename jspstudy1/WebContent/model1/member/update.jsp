<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/update.jsp 
	
	1. ��� �Ķ���� ������ Member ��ü�� ���� => useBean �±�
	2. �Էµ� ��й�ȣ��, db�� ����� ��й�ȣ ��
		�������� ��� ������ ��й�ȣ�� ���ϱ�
		- ���� ���� ��� : "��й�ȣ ����" �޼��� ��� updateForm.jsp ������ �̵�
	3. �Ķ���͸� �����ϰ� �ִ� Member ��ü�� �̿��Ͽ� db ���� ����.
		int MemberDao.update(Member)
	 ����� 0���ϸ� �������� �޼��� �����, updateForm.jsp ������ �̵�
	 	  1�̻��̸� ���� ����    info.jsp������ �̵�
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
	if(login.equals("admin")){ //������ �α���
		dbmem=dao.selectOne(login);
	} else {		//�Ϲݻ���� �α���
		dbmem=dao.selectOne(mem.getId());
	}
	String msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
	String url = "updateForm.jsp?id="+mem.getId();
	if(mem.getPass().equals(dbmem.getPass())){
			int result = dao.update(mem);	// �Էµ� ������ db�� ����
			if(result>0){
				msg="���� ����";
				url="info.jsp?id="+mem.getId();
			} else {
				msg = "��������";
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