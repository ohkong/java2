package ojhgdsingle.action.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ojhgdsingle.Board;
import ojhgdsingle.MainDao;
import ojhgdsingle.Member;
import ojhgdsingle.action.ActionForward;

public class InfoAction extends UserLoginAction{

	@Override
	public ActionForward doExecute(HttpServletRequest request, 
					HttpServletResponse response) throws Exception {
		Member mem = new MainDao().selectOne(id);
		request.setAttribute("mem", mem);
		List<Board> list = new MainDao().selectOne3(id);
		int boardnum=1;
		request.setAttribute("list", list);
		request.setAttribute("boardnum", boardnum);
		return new ActionForward();
	}
	
}
