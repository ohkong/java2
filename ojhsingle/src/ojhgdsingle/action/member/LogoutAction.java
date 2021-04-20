package ojhgdsingle.action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ojhgdsingle.action.Action;
import ojhgdsingle.action.ActionForward;

public class LogoutAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getSession().invalidate();
		request.setAttribute("msg", "·Î±×¾Æ¿ôÇÏ¼Ì½À´Ï´Ù.");
		request.setAttribute("url", "main.me");
		return new ActionForward(false,"../alert.jsp");
	}
	
}
