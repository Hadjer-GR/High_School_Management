package Control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Emploi;
import Model.Group;
import Model.Type_Account;
import Model.UserDAO;

/**
 * Servlet implementation class Schedule
 */
@WebServlet("/Schedule")
public class Schedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Schedule() {
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
			 UserDAO user =new UserDAO();
			
			 ArrayList<Emploi> list_emploi= new ArrayList();
			 ArrayList<Group> class_emploi= new ArrayList();

			 int enseig_id=type_Account.getId_user();
			
			 
			 try {
				list_emploi=user.show_emploi_teacher(enseig_id);
				class_emploi=user.show_teacher_class(enseig_id);
				 
				 
				 req.setAttribute("class_emploi", class_emploi);
				 req.setAttribute("list_emploi", list_emploi);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
			 
			
			

          
			this.getServletContext().getRequestDispatcher("/Teacher/schedule.jsp").include(req, resp);
			
		}else {
			
			 resp.sendRedirect(req.getContextPath() + "/login");

			
			
			
			
		}
		
		
		
	}

	
}
