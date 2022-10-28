package insoo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.hc.client5.http.fluent.Request;

/**
 * Servlet implementation class Api
 */
@WebServlet("/webPro/Api")
public class Api extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Api() {
        super();    
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String rtnStr = Request.get("https://www.joongang.co.kr/article/25112397#home")
	    .execute().returnContent().asString();
		
		PrintWriter out = response.getWriter();
		out.print(rtnStr); // 요청받은 
		
	}

}
