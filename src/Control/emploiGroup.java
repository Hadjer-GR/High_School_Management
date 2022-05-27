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
import Model.Emploi;
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
		  String class_id =(String)req.getSession().getAttribute("class_id");
		  boolean dispSalle =false;
		  boolean dispClass =false;

 AdminDAO admin =new AdminDAO();

 try {
	 dispSalle=admin.virefie_salle(open_time, day, salle);
	 dispClass=admin.virefie_class(open_time, day, class_id);
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
  
	       
		System.out.println("\n dispSalle:"+dispSalle);
		System.out.println("\n dispClass:"+dispClass);

		if(dispSalle &&  dispClass) {
			 ArrayList<Teacher> teacher_matiere= new ArrayList();
			 try {
				teacher_matiere=admin.Teacher_disp(day, open_time, matiere);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
             int id=Integer.parseInt(class_id);
			 int d=Integer.parseInt(salle);
			 Emploi emploi =new Emploi();
			 emploi.setClass_id(id); 
			 emploi.setDay(day);
			 emploi.setOpen_time(open_time);
			 emploi.setMatiere(matiere);
			 emploi.setSalle(d);
			 // insert in emploi de temps
			  int emploi_id =0;
			  String id_emploi;
			  ArrayList<Emploi> list_emploi= new ArrayList();
				 ArrayList<Teacher> list_teacher_emploi= new ArrayList();
			 try {
				admin.insert_emploi(emploi);
				emploi_id=admin.get_emploi_id(emploi);
				id_emploi=String.valueOf(emploi_id);
				 list_emploi=admin.show_emploi_class(class_id);
				  list_teacher_emploi=admin.enseig_emploi_class(class_id);
				 HttpSession ses =req.getSession();
				  ses.setAttribute("emploi_id", id_emploi);
				  System.out.println("\n emploi_id \n " +id_emploi);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
			 
			 
			 req.setAttribute("teacher_matiere",teacher_matiere);
			 req.setAttribute("list_emploi", list_emploi);
             req.setAttribute("list_teacher_emploi", list_teacher_emploi);
  			req.setAttribute("step", 1);
  			this.getServletContext().getRequestDispatcher("/admin/EmploiGroup.jsp").forward(req, resp);

			
		}else {
			if(dispClass) {
				req.setAttribute("dispclass", "1");
				req.setAttribute("salle", "0");

			}else {
				req.setAttribute("dispclass", "0");

				if(dispSalle) {
					req.setAttribute("salle", "1");

               	 
                }else {
					req.setAttribute("salle", "0");
					

                }
				
			}
			
  			
			req.setAttribute("step", 2);
  			this.getServletContext().getRequestDispatcher("/admin/EmploiGroup.jsp").forward(req, resp);
			
		}
		


	}

}
