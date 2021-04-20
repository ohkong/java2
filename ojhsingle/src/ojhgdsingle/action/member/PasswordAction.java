package ojhgdsingle.action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ojhgdsingle.MainDao;
import ojhgdsingle.Member;
import ojhgdsingle.action.ActionForward;


public class PasswordAction extends UserLoginAction{
	@Override
	public ActionForward doExecute(HttpServletRequest request, 
						HttpServletResponse response) throws Exception {
		boolean opener = true;	
		boolean closer = true;	
		String msg = null;
		String url = null;
		String pass=request.getParameter("pass");//변경전 비밀번호
		String chgpass=request.getParameter("chgpass");//변경후 비밀번호
		MainDao dao = new MainDao();
		Member mem = dao.selectOne(login);
		if(pass.equals(mem.getPass())){
			if(dao.updatePass(login,chgpass)>0){
				msg ="비밀번호가 변경되었습니다";
				url = "info.me?id="+login;
			} else{	//비밀번호를 db에서 변경시 오류 발생시
				msg= "비밀번호 변경시 오류가 발생 했습니다.";
				url = "updateForm.me?id="+login;
			}
		}else {	//비밀번호 오류
			opener = false;
			closer = false;
			msg = "비밀번호 오류 입니다. 확인하세요.";
			url = "passwordForm.me";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("closer", closer);
		request.setAttribute("opener", opener);
		return new ActionForward();
	}
	
}
