package Control;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Cahier_text;
import Model.Group;
import Model.Matiére;
import Model.Type_Account;
import Model.UserDAO;

/**
 * Servlet implementation class cahier
 */
@WebServlet("/cahier")
public class cahier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cahier() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html");
		  req.setCharacterEncoding("UTF-8");
		 
        
        
          HttpSession ses=req.getSession();
        
        	   String class_id= req.getParameter("id_class");
              ses.setAttribute("class_id", class_id);
             
		Type_Account type_Account = (Type_Account) req.getSession().getAttribute("type_account");

                  if (type_Account != null) {
                	  //1. get the class_id for get the rest information of the class
                	  // 2. get the matiere name the the teacher study
   	 
                	  UserDAO user=new UserDAO();
                	  Group groupe=new Group();
                	    ArrayList<Integer> matieres_id=new ArrayList();
                	    Matiére matiere =new Matiére();
                	    Cahier_text mylesson =new Cahier_text();  
      				  ArrayList<Cahier_text>listlesson=new ArrayList();

                	  
                	  String id=(String)req.getSession().getAttribute("class_id");
                	
                	  try {
						groupe=user.class_info(id);
						System.out.println("\n id :"+id);
						matieres_id=user.matiere_enseign_class(groupe.getId_niveau(), type_Account.getId_user());	
						matiere=user.nom_matiere(matieres_id,groupe.getSpecialiste());
				       listlesson=user.lesson_matiere(groupe.getCahier_id(),matiere.getId(),type_Account.getId_user());

					} catch (NumberFormatException | SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
                	  
                	  ses.setAttribute("groupe", groupe);
                	  ses.setAttribute("matiere", matiere);
          		
			      req.setAttribute("matier_name", matiere.getNom_matiere());
		         req.setAttribute("listlesson",listlesson);
		              req.setAttribute("groupe", groupe);
		            
		 		this.getServletContext().getRequestDispatcher("/Teacher/cahier.jsp").forward(req, resp);

		}else {
			

				this.getServletContext().getRequestDispatcher("/home.jsp").forward(req, resp);
			
		}
			
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
			 resp.setContentType("text/html");
			  req.setCharacterEncoding("UTF-8");
			  Cahier_text mylesson =new  Cahier_text();
			  UserDAO user=new UserDAO();
			  
			     Group groupe=(Group)req.getSession().getAttribute("groupe");
			     Matiére matiere=( Matiére)req.getSession().getAttribute("matiere");

				Type_Account type_Account = (Type_Account) req.getSession().getAttribute("type_account");

			  PrintWriter out=resp.getWriter();
			 // get the date 
				Date d=new Date();
				int mm=d.getMonth()+1;
				int dd=d.getDate();
				int y=d.getYear()-100+2000;
		     String Lesson_date=y+"-"+mm+"-"+dd;
		     mylesson.setText(req.getParameter("contentleson"));
		     mylesson.setDate(Lesson_date);
		     mylesson.setMatiere_id(matiere.getId());
		     mylesson.setEnseig_id(type_Account.getId_user());
		     mylesson.setCahier(groupe.getCahier_id());
		     
		     try {
				user.add_Lesson(mylesson);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
			 resp.sendRedirect(req.getContextPath() + "/listLesson");
	    	
		}
		
		
		
		
		
		
	

}
