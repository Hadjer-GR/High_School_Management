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
import Model.Emploi;
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
				 ArrayList<Emploi> list_emploi= new ArrayList();
				 ArrayList<Teacher> list_teacher_emploi= new ArrayList();
				 
              Group group;
              AdminDAO admin =new AdminDAO();
              
              try {
            	  group=user.class_info(class_id);
				  matieres=admin.class_matiere(group.getId_niveau(), group.getSpecialiste());
				  list_emploi=admin.show_emploi_class(class_id);
				  list_teacher_emploi=admin.enseig_emploi_class(class_id);


			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
             
  		      req.setAttribute("step", step_1);
              req.setAttribute("class_id", class_id);
              req.setAttribute("matieres", matieres);
              req.setAttribute("list_emploi", list_emploi);
              req.setAttribute("list_teacher_emploi", list_teacher_emploi);
              
  			this.getServletContext().getRequestDispatcher("/admin/EmploiGroup.jsp").forward(req, resp);

			
		}else {
			
			 resp.sendRedirect(req.getContextPath() + "/login");

			
		}
		
		
		
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		   String class_id =(String)req.getSession().getAttribute("class_id");
		   String emploi_id =(String)req.getSession().getAttribute("emploi_id");
		   String enseig_id=req.getParameter("Enseig");
		  System.out.println("\n enseig_id \n"+enseig_id +"class"+class_id);
          AdminDAO admin =new AdminDAO();

          try {
			admin.emploi_enseig(emploi_id, enseig_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         resp.sendRedirect(req.getContextPath() + "/Showemploi");

		
		
	}

}
