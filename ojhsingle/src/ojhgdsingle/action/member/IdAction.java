package ojhgdsingle.action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ojhgdsingle.MainDao;
import ojhgdsingle.action.Action;
import ojhgdsingle.action.ActionForward;


public class IdAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name=request.getParameter("name");
		String tel=request.getParameter("tel");
		MainDao dao = new MainDao();
		String id = dao.idSearch(name,tel); 
		request.setAttribute("id", id);
		String msg=null;
		String url=null;
		if(id==null) {
			msg = "정보에 맞는 id를 찾을수 없습니다.";
			url = "idForm.me";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false,"../alert.jsp");
		}
		return new ActionForward();
	}
}
