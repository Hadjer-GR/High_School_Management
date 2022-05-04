package Control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Lesson;

import Model.UserDAO;

/**
 * Servlet implementation class addLesson
 */
@WebServlet("/addLesson")
public class addLesson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addLesson() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    
    
	


	







	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 resp.setContentType("text/html");
		  req.setCharacterEncoding("UTF-8");
		  Lesson mylesson =new Lesson();
		  UserDAO user=new UserDAO();
		  PrintWriter out=resp.getWriter();
		 // get the date 
			Date d=new Date();
			int mm=d.getMonth()+1;
			int dd=d.getDate();
			int y=d.getYear()-100+2000;
	     String Lesson_date=y+"-"+mm+"-"+dd;
	     
	     mylesson.setDate(Lesson_date);
	     mylesson.setText(req.getParameter("contentleson"));
	     /*
	       out.print(mylesson.getDate() +"<br>");
	       out.print(mylesson.getText());
	       */
	     try {
			user.add_Lesson(mylesson);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	     resp.sendRedirect(req.getContextPath() + "/listLesson");
    	
	}

}
