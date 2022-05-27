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
	private static final String matieres_teacheres_sql="SELECT  id,nom ,prenom ,Module FROM enseignement;" ;



	
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
	 * add class 
	 * 
	 */

	private static final String add_class_sql="insert into class(nbr_class,id_period,specialiste,id_niveau)values(?,?,?,?);";

	
	/*
	 * Matieres
	 * 
	 */
	private static final String all_Matiere_sql="select nom_matiere from matiere  where specialiste='sciences' and Niveau_id=1;";
	private static final String class_Matiere_sql="select nom_matiere from matiere  where specialiste=? and Niveau_id=?;";

	
	/*
	 * Emploi de temp 
	 * 
	 */
	
	private static final String verifie_class_sql="select id from emploi_temp where open_time=? and day=? and class_id=?;";

	private static final String verifie_salle_sql="select  id from emploi_temp where open_time=? and day=? and  salle=?;";
	private static final String enseig_disponible_sql="select id,nom,prenom,Module  "
			+ "from enseignement "
			+ "where id not in ( "
			+ " "
			+ "select enseig_id from emploi_temp_has_enseignement "
			+ "join emploi_temp  "
			+ "on emploi_temp_has_enseignement.Emploi_temp_id=emploi_temp.id and  day=?  and open_time=? "
			+ " "
			+ ") and Module=? ; ";

	private static final String insert_emploi_sql="insert into emploi_temp (open_time,day,matiere,salle,class_id) values(?,?,?,?,?);";
	private static final String get_emploi_id_sql="select id from emploi_temp  where open_time=? and day=? and salle=? and matiere=? and class_id=?;";
	private static final String emploi_enseig_sql="insert into emploi_temp_has_enseignement (Emploi_temp_id,enseig_id)values(?,?);";
	private static final String emploi_class_sql="select enseig_id , id,open_time,day,matiere,salle\r\n"
			+ "from emploi_temp_has_enseignement \r\n"
			+ "inner join  emploi_temp\r\n"
			+ "on emploi_temp.id =emploi_temp_has_enseignement.Emploi_temp_id\r\n"
			+ "and emploi_temp.class_id=? order by open_time;";
	private static final String enseig_class_sql="select id,nom,prenom \r\n"
			+ "from enseignement \r\n"
			+ "where id in (select enseig_id \r\n"
			+ "from emploi_temp_has_enseignement \r\n"
			+ "inner join  emploi_temp\r\n"
			+ "on emploi_temp.id =emploi_temp_has_enseignement.Emploi_temp_id\r\n"
			+ "and emploi_temp.class_id=?);";
	private static final String delete_enseig_emploi_sql="delete from emploi_temp_has_enseignement where Emploi_temp_id= ?;\r\n"
			+ "";
	private static final String delete_emploi_sql="delete from emploi_temp where id=?;";

	
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
	
	
	
	/*
	 * 
	 * Add Class 
	 */
	
	
	


	public void addClass(Group groupe) throws SQLException {
		
		
		try {
			Connectdb();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		PreparedStatement mystat;
		mystat=mycon.prepareStatement(add_class_sql);
		mystat.setInt(1, groupe.getNbr_class());
		mystat.setInt(2, groupe.getId_period());
		 mystat.setString(3, groupe.getSpecialiste());
		 mystat.setInt(4, groupe.getId_niveau());
		 System.out.println("AddClass:"+groupe.getSpecialiste() );
		 mystat.executeUpdate();
	       mycon.close();
 
	}
	
	
	
	
	// get class indormation that the teacher study 	 
	
		public ArrayList<String>  all_matiere() throws SQLException  {
					
					try {
						Connectdb();
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					 ArrayList<String> matieres= new ArrayList();
					 String nom;
					 
					PreparedStatement mystat;
					
					
			       mystat=mycon.prepareStatement(all_Matiere_sql);
			      
			     
		       
			         
					ResultSet result=mystat.executeQuery();
					 while(result.next()) {
						nom=result.getString(1);	
		             
						matieres.add(nom);
						 
					 }
				     mycon.close();		


					 return matieres ;
					 
					 
					 
					 }
		// give the list of matieres in specifiec class
		public ArrayList<String>  class_matiere(int niv_id,String spet) throws SQLException  {
			
			try {
				Connectdb();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 ArrayList<String> matieres= new ArrayList();
			 String nom;
			 
			PreparedStatement mystat;
			
			
	       mystat=mycon.prepareStatement(class_Matiere_sql);
	       mystat.setString(1, spet);
	       mystat.setInt(2, niv_id);

	     
       
	         
			ResultSet result=mystat.executeQuery();
			 while(result.next()) {
				nom=result.getString(1);	
             
				matieres.add(nom);
				 
			 }
		     mycon.close();		


			 return matieres ;
			 
			 
			 
			 }
		/*
		 * 
		 * Verifie disponibilite de la salle
		 */
		
public  boolean  virefie_salle(String open_time,String day ,String salle) throws SQLException  {
			
			try {
				Connectdb();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			boolean  disp =true;
			int salle1=0;
			 
			PreparedStatement mystat;
		
	       mystat=mycon.prepareStatement(verifie_salle_sql);
			 mystat.setString(1, open_time);
			 mystat.setString(2, day);
			 mystat.setString(3, salle);
			ResultSet result=mystat.executeQuery();
			 while(result.next()) {
				salle1=result.getInt(1);
				 
			 }
			 if(salle1 !=0) {
				 disp=false;
			 }
		     mycon.close();	
		     
       System.out.println("AdminDAO Disp :" +disp);

			 return disp ;
			 
			 
			 
			 }
		
/*
 * 
 * Verifie disponibilite de la class
 */

public  boolean  virefie_class(String open_time,String day ,String class_id) throws SQLException  {
	
	try {
		Connectdb();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	boolean  disp =true;
	int salle1=0;
	 
	PreparedStatement mystat;

   mystat=mycon.prepareStatement(verifie_class_sql);
	 mystat.setString(1, open_time);
	 mystat.setString(2, day);
	 mystat.setString(3, class_id);
	ResultSet result=mystat.executeQuery();
	 while(result.next()) {
		salle1=result.getInt(1);
		 
	 }
	 if(salle1 !=0) {
		 disp=false;
	 }
     mycon.close();	
     
System.out.println("AdminDAO Disp class :" +disp);

	 return disp ;
	 
	 
	 
	 }


		
		
		// give the list of teacher disponible
	public ArrayList<Teacher>  Teacher_disp( String day,String open_time,String matiere) throws SQLException  {
			
			try {
				Connectdb();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 ArrayList<Teacher> Teacher_matiere= new ArrayList();
			 
			PreparedStatement mystat;
			
			
	       mystat=mycon.prepareStatement(enseig_disponible_sql);
	       mystat.setString(1, day);
	       mystat.setString(2, open_time);
	       mystat.setString(3, matiere);

			 Teacher teacher;

	      
			ResultSet result=mystat.executeQuery();
			 while(result.next()) {
				 teacher=new Teacher();
				teacher.setId(result.getInt(1));
				teacher.setLast_name(result.getString(2));
				teacher.setFirst_name(result.getString(3));
				teacher.setModule(result.getString(4));
				
				
				Teacher_matiere.add(teacher);
				 
			 }
		     mycon.close();		


			 return Teacher_matiere ;
			 
			 
			 
			 }
		
		/*
		 *  Insert into emploi de temp 
		 * 
		 */

public void insert_emploi(Emploi emploi) throws SQLException {
		
		
		try {
			Connectdb();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		PreparedStatement mystat;
		mystat=mycon.prepareStatement(insert_emploi_sql);
       mystat.setString(1,emploi.getOpen_time());
       mystat.setString(2, emploi.getDay());		
       mystat.setString(3, emploi.getMatiere());		
       mystat.setInt(4, emploi.getSalle());		
       mystat.setInt(5, emploi.getClass_id());		

		 mystat.executeUpdate();
	       mycon.close();
 
	}
	

/*
 * get emploi id 
 * 
 */
public int get_emploi_id(Emploi emploi) throws SQLException {
	
	
	try {
		Connectdb();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 
	PreparedStatement mystat;
	mystat=mycon.prepareStatement(get_emploi_id_sql);
   mystat.setString(1,emploi.getOpen_time());
   mystat.setString(2, emploi.getDay());
   mystat.setInt(3, emploi.getSalle());		
   mystat.setString(4, emploi.getMatiere());		
   mystat.setInt(5, emploi.getClass_id());		

     int id=0;
	ResultSet result=mystat.executeQuery();
	 while(result.next()) {
		
	 	 id=result.getInt(1);
	  }
        mycon.close();		


	    return id ;
	 

}

/*
 * 
 * Insert enseign has emploi de temp
 * 
 * 
 */


public void emploi_enseig(String emploi_id,String enseig_id) throws SQLException {
	
	
	try {
		Connectdb();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 
	PreparedStatement mystat;
	mystat=mycon.prepareStatement(emploi_enseig_sql);
	mystat.setString(1, emploi_id);
	mystat.setString(2, enseig_id);

	 mystat.executeUpdate();
       mycon.close();

}


//get list emploi in specific class 	 

	public ArrayList<Emploi>  show_emploi_class(String class_id) throws SQLException  {
				
				try {
					Connectdb();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				 ArrayList<Emploi> list_emploi= new ArrayList();
				 Emploi emploi;
				 
				PreparedStatement mystat;
				
				
		       mystat=mycon.prepareStatement(emploi_class_sql);
		      mystat.setString(1, class_id);
		     
	       
		         
				ResultSet result=mystat.executeQuery();
				 while(result.next()) {
					 emploi=new Emploi();
					 emploi.setEnseig_id(result.getInt(1));
					 emploi.setId(result.getInt(2));
					 emploi.setOpen_time(result.getString(3));
					 emploi.setDay(result.getString(4));
					 emploi.setMatiere(result.getString(5));
					 emploi.setSalle(result.getInt(6));
           			 list_emploi.add(emploi);
					 
				 }
			     mycon.close();		


				 return list_emploi ;
				 
				 
				 
				 }
	
	//get list teacher in  emploi in specific class 	 

		public ArrayList<Teacher>  enseig_emploi_class(String class_id) throws SQLException  {
					
					try {
						Connectdb();
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					 ArrayList<Teacher> list_teacher_emploi= new ArrayList();
					 Teacher teacher;
					 
					PreparedStatement mystat;
					
					
			       mystat=mycon.prepareStatement(enseig_class_sql);
			      mystat.setString(1, class_id);
			     
		       
			         
					ResultSet result=mystat.executeQuery();
					 while(result.next()) {
						 teacher=new Teacher();
						 teacher.setId(result.getInt(1));
						 teacher.setLast_name(result.getString(2));
						 teacher.setFirst_name(result.getString(3));				 
						 list_teacher_emploi.add(teacher);
						 
					 }
				     mycon.close();		


					 return list_teacher_emploi ;
					 
					 
					 
					 }
		



		/*
		 * 
		 * Add emploi from emploi_temp
		 */
		

		public void delete_emploi(String emploi_id) throws SQLException {
			
			
			try {
				Connectdb();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			PreparedStatement mystat;
			mystat=mycon.prepareStatement(delete_emploi_sql);
			mystat.setString(1, emploi_id);
			
			 mystat.executeUpdate();
		       mycon.close();
	 
		}

		/*
		 * 
		 * Add enseign  from emploi_temp
		 */
		
		
		
		

		public void delete_enseig_emploi(String emploi_id) throws SQLException {
			
			
			try {
				Connectdb();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			PreparedStatement mystat;
			mystat=mycon.prepareStatement(delete_enseig_emploi_sql);
			mystat.setString(1, emploi_id);
			
			 mystat.executeUpdate();
		       mycon.close();
	 
		}








}
