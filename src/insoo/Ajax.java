package insoo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ajax")
public class Ajax extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Ajax() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String nm = request.getParameter("aaa");
		System.out.println("���޵� ���� >> " + nm);
		
		response.setCharacterEncoding("utf-8"); // ���䵥���� �ѱ� ���� ó��
		// PrintWriter : ���긴���� ���� ��û�� �ؽ�Ʈ���·� �����ϱ� ���� ��� ��Ʈ��
		PrintWriter out = response.getWriter();
		out.print("<h1>�κ�ī" + nm + "</h1>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String nm = request.getParameter("key");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print("{\"key\":\""+nm+"\"}"); // json object������ �����͸� �����ϱ�
	}

}
