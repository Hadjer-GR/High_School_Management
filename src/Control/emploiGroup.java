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

import Model.AdminDAO;
import Model.Group;
import Model.Teacher;
import Model.Type_Account;
import Model.UserDAO;

/**
 * Servlet implementation class emploiGroup
 */
@WebServlet("/emploiGroup")
public class emploiGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public emploiGroup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 resp.setContentType("text/html");
		  req.setCharacterEncoding("UTF-8");
		  String class_id;
		  class_id= req.getParameter("class_id");

		  System.out.println("class emploi"+class_id );
		  HttpSession ses =req.getSession();
		  ses.setAttribute("class_id", class_id);
        

			 resp.sendRedirect(req.getContextPath() + "/Showemploi");


		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    System.out.println(" \n Add event \n");
   String day ="";
   String open_time="" ;
   String matiere="";  
   String salle="";
		day= req.getParameter("day");
		open_time=req.getParameter("open_time");
		 matiere=  req.getParameter("matiere");
		 salle=req.getParameter("salle");
		  System.out.println("kkk"+open_time +"hhh" +day+"mm"+matiere +"salee:"+salle);
     
		  boolean disp =false;
		  
 AdminDAO admin =new AdminDAO();

 try {
	disp=admin.virefie_salle(open_time, day, salle);
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
  
	       
		System.out.println("\n disp:"+disp);
		if(disp) {
			 ArrayList<Teacher> teacher_matiere= new ArrayList();
			 try {
				teacher_matiere=admin.Teacher_disp(day, open_time, matiere);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
             req.setAttribute("teacher_matiere",teacher_matiere);

  			req.setAttribute("step", 1);
  			this.getServletContext().getRequestDispatcher("/admin/EmploiGroup.jsp").forward(req, resp);

			
		}else {
  			req.setAttribute("step", 2);
  			this.getServletContext().getRequestDispatcher("/admin/EmploiGroup.jsp").forward(req, resp);

			
		}
		


	}

}
