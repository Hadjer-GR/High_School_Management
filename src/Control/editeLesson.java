package Control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Cahier_text;
import Model.Group;
import Model.Mati?re;
import Model.Type_Account;
import Model.UserDAO;

/**
 * Servlet implementation class editeLesson
 */
@WebServlet("/editeLesson")
public class editeLesson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editeLesson() {
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

	  			       String nom_matiere=(String)req.getSession().getAttribute("matier_name");;
	  			      String class_id=(String)req.getSession().getAttribute("class_id");
	          		    Group groupe =( Group) req.getSession().getAttribute("groupe");
                         String lesson_id=req.getParameter("id");
                            int enseig_id=  type_Account.getId_user();
              				  ArrayList<Cahier_text> lesson_textbook=new ArrayList();

                              
	          			 Cahier_text  lesson=new Cahier_text();
	          	       
	          		       try {
	          		    	 lesson=user.get_lesson(lesson_id);
	          		    	 lesson_textbook=user.textbook_lesson(class_id, nom_matiere, enseig_id);
	          		    	   
	          			} catch (SQLException e) {
	          				// TODO Auto-generated catch block
	          				e.printStackTrace();
	          			}
	          		      
	                	  
	          		       
	          		        
		          		     req.setAttribute("groupe", groupe);

	          		     req.setAttribute("matier_name", nom_matiere);
	    			     req.setAttribute("listlesson", lesson_textbook);
	          		       req.setAttribute("lesson", lesson);
	        		 		this.getServletContext().getRequestDispatcher("/Teacher/cahier.jsp").forward(req, resp);

	                  }else {
	                	  
	      				this.getServletContext().getRequestDispatcher("/home.jsp").forward(req, resp);

	                  }
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 UserDAO user=new UserDAO();
		 int id=Integer.parseInt(req.getParameter("id"));
		 String text =req.getParameter("contentleson");
		 
		
		 try {
			user.edite_lesson(text, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 resp.sendRedirect(req.getContextPath() + "/cahier");

		
		
	}

}
