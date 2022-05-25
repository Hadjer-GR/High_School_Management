package Control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.AdminDAO;
import Model.Group;
import Model.Type_Account;

/**
 * Servlet implementation class AddClass
 */
@WebServlet("/AddClass")
public class AddClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddClass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		  req.setCharacterEncoding("UTF-8");
		  req.getParameter("\n Add Class \n :");

		  req.getParameter("nbr_class");
		  req.getParameter("spet");
		  req.getParameter("niv_id");
		  System.out.println( req.getParameter("\n Add Class \n :"));
		  System.out.println( req.getParameter("nbr_class"));
		  System.out.println(  req.getParameter("spet"));
		  System.out.println(   req.getParameter("niv_id"));

			Type_Account type_Account = (Type_Account) req.getSession().getAttribute("type_account");

		  if (type_Account != null) {
		  
			  Group groupe=new Group();
			  groupe.setId_niveau(Integer.parseInt( req.getParameter("niv_id")));
			  groupe.setId_period(1);
			  groupe.setNbr_class( Integer.parseInt( req.getParameter("nbr_class")));
			  groupe.setSpecialiste( req.getParameter("spet"));
			  
			  AdminDAO admin=new AdminDAO();
			  
			  
			  try {
				admin.addClass(groupe);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			  
			
				 resp.sendRedirect(req.getContextPath() + "/emploi");

				
				
				
				
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
