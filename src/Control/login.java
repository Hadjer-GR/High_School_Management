package Control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Type_Account;
import Model.UserDAO;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    
 	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 
		   HttpSession ses =req.getSession();
		   ses.removeAttribute("type_account");

		this.getServletContext().getRequestDispatcher("/home.jsp").forward(req, resp);

		
		
		
	}





	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  resp.setContentType("text/html");
		 
		 UserDAO user=new UserDAO();
		 int id_account=-1;
		
		 Type_Account type_Account =new Type_Account();
		 
		 try {
			 id_account=	user.checklogin(req.getParameter("username"), req.getParameter("password"));
			 System.out.print(id_account);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
          
		 if(id_account>0) {
			 HttpSession ses =req.getSession();
			
		
		 
			 try {
				 type_Account= user.type_account(id_account);
			    ses.setAttribute("type_account",  type_Account);

				 System.out.print("id :"+type_Account.getId_account() +" type :"+type_Account.getType());
				 

			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 if(type_Account.getType().equals("Parent")) {
			 		this.getServletContext().getRequestDispatcher("/Parent/index.jsp").forward(req, resp);

			 }else {
				 if(type_Account.getType().equals("Teacher")) {
				 		this.getServletContext().getRequestDispatcher("/Teacher/index.jsp").forward(req, resp);

				 }else {
					 
					 
					 if(type_Account.getType().equals("Admin")) {
						 resp.sendRedirect(req.getContextPath() + "/HomeAdmin");


					 }else {
						 
						 
						 if(type_Account.getType().equals("Secretaire")) {
						 		this.getServletContext().getRequestDispatcher("#").forward(req, resp);

						 }
						 
						 
					 }
					 
					 
					 
					 
					 
					 
					 
					 
				 }
			 }

		 }else {
		 		this.getServletContext().getRequestDispatcher("/home.jsp").forward(req, resp);

		 }
		
		
		
	}

}
