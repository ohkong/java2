<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/delete.jsp 
    1. �α׾ƿ� ���� : "�α����ϼ���" ���. loginForm.jsp ������ �̵�
    2. �Ϲݻ����
          - id �Ķ���� ������, login ������ �ٸ����
            "���θ� Ż�� �����մϴ�.". main.jsp ������ �̵�
    3. id�� �������� ��� Ż�� �Ұ�. list.jsp ������ �̵�.
    4. ��й�ȣ ����. 
          �����ڰ� ���� Ż���� ��� : ������ ��й�ȣ�� ����.
          �Ϲݻ������ Ż���� ��� : ���� ��й�ȣ�� ���� 
          ��й�ȣ ����ġ : "��й�ȣ�� Ʋ��" ���. deleteForm.jsp ������ �̵�.
    5. db���� delete ����
          int MemberDao.delete(id) �޼��� ȣ��
          Ż�� ���� : member db���� delete ó�� �Ϸ�
                   �Ϲݻ���� : �α׾ƿ� ����. ���� ���� �޼��� ���.   loginForm.jsp ������ �̵�.
                   ������ : ���� ���� �޼��� ���. list.jsp ������ �̵�. 
          Ż�� ���� : member db���� delete ó���� �����߻�
                   �Ϲݻ���� : Ż�� ���� �޼��� ���. info.jsp ������ �̵�.
                   ������ : ���� ���� �޼��� ���. list.jsp ������ �̵�. 
--%>
<%
	request.setCharacterEncoding("euc-kr");
	String login=(String)session.getAttribute("login");
	//Ż�� ���̵� ����. id, pass �Ķ����
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String msg = null;
	String url = null;
	if(login==null){ 
	 	msg="�α����� �ʿ��մϴ�";
	 	url="loginForm.jsp";
	 } else if( !login.equals(id)&&!login.equals("admin")) {
		msg="���θ� Ż�� �����մϴ�.";
		url="main.jsp";
	} else if(id.equals("admin")) { //Ż�� ����� �Ǵ� ȸ���� ������ �ȵ�
		msg="�����ڴ� Ż�� �Ұ����մϴ�.";
		url="list.jsp";
    } else { //Ż�𰡴� �ŷ�
		Member dbmem = null;
		MemberDao dao = new MemberDao();
		if(login.equals("admin")){	//������ �α���. �������� ��й�ȣ 	
			dbmem=dao.selectOne(login); //������ ����
			url = "list.jsp";
		} else {	
			dbmem=dao.selectOne(id);	//�Ϲݻ���� �α���.
			url = "loginForm.jsp";
		}
	//pass : �Էº�й�ȣ
	//dbmem.getPass() : db�� ����� ��й�ȣ
		if(pass.equals(dbmem.getPass())){	//��й�ȣ ��ġ
    		if (dao.delete(id) > 0) { 	//Ż�𼺰�
            	if (login.equals("admin")){
            	 msg = id + " ����ڰ� ����Ż�� �Ǿ����ϴ�.";
          	  	} else {
            		msg= id + "���� ȸ��Ż�� �Ϸ� �Ǿ����ϴ�.";
            		session.invalidate(); //session�� �α������� ����
                }
	    	} else { //Ż�� ����
                msg = id + "���� Ż��� ���� �߻�.";
           		 if (!login.equals("admin")) {
                	url = "info.jsp?id="+id;
        			}
	    		}
		} else {	//��й�ȣ ����ġ
               msg = id + "���� ��й�ȣ�� �ٸ��ϴ�.";
               url = "deleteForm.jsp?id="+id;
            }
        }
%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
