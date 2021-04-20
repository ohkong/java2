package ojhgdsingle.action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ojhgdsingle.MainDao;
import ojhgdsingle.Member;
import ojhgdsingle.action.Action;
import ojhgdsingle.action.ActionForward;

public class LoginAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, 
						HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		Member mem = new MainDao().selectOne(id);
		if(mem == null) {
			request.setAttribute("msg", "아이디를 확인하세요.");
			request.setAttribute("url", "loginForm.me");
		} else {
			if(pass.equals(mem.getPass())) {
				request.getSession().setAttribute("login", id);
				request.getSession().setAttribute("picture", mem.getPicture());
				request.setAttribute("msg", mem.getName()+"님이 로그인 했습니다.");
				request.setAttribute("url", "main.me");
			}else {
				request.setAttribute("msg", "비밀번호가 틀립니다.");
				request.setAttribute("url", "loginForm.me");
			}
		}
		return new ActionForward(false,"../alert.jsp");
	}

}
