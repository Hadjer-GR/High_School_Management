package Control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.AdminDAO;
import Model.Group;
import Model.Type_Account;
import Model.UserDAO;

/**
 * Servlet implementation class emploi
 */
@WebServlet("/emploi")
public class emploi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public emploi() {
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
			
			AdminDAO user=new AdminDAO();
			ArrayList<Group> list_class=new ArrayList();
			
			
			try {
				list_class=user.show_class();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			req.setAttribute("class_list", list_class);

			
			
			
			
			RequestDispatcher dispatchor=req.getRequestDispatcher("/admin/Emploi.jsp");
			  dispatchor.forward(req, resp);	
			
			
			
			
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
