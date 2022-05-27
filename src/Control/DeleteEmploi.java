package Control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.AdminDAO;
import Model.Type_Account;

/**
 * Servlet implementation class DeleteEmploi
 */
@WebServlet("/DeleteEmploi")
public class DeleteEmploi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEmploi() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
Type_Account type_Account = (Type_Account) req.getSession().getAttribute("type_account");

		
		if (type_Account!= null) {
			  String Emploi_id =req.getParameter("emploi_id");
	          AdminDAO admin =new AdminDAO();

	          try {
				admin.delete_emploi(Emploi_id);
				admin.delete_enseig_emploi(Emploi_id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	          System.out.println("\n Delete Emploi \n");
			  
			  
			  
		         resp.sendRedirect(req.getContextPath() + "/Showemploi");

		}else {
			
			 resp.sendRedirect(req.getContextPath() + "/login");

			
		}
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		
		
	}

}
