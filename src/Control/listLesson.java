package Control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Lesson;
import Model.UserDAO;

/**
 * Servlet implementation class listLesson
 */
@WebServlet("/listLesson")
public class listLesson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public listLesson() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 resp.setContentType("text/html");
		  req.setCharacterEncoding("UTF-8");
		  Lesson mylesson =new Lesson();
		  UserDAO user=new UserDAO();
		  ArrayList< Lesson>listlesson=new ArrayList();
       
	       try {
	    	   listlesson=user.select_all_Lesson();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	      
         req.setAttribute("listlesson",listlesson);
 		this.getServletContext().getRequestDispatcher("/Teacher/textbook.jsp").forward(req, resp);


		
		
	}

	

}
