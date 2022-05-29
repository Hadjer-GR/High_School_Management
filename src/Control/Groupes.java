package Control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Group;
import Model.Type_Account;
import Model.UserDAO;

/**
 * Servlet implementation class Groupes
 */
@WebServlet("/Groupes")
public class Groupes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Groupes() {
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
			
			UserDAO user=new UserDAO();
			ArrayList<Group> class_list=new ArrayList();
			 int teacher_id=type_Account.getId_user();
           
			try {
				class_list=user.show_teacher_class(teacher_id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			req.setAttribute("class_list", class_list);
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
