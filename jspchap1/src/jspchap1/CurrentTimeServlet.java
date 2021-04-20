package jspchap1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// http://localhost:8080/jpschap1/CurrentTimeServlet
// => CurrentTimeServlet 파일이 호출
@WebServlet("/CurrentTimeServlet")
public class CurrentTimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CurrentTimeServlet() {
        super();
    }
    //Get 방식 요청시 호출되는 메서드
    //request : 요청객체. 클라이언트가 서버로 전달한 값을 저장
    //response : 응답객체. 서버가 클라이언트로 전달할 값을 저장
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=EUC-KR");
		Calendar c = Calendar.getInstance();
		int h = c.get(Calendar.HOUR_OF_DAY); //현재시간
		int m = c.get(Calendar.MINUTE);	//현재 분
		int s = c.get(Calendar.SECOND);	//현재 초
		PrintWriter out = response.getWriter(); //클라이언트로 전송할 출력 스트림
		out.println("<html><head><title>현재시간</title></head>");
		out.println("<body>");
		out.println("<h1>현재시간은" + h + "시" + m + "분" + s + "초 입니다.</h1>");
		out.println("</body></html>");
	}
	//Post 방식 요청시 호출되는 메서드
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
