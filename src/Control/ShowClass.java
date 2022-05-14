package Control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Emploi;
import Model.Group;
import Model.Matiére;
import Model.Type_Account;
import Model.UserDAO;

/**
 * Servlet implementation class ShowClass
 */
@WebServlet("/ShowClass")
public class ShowClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowClass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		  req.setCharacterEncoding("UTF-8");
		int class_id=Integer.parseInt( req.getParameter("class_id"));
		System.out.println("\n "+" Show class servlet ");

		System.out.println("class_id is :"+class_id);
		 
		Type_Account type_Account = (Type_Account) req.getSession().getAttribute("type_account");
		if (type_Account != null) {
			int emploi_class_id =0;
			UserDAO user=new UserDAO();
			ArrayList<Emploi> programme=new ArrayList();
			ArrayList<Integer>list_matiers_id=new ArrayList();
			ArrayList<Matiére> programme_matiére_class=new ArrayList();
			Group groupe=new Group();
			 int  nbr_repeat=0;
			
			
			try {
				groupe=user.class_info(class_id);
				emploi_class_id=user.emploi_class_id(class_id);
				programme=user.programme_class(emploi_class_id);
				if(programme.isEmpty()) {
					System.out.println("\n the list of program is null");
				}else {
					
					 list_matiers_id=user.list_matiere_id(emploi_class_id);

					  programme_matiére_class=user.programme_class_matiere(list_matiers_id);
				     nbr_repeat=list_matiers_id.size();
					
					
				}
				
			} catch (SQLException e) {
				
}
			
			 req.setAttribute("programme", programme);
		    req.setAttribute("programme_matiére", programme_matiére_class);
		    req.setAttribute("size",  nbr_repeat);
			req.setAttribute("groupe", groupe);
			

			this.getServletContext().getRequestDispatcher("/Teacher/groupe.jsp").forward(req, resp);
			
		}else {
			
			
			 resp.sendRedirect(req.getContextPath() + "/login");
			
			
		}
		
		
	}

	
}
