package ojhgdsingle.action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ojhgdsingle.MainDao;
import ojhgdsingle.Member;
import ojhgdsingle.action.ActionForward;


public class UpdateAction extends UserLoginAction{

	@Override
	public ActionForward doExecute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setCue(Integer.parseInt(request.getParameter("cue")));
		mem.setTel(request.getParameter("tel"));
		mem.setRegion(request.getParameter("region"));
		mem.setPicture(request.getParameter("picture"));
		mem.setKind1(request.getParameter("kind1"));
		mem.setKind2(request.getParameter("kind2"));
		mem.setKind3(request.getParameter("kind3"));
		mem.setScore1(request.getParameter("score1"));
		mem.setScore2(request.getParameter("score2"));
		mem.setScore3(request.getParameter("score3"));
		
		String msg = "비밀번호가 틀렸습니다.";
		String url = "updateForm.me?id="+mem.getId();
		MainDao dao = new MainDao();
		Member dbmem = dao.selectOne(login);
		if(mem.getPass().equals(dbmem.getPass())) {
			int result = dao.update(mem);
			if(result>0) {
				return new ActionForward(true,"info.me?id="+mem.getId());
			}else {
				msg="수정실패";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}

}
