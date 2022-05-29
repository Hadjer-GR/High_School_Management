package Control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Emploi;
import Model.Group;
import Model.Matiére;
import Model.Type_Account;
import Model.UserDAO;

/**
 * Servlet implementation class ShowClass
 */
@WebServlet("/ShowClass")
public class ShowClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowClass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		  req.setCharacterEncoding("UTF-8");
		  Type_Account type_Account = (Type_Account) req.getSession().getAttribute("type_account");
			if (type_Account != null) {
				  String class_id=req.getParameter("class_id");
				  HttpSession ses =req.getSession();
				  ses.setAttribute("class_id", class_id);		
				 resp.sendRedirect(req.getContextPath() + "/ShowProgramClass");

			}else {
				
				 resp.sendRedirect(req.getContextPath() + "/login");

				
			}
		
		

	}
}
