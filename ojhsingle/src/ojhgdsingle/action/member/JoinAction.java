package ojhgdsingle.action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ojhgdsingle.MainDao;
import ojhgdsingle.Member;
import ojhgdsingle.action.Action;
import ojhgdsingle.action.ActionForward;


public class JoinAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, 
					HttpServletResponse response) throws Exception {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setTel(request.getParameter("tel"));
		mem.setCue(Integer.parseInt(request.getParameter("cue")));
		mem.setRegion(request.getParameter("region"));
		mem.setPicture(request.getParameter("picture"));
		mem.setKind1(request.getParameter("kind1"));
		mem.setKind2(request.getParameter("kind2"));
		mem.setKind3(request.getParameter("kind3"));
		mem.setScore1(request.getParameter("score1"));
		mem.setScore2(request.getParameter("score2"));
		mem.setScore3(request.getParameter("score3"));
		String msg = "회원가입 실패";
		String url = "joinForm.me";
		if(new MainDao().insert(mem)>0) {
			msg = mem.getName() + "님 회원가입 완료";
			url = "loginForm.me";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}

}
