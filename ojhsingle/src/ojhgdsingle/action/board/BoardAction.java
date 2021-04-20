package ojhgdsingle.action.board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import ojhgdsingle.Board;
import ojhgdsingle.MainDao;
import ojhgdsingle.Member;
import ojhgdsingle.Reply;
import ojhgdsingle.action.ActionForward;

public class BoardAction {
	MainDao dao = new MainDao();

	public ActionForward write(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("/") + "main/board/game/file/";
		Board board = new Board();
		Member mem = dao.selectOne(board.getId());
		request.setAttribute("mem", mem);
		File f = new File(path);
		if (!f.exists())
			f.mkdirs();
		MultipartRequest multi;
		try {
			multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			board.setId(multi.getParameter("id"));
			board.setPass(multi.getParameter("pass"));
			board.setTitle(multi.getParameter("title"));
			board.setContent(multi.getParameter("content"));
			board.setFile1(multi.getFilesystemName("file1"));
			board.setBtype(multi.getParameter("btype"));
			board.setTradetype(multi.getParameter("tradetype"));
			MainDao dao = new MainDao();
			int num = dao.maxnum();
			board.setNum(++num);
			if (dao.boardinsert(board)) {
				return new ActionForward(true, "list.do?btype=" + multi.getParameter("btype"));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("msg", "게시물 등록 실패");
		request.setAttribute("url", "writeForm.jsp");
		return new ActionForward(false, "../../alert.jsp");
	}
	
	public ActionForward write2(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("/") + "main/board/tournament/file/";
		Board board = new Board();
		Member mem = dao.selectOne(board.getId());
		request.setAttribute("mem", mem);
		File f = new File(path);
		if (!f.exists())
			f.mkdirs();
		MultipartRequest multi;
		try {
			multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			board.setId(multi.getParameter("id"));
			board.setPass(multi.getParameter("pass"));
			board.setTitle(multi.getParameter("title"));
			board.setContent(multi.getParameter("content"));
			board.setFile1(multi.getFilesystemName("file1"));
			board.setBtype(multi.getParameter("btype"));
			board.setTradetype(multi.getParameter("tradetype"));
			MainDao dao = new MainDao();
			int num = dao.maxnum();
			board.setNum(++num);
			if (dao.boardinsert(board)) {
				return new ActionForward(true, "list.do?btype=" + multi.getParameter("btype"));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("msg", "게시물 등록 실패");
		request.setAttribute("url", "writeForm.jsp");
		return new ActionForward(false, "../../alert.jsp");
	}
	
	public ActionForward write3(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("/") + "main/board/trade/file/";
		Board board = new Board();
		Member mem = dao.selectOne(board.getId());
		request.setAttribute("mem", mem);
		File f = new File(path);
		if (!f.exists())
			f.mkdirs();
		MultipartRequest multi;
		try {
			multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			board.setId(multi.getParameter("id"));
			board.setPass(multi.getParameter("pass"));
			board.setTitle(multi.getParameter("title"));
			board.setContent(multi.getParameter("content"));
			board.setFile1(multi.getFilesystemName("file1"));
			board.setBtype(multi.getParameter("btype"));
			board.setTradetype(multi.getParameter("tradetype"));
			MainDao dao = new MainDao();
			int num = dao.maxnum();
			board.setNum(++num);
			if (dao.boardinsert(board)) {
				return new ActionForward(true, "list.do?btype=" + multi.getParameter("btype"));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("msg", "게시물 등록 실패");
		request.setAttribute("url", "writeForm.jsp");
		return new ActionForward(false, "../../alert.jsp");
	}
	
	public ActionForward write4(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("/") + "main/board/free/file/";
		Board board = new Board();
		Member mem = dao.selectOne(board.getId());
		request.setAttribute("mem", mem);
		File f = new File(path);
		if (!f.exists())
			f.mkdirs();
		MultipartRequest multi;
		try {
			multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			board.setId(multi.getParameter("id"));
			board.setPass(multi.getParameter("pass"));
			board.setTitle(multi.getParameter("title"));
			board.setContent(multi.getParameter("content"));
			board.setFile1(multi.getFilesystemName("file1"));
			board.setBtype(multi.getParameter("btype"));
			board.setTradetype(multi.getParameter("tradetype"));
			MainDao dao = new MainDao();
			int num = dao.maxnum();
			board.setNum(++num);
			if (dao.boardinsert(board)) {
				return new ActionForward(true, "list.do?btype=" + multi.getParameter("btype"));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("msg", "게시물 등록 실패");
		request.setAttribute("url", "writeForm.jsp");
		return new ActionForward(false, "../../alert.jsp");
	}
	
	public ActionForward reply(HttpServletRequest request, 
			HttpServletResponse response) throws IOException {
			Reply re = new Reply();
			int num = Integer.parseInt(request.getParameter("num"));
			Board board = dao.selectOne2(num);
			request.setAttribute("board", board);
			try {
				re.setId2(request.getParameter("id2"));
				re.setRcontent(request.getParameter("rcontent"));
				re.setNum(num);
				re.setRtype(request.getParameter("rtype"));
				MainDao dao = new MainDao();
				int seq = dao.maxseq();
				re.setSeq(++seq);
				if(dao.replyinsert(re)) {
					return new ActionForward(true, "info.do?num="+ request.getParameter("num")+ "&btype="+request.getParameter("btype"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("msg", "댓글 등록 실패");
			request.setAttribute("url", "info.do?num="+ request.getParameter("num")+ "&btype="+request.getParameter("btype"));
			return new ActionForward(false,"../../alert.jsp");
	}
	
	public ActionForward list1(HttpServletRequest request, HttpServletResponse response) {
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
		List<Board> list1 = dao.boardList(pageNum, limit,column,find,btype);
		int maxpage = (int) ((double) boardcount / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if (endpage > maxpage)
			endpage = maxpage;
		int boardnum = boardcount - (pageNum - 1) * limit;
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sf.format(new Date());
		request.setAttribute("btype", btype);
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("list1", list1);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("today", today);
		return new ActionForward();
	}
	
	public ActionForward list2(HttpServletRequest request, HttpServletResponse response) {
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
		List<Board> list2 = dao.boardList(pageNum, limit,column,find,btype);
		int maxpage = (int) ((double) boardcount / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if (endpage > maxpage)
			endpage = maxpage;
		int boardnum = boardcount - (pageNum - 1) * limit;
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sf.format(new Date());
		request.setAttribute("btype", btype);
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("list2", list2);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("today", today);
		return new ActionForward();
	}
	
	public ActionForward list3(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = 1;
		String btype = request.getParameter("btype");
		String tradetype = request.getParameter("tradetype");
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
		List<Board> list3 = dao.boardList2(pageNum, limit,column,find,btype,tradetype);
		int maxpage = (int) ((double) boardcount / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if (endpage > maxpage)
			endpage = maxpage;
		int boardnum = boardcount - (pageNum - 1) * limit;
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sf.format(new Date());
		request.setAttribute("btype", btype);
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("list3", list3);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("today", today);
		return new ActionForward();
	}
	
	public ActionForward list4(HttpServletRequest request, HttpServletResponse response) {
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
		List<Board> list4 = dao.boardList(pageNum, limit,column,find,btype);
		int maxpage = (int) ((double) boardcount / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if (endpage > maxpage)
			endpage = maxpage;
		int boardnum = boardcount - (pageNum - 1) * limit;
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sf.format(new Date());
		request.setAttribute("btype", btype);
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("list4", list4);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("today", today);
		return new ActionForward();
	}
	
	
	public ActionForward info(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		Board b = dao.selectOne2(num);
		dao.readcntAdd(num);
		List<Reply> list1 = dao.replylist(num);
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		String today = f.format(new Date());
		request.setAttribute("today", today);
		request.setAttribute("list1", list1);
		request.setAttribute("b", b);
		return new ActionForward();
	}
	public ActionForward info2(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		Board b = dao.selectOne2(num);
		Member mem = dao.selectOne(b.getId());
		dao.readcntAdd(num);
		List<Reply> list1 = dao.replylist(num);
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		String today = f.format(new Date());
		request.setAttribute("today", today);
		request.setAttribute("list1", list1);
		request.setAttribute("mem", mem);
		request.setAttribute("b", b);
		return new ActionForward();
	}
	
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		String pass = request.getParameter("pass");
		String btype= request.getParameter("btype");
		MainDao dao = new MainDao();
		Board dbBoard = dao.selectOne2(num);

		String msg = "게시물의 비밀번호가 틀렸습니다.";
		String url = "deleteForm.do?num=" + num;

		if (dbBoard == null) {
			msg = "없는 게시글 입니다.";
			url = "list.do?btype=" + btype;
		} else {
			if (pass.equals(dbBoard.getPass())) {
				if (dao.deleteboard(num)) {
					msg = "게시글 삭제 성공.";
					url = "list.do?btype=" + btype;
				} else {
					msg = "게시글 삭제 실패.";
					url = "info.do?num" + num;
				}
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../../alert.jsp");
	}
	
	public ActionForward updateForm(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		String btype= request.getParameter("btype");
		Board b = dao.selectOne2(num);
		request.setAttribute("btype", btype);
		request.setAttribute("b", b);
		return new ActionForward();
	}

	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		Board board = new Board();
		String path = request.getServletContext().getRealPath("/") + "main/board/file/";
		String msg = null;
		String url = null;
		try {
			MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			board.setNum(Integer.parseInt(multi.getParameter("num")));
			board.setId(multi.getParameter("id"));
			board.setPass(multi.getParameter("pass"));
			board.setTitle(multi.getParameter("title"));
			board.setContent(multi.getParameter("content"));
			board.setFile1(multi.getFilesystemName("file1"));

			if (board.getFile1() == null || board.getFile1().equals("")) {
				board.setFile1(multi.getParameter("file2"));
			}
			MainDao dao = new MainDao();
			Board dbboard = dao.selectOne2(board.getNum());
			msg = "비밀번호가 틀렸습니다.";
			url = "updateForm.do?num=" + board.getNum();

			if (board.getPass().equals(dbboard.getPass())) {
				if (dao.bupdate(board)) { 
					msg = "게시물 수정 완료";
					url = "info.do?num=" + board.getNum();
				} else
					msg = "게시물 수정 실패";
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../../alert.jsp");
	}
	
	public ActionForward imgupload(HttpServletRequest request, 
					HttpServletResponse response) throws IOException {
		String path = request.getServletContext().getRealPath("/")  
											+ "main/board/imgfile/";
		File f = new File(path);
		if(!f.exists()) f.mkdirs();
		MultipartRequest multi = new MultipartRequest
					(request, path,10*1024*1024,"euc-kr");
		String fileName = multi.getFilesystemName("upload");
		request.setAttribute("fileName", fileName);
		request.setAttribute("CKEditorFuncNum", 
				request.getParameter("CKEditorFuncNum"));
		return new ActionForward(false, "ckeditor.jsp");
	}
	
	
}
