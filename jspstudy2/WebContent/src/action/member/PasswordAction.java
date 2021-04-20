package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
 	1. pass, chgpass �Ķ���� �� ����
	2. pass ��й�ȣ�� db�� ����� ��й�ȣ�� Ʋ����
	   ��й�ȣ ���� �޼��� ���. passwordForm.me ������ �̵�
	3. pass ��й�ȣ�� db�� ����� ��й�ȣ�� ������
	   MemberDao.updatPass(login,chgpass) => ���ο� ��й�ȣ�� ����
	   ��й�ȣ ���� ����.
	   		�޼��� ����� opener �������� info.me ������ �̵�. ���������� �ݱ�
	   ��й�ȣ ���� ����
	   		�޼��� ����� opener �������� updateForm.me ������ �̵�. ���������� �ݱ�
 */
public class PasswordAction extends UserLoginAction{
	@Override
	public ActionForward doExecute(HttpServletRequest request, 
						HttpServletResponse response) throws Exception {
		boolean opener = true;	
		boolean closer = true;	
		String msg = null;
		String url = null;
		String pass=request.getParameter("pass");//������ ��й�ȣ
		String chgpass=request.getParameter("chgpass");//������ ��й�ȣ
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(login);
		if(pass.equals(mem.getPass())){
			if(dao.updatePass(login,chgpass)>0){
				msg ="��й�ȣ�� ����Ǿ����ϴ�";
				url = "info.me?id="+login;
			} else{	//��й�ȣ�� db���� ����� ���� �߻���
				msg= "��й�ȣ ����� ������ �߻� �߽��ϴ�.";
				url = "updateForm.me?id="+login;
			}
		}else {	//��й�ȣ ����
			opener = false;
			closer = false;
			msg = "��й�ȣ ���� �Դϴ�. Ȯ���ϼ���.";
			url = "passwordForm.me";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("closer", closer);
		request.setAttribute("opener", opener);
		return new ActionForward();
	}
	
}