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
import Model.Teacher;
import Model.Type_Account;
import Model.UserDAO;

/**
 * Servlet implementation class addTeacher
 */
@WebServlet("/addTeacher")
public class addTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addTeacher() {
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
			RequestDispatcher dispatchor=req.getRequestDispatcher("/admin/add.jsp");
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
		 Teacher  teacher =new  Teacher();
		 Account account= new Account();
		 
		 UserDAO user=new UserDAO();
		 AdminDAO adminDAO=new AdminDAO();
		 int id_account ;
		 id_account = -1;

		 
		 /*
		  * 
		  * 
		  */
		 
		 teacher.setEmail(req.getParameter("email"));
		 teacher .setContact_number(req.getParameter("numero"));
		 teacher .setFirst_name(req.getParameter("name"));
		 teacher .setLast_name(req.getParameter("prenom"));
		
		 teacher .setDate_birth(req.getParameter("date"));
		 teacher .setModule(req.getParameter("modul"));
	
		 account.setUsername(req.getParameter("usernam"));
		 account.setPassword(req.getParameter("modepass"));
		
		 
		 try {
			adminDAO.addAccount(account);
			id_account=user.checklogin(account.getUsername(), account.getPassword());
			 System.out.print("email"+req.getParameter("email"));
               teacher.setId_account(id_account);
               adminDAO.addTeacher(teacher);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		
		

	    resp.sendRedirect(req.getContextPath() + ("/addTeacher"));
		 

	

		
	
	}

}
