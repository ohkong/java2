<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/password.jsp 
	1. �α׾ƿ������� ���, �α��� �ϼ���. �޼������.
	   �ٸ� ������� ��й�ȣ ���� �Ұ�. => �α��ε� id���� ���� ����. ���θ� ����
	   opener �������� loginForm.jsp ������ �̵�.
	   ���������� �ݱ�
	2. pass, chgpass �Ķ���� �� ����
	3. pass ��й�ȣ�� db�� ����� ��й�ȣ�� Ʋ����
	   ��й�ȣ ���� �޼��� ���. passwordForm.jsp ������ �̵�
	4. pass ��й�ȣ�� db�� ����� ��й�ȣ�� ������
	   MemberDao.updatPass(login,chgpass) => ���ο� ��й�ȣ�� ����
	   ��й�ȣ ���� ����.
	   		�޼��� ����� opener �������� info.jsp ������ �̵�. ���������� �ݱ�
	   ��й�ȣ ���� ����
	   		�޼��� ����� opener �������� updateForm.jsp ������ �̵�. ���������� �ݱ�
--%>
<%
	request.setCharacterEncoding("euc-kr");
	String login=(String)session.getAttribute("login");
	boolean opener = true;	//opener �������� url�� ����
	boolean closer = true;	//���������� close
	String msg = null;
	String url = null;
	if(login==null){ //�α׾ƿ� 
	 	msg="�α����� �ʿ��մϴ�";
	 	url="loginForm.jsp";
	 } else {
		String pass=request.getParameter("pass");
		String chgpass=request.getParameter("chgpass");
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(login);
		if(pass.equals(mem.getPass())){
			if(dao.updatePass(login,chgpass)>0){
				msg ="��й�ȣ�� ����Ǿ����ϴ�";
				url = "info.jsp?id="+login;
			} else{	//��й�ȣ�� db���� ����� ���� �߻���
				msg= "��й�ȣ ����� ������ �߻� �߽��ϴ�.";
				url = "updateForm.jsp?id="+login;
			}
		}else {
			opener = false;
			closer = false;
			msg = "��й�ȣ ���� �Դϴ�. Ȯ���ϼ���.";
			url = "passwordForm.jsp";
		}
	 }
%>
<script>
	alert("<%=msg%>");
	<% if(opener){%>
	opener.location.href="<%=url%>";
	<% } else { %>
		location.href="<%=url%>";
	<% } %>
	<% if(closer){%>
		self.close();
	<% } %>
</script>