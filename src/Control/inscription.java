package Control;

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

import Model.Inscription;
import Model.UserDAO;


/**
 * Servlet implementation class inscription
 */
@WebServlet("/inscription")
@MultipartConfig(maxFileSize = 16177215)   
public class inscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 resp.setContentType("text/html");
		 Inscription inscript=new Inscription();
		 UserDAO user=new UserDAO();
		 inscript.setEmail(req.getParameter("email"));
		
		 
		 inscript.setNumber(req.getParameter("contact_number"));
		 inscript.setFirst_name(req.getParameter("first_name"));
		 inscript.setLast_name(req.getParameter("last_name"));
		 inscript.setAcademic_year(req.getParameter("academic_year"));
		 inscript.setDate_birth(req.getParameter("date_birth"));
		 Part filePart = req.getPart("uploadfile");
		 inscript.setInputStream(filePart.getInputStream());
		 
		 try {
			user.insert_inscription(inscript);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 System.out.print(req.getParameter("first_name"));

		 resp.sendRedirect(req.getContextPath() + "/Home");
		 

	}

}
