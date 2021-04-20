package ojhgdsingle.action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ojhgdsingle.MainDao;
import ojhgdsingle.action.Action;
import ojhgdsingle.action.ActionForward;


public class PwAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		MainDao dao = new MainDao();
		String msg=null;
		String url=null;
		String pass = dao.pwSearch(id, name, tel);
		request.setAttribute("pass", pass);
		if(pass==null) {
			msg = "정보에 맞는 password를 찾을수 없습니다.";
			url = "pwForm.me";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false,"../alert.jsp");
		}
		return new ActionForward();
	}
}
