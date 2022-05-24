package Control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Account;
import Model.AdminDAO;
import Model.Secretaire;
import Model.Type_Account;
import Model.UserDAO;

/**
 * Servlet implementation class addSecretaire
 */
@WebServlet("/addSecretaire")
public class addSecretaire extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addSecretaire() {
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
			RequestDispatcher dispatchor=req.getRequestDispatcher("/admin/AddProfil2.jsp");
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
 		 Secretaire  secri =new  Secretaire();
 		 Account account= new Account();
 		 
 		 UserDAO user=new UserDAO();
 		 AdminDAO adminDAO=new AdminDAO();
		 int id_account ;
		 id_account = -1;
		 /*
		  * 
		  */
 		
 		secri.setFirst_name(req.getParameter("nom"));
 		secri.setLast_name(req.getParameter("prenom"));
 		secri.setDate_birth(req.getParameter("date"));
 		secri.setEmail(req.getParameter("email"));
 		secri.setContact_number(req.getParameter("numero"));
 		
 	
 		 account.setUsername(req.getParameter("username"));
 		 account.setPassword(req.getParameter("password"));
 		
 		
 		 
 		 try {
 			adminDAO.addAccount(account);
 			id_account=user.checklogin(account.getUsername(), account.getPassword());
 	 		 System.out.println("id_account \n"+id_account);

              secri.setId_account(id_account);
              adminDAO.addsecri(secri);
 			
 			
 		} catch (SQLException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		} catch (ClassNotFoundException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}
 		 
 		
 		

 	    resp.sendRedirect(req.getContextPath() + ("/addSecretaire"));
 		 

	}

}
