package site;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/index.do")
public class index extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public index() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// board 게시판 정보를 읽어와서 응답해봅시다..
		// 
		
		RequestDispatcher disp = request.getRequestDispatcher("WEB-INF/test/index.jsp");
		disp.forward(request, response);
	
	}

}
