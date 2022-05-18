package Control;

import java.io.IOException;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Cahier_text;
import Model.Group;
import Model.Matiére;
import Model.Type_Account;
import Model.UserDAO;

/**
 * Servlet implementation class listLesson
 */
@WebServlet("/listLesson")
public class listLesson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public listLesson() {
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
         
		    Cahier_text mylesson =new Cahier_text();
		    Matiére matiere =( Matiére) req.getSession().getAttribute("matiere");
		    Group  groupe =( Group) req.getSession().getAttribute("groupe");

			  UserDAO user=new UserDAO();
			  ArrayList<Cahier_text>listlesson=new ArrayList();
	       
		       try {
		    	   listlesson=user.lesson_matiere(groupe.getCahier_id(),matiere.getId(),type_Account.getId_user());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		       req.setAttribute("groupe", groupe);
            req.setAttribute("matier_name", matiere.getNom_matiere());
	         req.setAttribute("listlesson",listlesson);
	 		this.getServletContext().getRequestDispatcher("/Teacher/cahier.jsp").forward(req, resp);
		}else {
			
			 resp.sendRedirect(req.getContextPath() + "/login");

			
			
		}
		


		
		
	}

	

}
