package Control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.UserDAO;

/**
 * Servlet implementation class deleteLesson
 */
@WebServlet("/deleteLesson")
public class deleteLesson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteLesson() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		 req.setCharacterEncoding("UTF-8");

	    int id=Integer.parseInt(req.getParameter("id"));
		UserDAO user=new UserDAO();
	
		try {
			user.delet_lesson(id);;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			RequestDispatcher dispatchor=req.getRequestDispatcher("/listLesson");
			  dispatchor.forward(req, resp);
		
	}
	

}
