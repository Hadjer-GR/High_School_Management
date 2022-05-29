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
import Model.Matiére;
import Model.Teacher;
import Model.Type_Account;
import Model.UserDAO;

/**
 * Servlet implementation class ShowProgramClass
 */
@WebServlet("/ShowProgramClass")
public class ShowProgramClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowProgramClass() {
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
		String step;
		String close="";
		 close=req.getParameter("close");
				
		 if(close==null) {
			 
			 close="";
			 
		 }
	  step=(String) req.getSession().getAttribute("step");	
		if(step == null) {
			step="";
		}
				
				if (type_Account != null) {
			UserDAO user=new UserDAO();
		   String class_id =(String)req.getSession().getAttribute("class_id");

			
           ArrayList<String> matieres= new ArrayList();
		  ArrayList<Emploi> list_emploi= new ArrayList();
		 ArrayList<Teacher> list_teacher_emploi= new ArrayList();
				 
           Group group =new Group();
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
           req.setAttribute("groupe", group);

           req.setAttribute("class_id", class_id);
           req.setAttribute("matieres", matieres);
           req.setAttribute("list_emploi", list_emploi);
           req.setAttribute("list_teacher_emploi", list_teacher_emploi);
			
           if(close.equalsIgnoreCase("1")) {
        	   
        	   req.setAttribute("step", 0);
        	   
           }else {
        	   
        	   if(step.equalsIgnoreCase("1")) {
			       req.setAttribute("step", 1);

			}else {
			       req.setAttribute("step", 0);

			}
			
        	   
           }
			
				
		
			

			this.getServletContext().getRequestDispatcher("/Teacher/groupe.jsp").forward(req, resp);
			
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
