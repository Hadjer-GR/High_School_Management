package Control;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
        
        	   String class_id= (String)req.getSession().getAttribute("class_id");
              
             
		Type_Account type_Account = (Type_Account) req.getSession().getAttribute("type_account");

                  if (type_Account != null) {
                	  //1. get the class_id for get the rest information of the class
                	  // 2. get the matiere name the the teacher study
   	 
                	  UserDAO user=new UserDAO();
                	  int enseig_id=type_Account.getId_user();
                	  Group groupe=new Group();
                	    String nom_matiere="";
                	    
      				  ArrayList<Cahier_text> lesson_textbook=new ArrayList();

                	  
                	  String id=(String)req.getSession().getAttribute("class_id");
                	
                	  try {
						
                		  nom_matiere=user.get_teacher_matiere(enseig_id);
					      groupe=user.class_info(id);
					      lesson_textbook=user.textbook_lesson(class_id, nom_matiere, enseig_id);
				     

					} catch (NumberFormatException | SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
                	  
                	  ses.setAttribute("groupe", groupe);
                	 
    			ses.setAttribute("matier_name", nom_matiere);	
			     req.setAttribute("matier_name", nom_matiere);
			     req.setAttribute("listlesson", lesson_textbook);

		            
		 		this.getServletContext().getRequestDispatcher("/Teacher/cahier.jsp").forward(req, resp);

		}else {
			

			 resp.sendRedirect(req.getContextPath() + "/login");
			
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
			  
			    String class_id=(String)req.getSession().getAttribute("class_id");
				Type_Account type_Account = (Type_Account) req.getSession().getAttribute("type_account");
			      String nom_matiere=(String)req.getSession().getAttribute("matier_name");;

			  PrintWriter out=resp.getWriter();
			 // get the date 
			  
			 
				Date d=new Date();
				
				
				int mm=d.getMonth()+1;
				int dd=d.getDate()+1;
				int y=d.getYear()-100+2000;
		     String Lesson_date=y+"-"+mm+"-"+dd;
		    
		      mylesson.setText(req.getParameter("contentleson"));
		      mylesson.setDate(Lesson_date);
		      mylesson.setMatiere(nom_matiere);
		      mylesson.setEnseig_id(type_Account.getId_user());
		      mylesson.setClass_id(class_id);
		    
		      
		    
		      
		     try {
				user.add_Lesson(mylesson);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
			 resp.sendRedirect(req.getContextPath() + "/cahier");
	    	
		}
		
		
		
		
		
		
	

}
