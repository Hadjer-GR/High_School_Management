package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdminDAO {
	
	
	
	

	private Connection mycon;
   
	
	public AdminDAO() {
		
		this.mycon=null;
	}
	
	/*
	 * requet
	 * 
	 */
	
	// check login  && find type_account
	private static final String check_login_sql="select id from account where username=?and password =?;";
	private  static final  String type_teacher_sql="select id from enseignement where Account_id=?;";
	private  static final  String type_Parent_sql="select id  from parent where Account_id=?;";
	private  static final  String type_Admin_sql="select id  from admin where Account_id=?;";
	private  static final  String type_Secretaire_sql="select id  from secretaire where Account_id=?;";
/*
 * 
 * Acount
 * 
 */
	private  static final  String account_info_sql="select username,password from account where id=?;";
	private static final String update_account_sql="update   account set username=?,password=? where id=?;";
	private  static final  String add_account_sql="insert into  account(username,Password)values(?,?);";
	private  static final  String account_id_sql="select id from account where username=? and Password=?;";
			

	/*
	 * 
	 *  Teacher qeury
	 * 
	 */
	private static final String teacher_info_sql="select id,nom,prenom,date_naissance,numéro_contact,email,account_id,img from enseignement where id=?;";
	private static final String update_Teacher_sql="update  enseignement set nom=?,prenom=?,numéro_contact=?,email=?,img=? where id=?;";
	private static final String teacher_class_sql="select class_id from enseignement_has_class where enseig_id=?;";
	private static final String teacher_emploi_sql="select Emploi_temp_id from  emploi_temp_has_enseignement where enseig_id=?;";
	private static final String addteacher="insert into enseignement(nom,prenom,date_naissance,num_contact,email,account_id,Module,img) values(?,?,?,?,?,?,?,?)";
	private static final String Select_All_teacher="select * from enseignement;";


	
	/*
	 * 
	 *  secri qeury
	 * 
	 */
	private static final String addsecri ="insert into secretaire( nom,prenom,date_naissance,email,num_contact,account_id,img) values(?,?,?,?,?,?,?) ;";
	private static final String update_secri_sql="update secretaire set nom=?,prenom=?,num_contact=?,email=?,date_naissance=? where id=?;";
	private static final String Select_All_secri="select * from secretaire;";
	private static final String Select_All_group="select * from class;";
	
	
	/*
	 * 
	 * 
	 * 
	 * 
	 * 
	*/
	/*
	 * Emploi de temp
	 * 
	 */

	
	
	
	
	
	
	// connect database
	
	public void Connectdb() throws  ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		try {
			mycon=DriverManager.getConnection("jdbc:mysql://localhost:3306/database_gg", "root", "Hadjer,Xp06");
			System.out.println(" is secussful access to database");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("can't access ....");
			e.printStackTrace();
		}		
		
	
	}
	
	
	
	
	// Add Profil
	
	
	
	
	/*
	 * 
	 * Add Account 
	 */
	
	
	
	

	public void addAccount(Account account) throws SQLException {
		
		
		try {
			Connectdb();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		PreparedStatement mystat;
		mystat=mycon.prepareStatement(add_account_sql);
		 mystat.setString(1, account.getUsername());
		 mystat.setString(2, account.getPassword());
		 System.out.println("Acount :"+account.getId() + "Account username :"+account.getUsername());
		 mystat.executeUpdate();
	       mycon.close();
 
	}
	
	
	/*
	 * 
	 * Add Teacher
	 * 
	 * 
	 */
	
	
	public void addTeacher(Teacher teacher) throws SQLException {
	
	
		try {
			Connectdb();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PreparedStatement mystat;
		mystat=mycon.prepareStatement(addteacher);
		 
		 mystat.setString(1, teacher.getLast_name());
		 mystat.setString(2, teacher.getFirst_name());
		 mystat.setString(3, teacher.getDate_birth());
		 
		 mystat.setString(4, teacher.getContact_number());
		 mystat.setString(5, teacher.getEmail());
		 mystat.setInt(6, teacher.getId_account());
		 mystat.setString(7, teacher.getModule());
		 
		 mystat.setBlob(8, teacher.getImg());
       mystat.executeUpdate();
       mycon.close();		
	}
	
	/*
	 * Add Secretary
	 * 
	 */
	
	
	public void addsecri (Secretaire secri  ) throws SQLException {


		try {
			Connectdb();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PreparedStatement mystat;
		mystat=mycon.prepareStatement(addsecri);
		mystat.setString(1,secri.getLast_name());
		mystat.setString(2,secri.getFirst_name());
		mystat.setString(3,secri.getDate_birth() );
		mystat.setString(4,secri.getEmail());
		mystat.setString(5,secri.getContact_number() );
		mystat.setInt(6, secri.getId_account() );
	    mystat.setBlob(7, secri.getImg());
	   mystat.executeUpdate();
	   mycon.close();		
	}	
	
	// show class in emploi de temps 
	// get class indormation that the teacher study 	 
	
	public ArrayList<Group>  show_class() throws SQLException  {
				
				try {
					Connectdb();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				 ArrayList<Group> class_info= new ArrayList();
				 Group group;
				 
				PreparedStatement mystat;
				
				
		       mystat=mycon.prepareStatement(Select_All_group);
		      
		     
	       
		         
				ResultSet result=mystat.executeQuery();
				 while(result.next()) {
					 group=new Group();
					 
					 group.setId(result.getInt(1));
					 group.setNbr_class(result.getInt(2));
					 group.setId_period(result.getInt(3));
					 group.setSpecialiste(result.getString(4));
					 group.setId_niveau(result.getInt(5));
					 group.setEmlpoi_id(result.getInt(6));
					 group.setCahier_id(result.getInt(7));
	             
					 class_info.add(group);
					 
				 }
			     mycon.close();		


				 return class_info ;
				 
				 
				 
				 }
	
	
	
	
	

}
