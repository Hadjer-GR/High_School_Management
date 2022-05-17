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
			 ArrayList<Integer> emploi_temp_id=new ArrayList();
			  ArrayList<Emploi> list_emploi=new ArrayList();
			  ArrayList<Integer> list_emploi_id=new ArrayList();

			  ArrayList<Group> class_emploi=new ArrayList();
			  
			 
			  try {
				emploi_temp_id=user.teacher_emploi(type_Account.getId_user());
			    list_emploi=user.teacher_emploi_info(emploi_temp_id);
			    list_emploi_id=user.list_emploi_id(emploi_temp_id);
			    class_emploi=user.class_emploi(list_emploi_id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
			 req.setAttribute("list_emploi", list_emploi);
			 req.setAttribute("class_emploi", class_emploi);
			// System.out.println("class_emploi.size"+class_emploi.size());
			// System.out.println("comlpet schedule section");
			
			 
			  System.out.println("Genie 1:"+class_emploi.get(0).getSpecialiste());
			  System.out.println("Genie 2:"+class_emploi.get(1).getSpecialiste());

          
			this.getServletContext().getRequestDispatcher("/Teacher/schedule.jsp").include(req, resp);
			
		}else {
			
			 resp.sendRedirect(req.getContextPath() + "/login");

			
			
			
			
		}
		
		
		
	}

	
}
