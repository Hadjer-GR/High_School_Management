package Control;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Model.Account;
import Model.Inscription;
import Model.Teacher;
import Model.Type_Account;
import Model.UserDAO;

/**
 * Servlet implementation class UpdateTeacher
 */
@WebServlet("/UpdateTeacher")
@MultipartConfig(maxFileSize = 16177215)   

public class UpdateTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		   resp.setContentType("image/png");
		  req.setCharacterEncoding("UTF-8");
		  

	  Type_Account type_Account = (Type_Account) req.getSession().getAttribute("type_account");

		System.out.print("update user name5555 "+req.getParameter("username"));
		System.out.print("first name6655 "+req.getParameter("first_name"));
		System.out.print("last name5555 "+req.getParameter("last_name"));


		UserDAO  user=new UserDAO();
		Teacher teacher=new Teacher();
		Account account=new Account();
		
		// teacher
		teacher.setId(type_Account.getId_user());
		teacher.setFirst_name(req.getParameter("first_name"));
		teacher.setLast_name(req.getParameter("last_name"));
		
		teacher.setContact_number(req.getParameter("contact_number"));
		teacher.setEmail(req.getParameter("email"));
		//
		// we store img
				Part file=req.getPart("file");
				if(file != null) {
				
				teacher.setImg(file.getInputStream());

		}
				
		
		// account 
		
		account.setId(type_Account.getId_account());
		account.setUsername(req.getParameter("username"));
		account.setPassword(req.getParameter("password"));

		try {
			user.update_teacher(teacher);
			user.update_Account(account);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		 resp.sendRedirect(req.getContextPath() + "/Teacherprofil");
		 
		
	
		
	}

}
