package ojhgdsingle.action.member;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ojhgdsingle.Board;
import ojhgdsingle.MainDao;
import ojhgdsingle.action.Action;
import ojhgdsingle.action.ActionForward;


public class MainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, 
						HttpServletResponse response) throws Exception {
		MainDao dao = new MainDao();
		int pageNum = 1;
		String btype = request.getParameter("btype");
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {
		}
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		if(column == null || column.trim().equals("")) {
			column = null;
			find = null;
		}
		if(find == null || find.trim().equals("")) {
			column = null;
			find = null;
		}
		int limit = 10;
		int boardcount = dao.boardCount(column,find,btype);
		List<Board> list1 = dao.boardList2(pageNum, limit,column,find,1);
		List<Board> list2 = dao.boardList2(pageNum, limit,column,find,2);
		List<Board> list3 = dao.boardList2(pageNum, limit,column,find,3);
		List<Board> list4 = dao.boardList2(pageNum, limit,column,find,4);
		int maxpage = (int) ((double) boardcount / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if (endpage > maxpage)
			endpage = maxpage;
		int boardnum1 = 1;
		int boardnum2 = 1;
		int boardnum3 = 1;
		int boardnum4 = 1;
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sf.format(new Date());
		request.setAttribute("btype", btype);
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("list4", list4);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardnum1", boardnum1);
		request.setAttribute("boardnum2", boardnum2);
		request.setAttribute("boardnum3", boardnum3);
		request.setAttribute("boardnum4", boardnum4);
		request.setAttribute("today", today);
		return new ActionForward();
	}
	
}
