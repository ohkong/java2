package action.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
 	1. db���� ��� ȸ�� ������ ��ȸ�Ͽ� List<Member> ��ü�� ����
 	   List<Member>  MemberDao().list();
 	2. list ��ü�� request.setAttribute() �޼���� ����Ͽ� view�� ����
 */
public class ListAction extends AdminLoginAction{
	@Override
	public ActionForward doExecute(HttpServletRequest request,
					HttpServletResponse response) {
		List<Member> list = new MemberDao().list();
		request.setAttribute("list", list);
		return new ActionForward();
	}

}
