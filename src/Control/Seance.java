package Control;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Type_Account;
import Model.UserDAO;

/**
 * Servlet implementation class Seance
 */
@WebServlet("/Seance")
public class Seance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Seance() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		  req.setCharacterEncoding("UTF-8");
    	  HttpSession ses=req.getSession();
   	   ses.setAttribute("step", "0");

		Type_Account type_Account = (Type_Account) req.getSession().getAttribute("type_account");
		if (type_Account != null) {
			
		
		String day="";
		Date d=new Date();
		int mm=d.getMonth()+1;
		int dd=d.getDate()+1;
		int y=d.getYear()-100+2000;
        String Lesson_date=y+"-"+mm+"-"+dd;
       int h=d.getHours();
      
     Calendar c = Calendar.getInstance();
     c.setTime(d);
     int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
     System.out.println("Day of week in number:"+dayOfWeek);
     String dayWeekText = new SimpleDateFormat("EEEE").format(d);

     
   String time_1=Integer.toString(h)+":00";
   String time_2=Integer.toString(h-1)+":00";

    
       System.out.print(time_1+"time_2"+time_2);

         
		if(dayWeekText.equalsIgnoreCase("Sunday")) {
			
			day="Dimenche";
			
		}else {
			
			if(dayWeekText.equalsIgnoreCase("Monday")) {
				day="Lundi";
			}else {
				if(dayWeekText.equalsIgnoreCase("Tuesday")) {
					
					day="Mardi";
				}else {
					if(dayWeekText.equalsIgnoreCase("Wednesday")) {

					day="Mercredi";
					
					
				}else {
					if(dayWeekText.equalsIgnoreCase("Thursday")) {
						day="Jeudi";
						
					}

					
				}

				
				
				
			}
			
			
		}
     
     
		
		} 
		System.out.println("\n name od day\n"+day);
	      System.out.print(time_1);
	      
	      UserDAO user=new UserDAO();
	      
	      boolean seance=false;
	      
	      
	      try {
			seance=user.virefie_seance(type_Account.getId_user(), time_1, time_2, day);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	      if(seance){

				 resp.sendRedirect(req.getContextPath() + "/cahier");
	  
	      }else {
	    	      
	    	  
	    	   ses.setAttribute("step", "1");
	    	  
				 resp.sendRedirect(req.getContextPath() + "/ShowProgramClass");

	    	  
	      }
	      
	      
		}else {
			
			
			
			
			 resp.sendRedirect(req.getContextPath() + "/login");

		}
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
