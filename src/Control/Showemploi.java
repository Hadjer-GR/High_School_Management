package Control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.AdminDAO;
import Model.Group;
import Model.Teacher;
import Model.Type_Account;
import Model.UserDAO;

/**
 * Servlet implementation class Showemploi
 */
@WebServlet("/Showemploi")
public class Showemploi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Showemploi() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
Type_Account type_Account = (Type_Account) req.getSession().getAttribute("type_account");

		
		if (type_Account!= null) {
			  String class_id =(String)req.getSession().getAttribute("class_id");
             
      	     int step_1=0;
               UserDAO user =new UserDAO();
              ArrayList<String> matieres= new ArrayList();
 			 ArrayList<Teacher> teacher_matiere= new ArrayList();
                 System.out.println("Class id in Get method"+class_id);
 			  
              Group group;
              AdminDAO admin =new AdminDAO();
              
              try {
            	  group=user.class_info(class_id);
				matieres=admin.class_matiere(group.getId_niveau(), group.getSpecialiste());
				
				


			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
             
  			req.setAttribute("step", step_1);
           req.setAttribute("class_id", class_id);
              req.setAttribute("matieres", matieres);
              
              
  			this.getServletContext().getRequestDispatcher("/admin/EmploiGroup.jsp").forward(req, resp);

			
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
