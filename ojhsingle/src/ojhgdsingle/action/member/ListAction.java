package ojhgdsingle.action.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ojhgdsingle.MainDao;
import ojhgdsingle.Member;
import ojhgdsingle.action.ActionForward;

public class ListAction extends AdminLoginAction{
	@Override
	public ActionForward doExecute(HttpServletRequest request,
					HttpServletResponse response) {
		List<Member> list = new MainDao().list();
		request.setAttribute("list", list);
		return new ActionForward();
	}

}
