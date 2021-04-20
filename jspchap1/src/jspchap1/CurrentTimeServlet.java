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
// => CurrentTimeServlet ������ ȣ��
@WebServlet("/CurrentTimeServlet")
public class CurrentTimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CurrentTimeServlet() {
        super();
    }
    //Get ��� ��û�� ȣ��Ǵ� �޼���
    //request : ��û��ü. Ŭ���̾�Ʈ�� ������ ������ ���� ����
    //response : ���䰴ü. ������ Ŭ���̾�Ʈ�� ������ ���� ����
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=EUC-KR");
		Calendar c = Calendar.getInstance();
		int h = c.get(Calendar.HOUR_OF_DAY); //����ð�
		int m = c.get(Calendar.MINUTE);	//���� ��
		int s = c.get(Calendar.SECOND);	//���� ��
		PrintWriter out = response.getWriter(); //Ŭ���̾�Ʈ�� ������ ��� ��Ʈ��
		out.println("<html><head><title>����ð�</title></head>");
		out.println("<body>");
		out.println("<h1>����ð���" + h + "��" + m + "��" + s + "�� �Դϴ�.</h1>");
		out.println("</body></html>");
	}
	//Post ��� ��û�� ȣ��Ǵ� �޼���
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
