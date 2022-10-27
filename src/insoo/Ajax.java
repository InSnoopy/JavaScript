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
		System.out.println("전달된 내용 >> " + nm);
		
		response.setCharacterEncoding("utf-8"); // 응답데이터 한글 깨짐 처리
		// PrintWriter : 서브릿으로 들어온 요청을 텍스트형태로 응답하기 위한 출력 스트림
		PrintWriter out = response.getWriter();
		out.print("<h1>로보카" + nm + "</h1>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String nm = request.getParameter("key");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print("{\"key\":\""+nm+"\"}"); // json object형태의 데이터를 전달하기
	}

}
