package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO {
	
	
	private Connection mycon;
   
	
	public UserDAO() {
		
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
	private  static final  String type_Secretaire_sql="select id  from sécretaire where Account_id=?;";

	
	/*
	 * 
	 * 
	 * 
	 */
	
	//TextBook
		private static final String Add_Lesson_sql="insert into lesson(date,text)values(?,?);";
		private static final String Select_All_Lesson="select * from lesson;";
		private static final String Select_Enseignant_byId="select FirstName,LastName,UserName,Password from teacher where id=?;";
		private static final String delete_Lesson_sql="delete  from lesson where idLesson=?;";
		private static final String update_Enseignant_sql="update   teacher set FirstName=?,LastName=?,UserName=? ?Password=? where id=?;";

		/*
		 * 
		 * 
		 * 
		 */
	
	// Inscription
		private static final String insert_inscription_sql="insert into inscription(nom,prenom,numéro_contact,email,date_naissance,anneè,file) values(?,?,?,?,?,?,?);";

	
	
	// connect database
	
	public void Connectdb() throws  ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		try {
			mycon=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "Hadjer,Xp06");
			System.out.println(" is secussful access to database");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("can't access ....");
			e.printStackTrace();
		}		
		
	
	}
	
	/*
	 * 
	 * add Lesson
	 */
	
	
	public void add_Lesson(Lesson mylesson) throws SQLException  {
		
		try {
			Connectdb();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PreparedStatement mystat;
		mystat=mycon.prepareStatement(Add_Lesson_sql);
		mystat.setString(1,mylesson.getDate());
		mystat.setString(2,mylesson.getText());
       mystat.executeUpdate();
       mycon.close();		
		
	}
	
	// list of  Lesson
	
			public ArrayList<Lesson> select_all_Lesson() throws SQLException {
				
			       ArrayList<Lesson>list=new ArrayList();
			
					try {
						Connectdb();
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					PreparedStatement mystat;
					mystat=mycon.prepareStatement(Select_All_Lesson);
					
					
					Lesson myLesson;
					 
					 ResultSet result=mystat.executeQuery();
					 while(result.next()) {
						 myLesson=new Lesson();
						 myLesson.setId(result.getInt(1));
						 myLesson.setDate(result.getString(2));
						 myLesson.setText(result.getString(3));
						
						 list.add(myLesson);
					 }
					 mycon.close();
					 return list;		
		}
	
	

			

			// delete_lesson_sql
			
				public void delet_lesson(int id ) throws SQLException {
					try {
						Connectdb();
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					PreparedStatement mystat;
					mystat=mycon.prepareStatement(delete_Lesson_sql);
					 mystat.setInt(1, id);
			          mystat.executeUpdate();
					mycon.close();
					
					
				}
				/*
				 * 
				 * add Lesson
				 */
				
				
				public void insert_inscription(Inscription inscript) throws SQLException  {
					
					try {
						Connectdb();
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					PreparedStatement mystat;
					mystat=mycon.prepareStatement(insert_inscription_sql);
					mystat.setString(1,inscript.getLast_name());
					mystat.setString(2,inscript.getFirst_name());
					mystat.setString(3, inscript.getNumber());
					mystat.setString(4, inscript.getEmail());
				   mystat.setString(5, inscript.getDate_birth());
				   mystat.setString(6, inscript.getAcademic_year());
				   mystat.setBlob(7,inscript.getInputStream() );
				 int isinsert=0;
				   isinsert= mystat.executeUpdate();
				   if(isinsert>0) {
					   System.out.println("complet insert");
				   }else {
					   System.out.println("doesn't insert");
				   }
			       mycon.close();		
					
				}
	/*
	 * 
	 * define type  of account Admin or secretaire or teacher or Parent
	 */
				
 public Type_Account  type_account(int id_account) throws SQLException, ClassNotFoundException {
					 
		 
		 int id=0;
		 
		 Type_Account type_Account =new Type_Account();

		 try {
				Connectdb();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			PreparedStatement mystat;
			mystat=mycon.prepareStatement(type_teacher_sql);
			mystat.setInt(1,id_account);
		 ResultSet result=mystat.executeQuery();

			 while(result.next()) {
				 id=result.getInt(1);
			 }
			 if(id !=0) {
				 type_Account.setType("Teacher");
				 type_Account.setId_account(id_account);
			 }else {
				 mystat=mycon.prepareStatement(type_Parent_sql);
					mystat.setInt(1,id_account);
				  result=mystat.executeQuery();

					 while(result.next()) {
						 id=result.getInt(1);
					 }
					 if(id !=0) {
						 type_Account.setType("Parent");
						 type_Account.setId_account(id_account);

					 }else {
						 
						 mystat=mycon.prepareStatement(type_Secretaire_sql);
							mystat.setInt(1,id_account);
						  result=mystat.executeQuery();

							 while(result.next()) {
								 id=result.getInt(1);
							 }
							 if(id !=0) {
								 type_Account.setType("Secretaire");
								 type_Account.setId_account(id_account);

							 }else {
								 
								 mystat=mycon.prepareStatement(type_Admin_sql);
									mystat.setInt(1,id_account);
								  result=mystat.executeQuery();

									 while(result.next()) {
										 id=result.getInt(1);
									 }
									 if(id !=0) {
										 type_Account.setType("Admin");
										 type_Account.setId_account(id_account);

									 }
								 
								 
								 
							 }
						 
						 
						 
						 
						 
						 
					 }
			 }
		  return  type_Account;
 }
				
				
				
				
				
				
				
				
/*
 * 
 * 
 * check login 
 */
				 public int checklogin(String username,String password) throws SQLException, ClassNotFoundException {
					 
					 Connectdb();
					 int id_account=-1;
					 boolean haveaccount=false;
					 boolean typeaccount;
					 PreparedStatement mystat;					 
					 mystat=mycon.prepareStatement(check_login_sql);
					 mystat.setString(1,username);
					 mystat.setString(2,password);
				   
					 ResultSet result=mystat.executeQuery();
					 while(result.next()) {
						 id_account=result.getInt(1);
					 }
						
					
						
						return  id_account;
						
						
						
						

					 
				 }
				
}
