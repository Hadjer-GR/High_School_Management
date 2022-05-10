package Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Type_Account;

/**
 * Servlet implementation class Class
 */
@WebServlet("/Class")
public class Class extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		resp.setContentType("text/html");
		  req.setCharacterEncoding("UTF-8");

		Type_Account type_Account = (Type_Account) req.getSession().getAttribute("type_account");
		if (type_Account != null) {
			
			this.getServletContext().getRequestDispatcher("/Teacher/Class.jsp").forward(req, resp);

			
		}else {
			
			
			 resp.sendRedirect(req.getContextPath() + "/login");

			
			
		}
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
