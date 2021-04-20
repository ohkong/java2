package action.board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import model.Board;
import model.BoardDao;

public class BoardAction {
	BoardDao dao = new BoardDao();

	public ActionForward hello(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("hello", "Hello World");
		return new ActionForward();
	}
	/*
	 * 1. 파라미터 값을 model.Board 객체 저장. MultipartRequest 객체 사용. 
	 * 2. 게시물 번호 num 현재 등록된
	 * num의 최대값을 조회. 최대값+1 등록된 게시물의 번호. db에서 maxnum 을 구해서 +1 값으로 num 설정하기 
	 * 3. board내용을 db에 페이지 이동
	 *  	등록성공 : list.don 페이지 이동 
	 * 		등록실패 : 메세지 출력. writeForm.do 페이지 이동
	 */

	public ActionForward write(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
		File f = new File(path);
		if (!f.exists())
			f.mkdirs();
		MultipartRequest multi;
		try {
			multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			Board board = new Board();
			board.setName(multi.getParameter("name"));
			board.setPass(multi.getParameter("pass"));
			board.setSubject(multi.getParameter("subject"));
			board.setContent(multi.getParameter("content"));
			board.setFile1(multi.getFilesystemName("file1"));
			BoardDao dao = new BoardDao();

			// board table에서 num 컬럼의 최대값 리턴. 최대값이 없는 경우 0으로 리턴
			int num = dao.maxnum();
			board.setNum(++num);
			board.setGrp(num);
			if (dao.insert(board)) {
				return new ActionForward(true, "list.do");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("msg", "게시물 등록 실패");
		request.setAttribute("url", "writeForm.jsp");
		return new ActionForward(false, "../alert.jsp");
	}

	/*
	 * 1.한 페이지 당 10건의 게시물을 출력하기. pageNum 파라미터값을 저장 => 없는 경우는 1로 설정하기. 2. 최근 등록된 게시물이
	 * 가장 위에서 배치함. 3. db에서 해당 페이지에 출력될 내용을 조회하여 화면에 출력. 게시물을 출력부분. 페이지 구분 출력 부분
	 * 
	 * 20201123 문제 1. 첨부파일이 있는 경우 @표시하기 2. 오늘 등록된 게시물은 시 :분:초로 출력하고 오늘 등록된 게시물이 아닌
	 * 글은 년-월-일 시:분 으로 출력 3. 답글인 경우 들여쓰기. ㅂ한자-6 4. 페이지별 조회번호가 출력되도록 수정하기
	 */
	public ActionForward list(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = 1;
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
		int boardcount = dao.boardCount(column,find);
		List<Board> list = dao.list(pageNum, limit,column,find);
		int maxpage = (int) ((double) boardcount / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if (endpage > maxpage)
			endpage = maxpage;
		int boardnum = boardcount - (pageNum - 1) * limit;
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sf.format(new Date());
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("today", today);
		return new ActionForward();
	}

	/*
	 * 1. num 파라미터 저장 2. num값의 게시물을 db에서 조회. Board BoardDao.selectOne(num) 3. num값의
	 * 게시물의 조회수 증가시키기 void BoardDao.readcntAdd(num) 4. 조회된 게시물 화면에 출력.
	 */
	public ActionForward info(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		Board b = dao.selectOne(num);
		dao.readcntAdd(num); // 조회수 증가
		request.setAttribute("b", b);
		return new ActionForward();
	}

	/*
	 * 1. 원글의 num을 파라미터로 받는다. 2. db에서 num의 게시물 조회하여 원글의 num,grp,grplevel,grpstep 정보를
	 * 저장 3. 입력 화면 표시
	 */
	public ActionForward replyForm(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		Board b = dao.selectOne(num);
		request.setAttribute("b", b);
		return new ActionForward();
	}

	/*
	 * 1. 파라미터 값을 Board 객체에 저장하기 => useBean 태그 사용. 원글정보 : num, grp, grplevel,
	 * grpstep 답글정보 : name, pass, subject, content => 등록 정보 2. 같은 grp 값을 사용하는 게시물들의
	 * grpstep 값을 1 증가하기. void BoardDao.grpStepAdd(grp,grpstep) 3. Board 객체를 db에
	 * insert 하기. num : maxnum +1 grp : 원글과 동일. grplevel : 원글 +1 grpstep : 원글 +1 4.
	 * 등록 성공시: "답변 등록 완료" 메시지 출력 후, list.jsp 페이지로 이동 등록 실패시 : "답변 등록시 오류발생" 메시지 출력
	 * 후, replyForm.jsp 페이지로 이동
	 */
	public ActionForward reply(HttpServletRequest request, HttpServletResponse response) {
		Board b = new Board();
		b.setNum(Integer.parseInt(request.getParameter("num")));
		b.setName(request.getParameter("name"));
		b.setPass(request.getParameter("pass"));
		b.setSubject(request.getParameter("subject"));
		b.setContent(request.getParameter("content"));
		b.setGrp(Integer.parseInt(request.getParameter("grp")));
		b.setGrplevel(Integer.parseInt(request.getParameter("grplevel")));
		b.setGrpstep(Integer.parseInt(request.getParameter("grpstep")));
		dao.grpStepAdd(b.getGrp(), b.getGrplevel());
		int grplevel = b.getGrplevel();
		int grpstep = b.getGrpstep();
		int num = dao.maxnum();// 최대 num값 조회
		String msg = "답변등록시 오류발생";
		String url = "replyForm.do?num=" + b.getNum();
		b.setNum(++num);
		b.setGrplevel(grplevel + 1);
		b.setGrpstep(grpstep + 1);
		if (dao.insert(b)) {
			msg = "답변등록 완료";
			url = "list.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

	/*
	 * 1. num값에 해당하는 게시물을 조회 2. 조회된 게시물을 화면에 출력
	 */
	public ActionForward updateForm(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		Board b = dao.selectOne(num);
		request.setAttribute("b", b);
		return new ActionForward();
	}

	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		Board board = new Board();
		String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
		String msg = null;
		String url = null;
		try {
			MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			board.setNum(Integer.parseInt(multi.getParameter("num")));
			board.setName(multi.getParameter("name"));
			board.setPass(multi.getParameter("pass"));
			board.setSubject(multi.getParameter("subject"));
			board.setContent(multi.getParameter("content"));
			board.setFile1(multi.getFilesystemName("file1"));

			if (board.getFile1() == null || board.getFile1().equals("")) {
				board.setFile1(multi.getParameter("file2"));
			}
			BoardDao dao = new BoardDao();
			Board dbboard = dao.selectOne(board.getNum());
			msg = "비밀번호가 틀렸습니다.";
			url = "updateForm.do?num=" + board.getNum();

			if (board.getPass().equals(dbboard.getPass())) {
				if (dao.update(board)) { // db의 게시물 수정
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
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		String pass = request.getParameter("pass");
		BoardDao dao = new BoardDao();
		Board dbBoard = dao.selectOne(num);

		String msg = "게시물의 비밀번호가 틀렸습니다.";
		String url = "deleteForm.do?num=" + num;

		// 게시물의 비밀번호가 틀렸을 경우
		if (dbBoard == null) {// deleteForm의 pass파라미터 값과 db에 파라미터값과 비교
			msg = "없는 게시글 입니다.";
			url = "list.do";
		} else {
			if (pass.equals(dbBoard.getPass())) {
				if (dao.delete(num)) {
					msg = "게시글 삭제 성공.";
					url = "list.do";
				} else {
					msg = "게시글 삭제 실패.";
					url = "info.do?num" + num;
				}
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward imgupload(HttpServletRequest request, 
					HttpServletResponse response) throws IOException {
		String path = request.getServletContext().getRealPath("/")  
											+ "model2/board/imgfile/";
		File f = new File(path);
		if(!f.exists()) f.mkdirs();
		MultipartRequest multi = new MultipartRequest
						(request, path,10*1024*1024,"euc-kr");
		//upload : ckeditor에서 지정한 파일이름
		String fileName = multi.getFilesystemName("upload");
		request.setAttribute("fileName", fileName);
		request.setAttribute("CKEditorFuncNum", 
						request.getParameter("CKEditorFuncNum"));
		return new ActionForward(false, "ckeditor.jsp");
	}
	
	public ActionForward graph(HttpServletRequest request, 
			HttpServletResponse response){
		//{name:홍길동,cnt:5},{name:테스트,cnt:4}
		List<Map<String,Object>> list = dao.boardgraph();
		//json 형식의 문자열 변경
		StringBuilder json = new StringBuilder("[");
		int i = 0;
		//m : {name:홍길동,cnt:5}
		for(Map<String,Object> m : list) {
			//me : cnt:5
			for(Map.Entry<String, Object> me : m.entrySet()) {
				if(me.getKey().equals("name"))
					json.append("{\"name\":\""	//{"name":"홍길동",
							+me.getValue() + "\",");
				if(me.getKey().equals("cnt"))
					json.append("\"cnt\":"	+me.getValue() + "}");
			}
			//{"name":"홍길동","cnt":5},{"name":"테스트","cnt":4}
			i++;
			if(i<list.size())json.append(",");
		}
		json.append("]");
		request.setAttribute("json", json.toString().trim());
		return new ActionForward();
	}
	
	public ActionForward graph2(HttpServletRequest request,
							HttpServletResponse response) {
		List<Map<String, Object>> list = dao.boardgraph2();
		request.setAttribute("list", list);
		return new ActionForward();
	}
	
	public ActionForward exchange(HttpServletRequest request,
			HttpServletResponse response) {
		String url="https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001";
		Document doc = null;
		List<String> list = new ArrayList<String>();
		List<String> list2 = new ArrayList<String>();
		try {
			doc = Jsoup.connect(url).get();	//html 분석. 루트노드, 문서노드 리턴
			Elements e1 = doc.select(".tc");	//국가코드, 환율값 태그선택
			Elements e2 = doc.select(".tl2.bdl");	//국가 이름
			for(int i = 0; i<e1.size();i++) {
				if(e1.get(i).html().equals("USD")) {
					list.add(e1.get(i).html());	//USD 정보 저장
					for(int j = 1;j<=6;j++) {
						list.add(e1.get(i+j).html());	//환율 정보 저장
					}
					break;
				}
			}
			for(Element ele : e2) {
				if(ele.html().contains("미국")) {
					list2.add(ele.html());
				}
			}
		}catch(IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.setAttribute("today", new Date());
		return new ActionForward();
	}
	
	public ActionForward exchange2(HttpServletRequest request,
			HttpServletResponse response) {
		Map<String,List<String>> map = new HashMap<>();
		try {
			String kebhana = Jsoup.connect
					("http://fx.kebhana.com/FER1101M.web").get().text();
			String strJson = kebhana.substring(kebhana.indexOf("{"));
			JSONParser jsonParser = new JSONParser();
			JSONObject json = (JSONObject)jsonParser.parse(strJson.trim());
			JSONArray array = (JSONArray)json.get("리스트");//통화목록, 배열
			for(int i = 0; i< array.size();i++) {
				JSONObject obj = (JSONObject)array.get(i);//json 형태의 통화정보
				if(obj.get("통화명").toString().contains("미국")||
				   obj.get("통화명").toString().contains("일본")||
				   obj.get("통화명").toString().contains("유로")||
				   obj.get("통화명").toString().contains("중국")||
				   obj.get("통화명").toString().contains("영국")) {
					String str = obj.get("통화명").toString();
					String[] sarr = str.split(" ");
					String key = sarr[0];	//국가명
					String code = sarr[1];	//통화코드
					List<String> list = new ArrayList<String>();
					list.add(code);//USD
					list.add(obj.get("매매기준율").toString());
					list.add(obj.get("현찰파실때").toString());
					list.add(obj.get("현찰사실때").toString());
					map.put(key,list);
				}
			}
			request.setAttribute("date", json.get("날짜").toString());
			request.setAttribute("map", map);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return new ActionForward();
	}
}
