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
import javax.servlet.http.HttpSession;

import Model.Group;
import Model.Resulte;
import Model.Student;
import Model.Type_Account;
import Model.UserDAO;

/**
 * Servlet implementation class StudentList
 */
@WebServlet("/StudentList")
public class StudentList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentList() {
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
     	
                	ArrayList<Resulte> student_resulte=new ArrayList();

                     Group groupe =new Group();
               	  String class_id=req.getParameter("id_class");
                  String nom_matiere;
					System.out.println(class_id);

        			UserDAO user=new UserDAO();

        			
        			try {
 						System.out.println("\n Student List class_id : \n"+class_id);

              		  nom_matiere=user.get_teacher_matiere(type_Account.getId_user());

 						student_resulte=user.student_Resulte(class_id, nom_matiere);
						groupe=user.class_info(class_id);
                         if(student_resulte.isEmpty()) {
                        	 
                         }else {
                        	 
                        	 
     						System.out.println("\n list Student \n"+student_resulte.get(0).getDevoir_1());

                         }
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
                	
                	
                	
        			req.setAttribute("student_resulte", student_resulte);

        			req.setAttribute("groupe", groupe);

					  RequestDispatcher dispatchor=req.getRequestDispatcher("/Teacher/students.jsp");
					  dispatchor.forward(req, resp);	
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
		  String nom_matiere;
		  int id=-1;
		  Double devoir_1;
		  Double devoir_2,evalut,control,eleve_id;
		  
      id=Integer.parseInt(req.getParameter("id"));
      devoir_1=Double.valueOf(req.getParameter("devoir_1"))   ;

      evalut= Double.valueOf(req.getParameter("evalut"));
     devoir_2=Double.valueOf(req.getParameter("devoir_2")) ;
     control=Double.valueOf(req.getParameter("control")) ;
     eleve_id= Double.valueOf(req.getParameter("eleve_id")) ;
 
     System.out.println("\n resulte"+ id+devoir_1+devoir_2+eleve_id+control);

    Type_Account type_Account = (Type_Account) req.getSession().getAttribute("type_account");
      UserDAO user=new UserDAO();

   
   if(id <=0) {
	   // insert in table resulte 
		  try {
			nom_matiere=user.get_teacher_matiere(type_Account.getId_user());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	   
   }else {
	   
	  Resulte resulte=new Resulte();
	   
	  resulte.setEvalution(evalut);
	  resulte.setDevoir_1(devoir_1);
	  resulte.setDevoir_2(devoir_2);
	  resulte.setControl(control);
	  resulte.setId(id);
	   
	   
	   try {
		user.edite_Resulte(resulte);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   
			 resp.sendRedirect(req.getContextPath() + "/StudentList");

	   
   }
		 
		
		
		
	}

}
