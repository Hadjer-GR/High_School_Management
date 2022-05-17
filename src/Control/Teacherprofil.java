package Control;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Model.Account;
import Model.Teacher;
import Model.Type_Account;
import Model.UserDAO;

/**
 * Servlet implementation class Teacherprofil
 */
@WebServlet("/Teacherprofil")
@MultipartConfig(maxFileSize = 16177215)   

public class Teacherprofil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Teacherprofil() {
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
			
			UserDAO  user=new UserDAO();
			Teacher teacher=new Teacher();
			Account account=new Account();

			
			try {
				teacher=user.teacher_info(type_Account.getId_user());
				account=user.account_info(type_Account.getId_account());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
						
				  req.setAttribute("teacher", teacher);
				  req.setAttribute("account", account);
			      	System.out.print("account username :"+account.getUsername() );

			      	System.out.print("id teacher:"+type_Account.getId_user() );

			      	System.out.print(teacher.getFirst_name()+"<br>");

		      	System.out.print(teacher.getEmail());

		   // set img profil 
		      	
		      	InputStream is =teacher.getImg();
		      	
		      	if(is != null) {

		      	String uploadpath="E:/SmartSchool/WebContent/img/teacherprofil.jpg";
		      	
		      	try {
					
		      		
		    		FileOutputStream fos=new FileOutputStream(uploadpath);
		    		
		    		
		    		byte[]data=new byte[is.available()];
		    		is.read(data);
		    		fos.write(data);
		    		fos.close();
		    		System.out.println("imge is add");
		    		}
		    		catch(Exception e) {
		    			e.printStackTrace();
		    		}
		      		
		      	}
		      	
		      	
		      	
		      	
		      	
		      	
		      	
					RequestDispatcher dispatchor=req.getRequestDispatcher("/Teacher/profil.jsp");
					  dispatchor.forward(req, resp);	
			
			
			
		} else {
			
			 resp.sendRedirect(req.getContextPath() + "/login");

			
		}
		
		
	}	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
	
	
	
	

}
