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
@WebServlet("/Api2")
public class Api extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
   
    public Api() {
        super();    
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("utf-8");
		String keywd = request.getParameter("kwd");
		
		String rtnStr = Request.get("https://news.google.com/rss/search?q="+keywd+"&hl=ko&gl=KR&ceid=KR:ko")
	    .execute()
	    .returnContent()
	    .asString();
		
		PrintWriter out = response.getWriter();
		out.print(rtnStr); // 요청받은 
		
	}

}
