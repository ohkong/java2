package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
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
 */
public class DeleteAction extends UserLoginAction{
	@Override
	public ActionForward doExecute(HttpServletRequest request,
					HttpServletResponse response) throws Exception {
		if(id.equals("admin")) {
			request.setAttribute("msg", "�����ڴ� Ż�� �� �� �����ϴ�.");
			request.setAttribute("url", "main.me");
			return new ActionForward(false,"../alert.jsp");
		}
		String pass =request.getParameter("pass");
		String msg=null;
		String url=null;
		if(login.equals("admin")) {	//������ �α���. 
			url="list.me";
		}else{						//�Ϲݻ���� �α���
			url="loginForm.me";
		}
		Member dbmem = null;
		MemberDao dao = new MemberDao();
		dbmem = dao.selectOne(login);
		if(pass.equals(dbmem.getPass())) {	//��й�ȣ ��ġ
			if(dao.delete(id)>0) {
				if(login.equals("admin")) {
					msg = id + "����ڸ� ����Ż�� ����";
				}else {
					msg = id + "���� ȸ��Ż�� �Ϸ�Ǿ����ϴ�.";
					request.getSession().invalidate(); //�α׾ƿ�
				}
			}else {	//Ż�� ����
				msg = id + "���� Ż��� �����߻�.";
				if(!login.equals("admin")) {
					url = "info.me?id=" + id;
				}
			}
		}else {	//��й�ȣ ����
			msg = login + "���� ��й�ȣ�� Ʋ���ϴ�.";
			url = "deleteForm.me?id=" + id;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}

}
