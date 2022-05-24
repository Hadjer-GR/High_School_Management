package Model;

import java.sql.Array;

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
	private  static final  String type_Secretaire_sql="select id  from secretaire where Account_id=?;";
/*
 * 
 * Acount
 * 
 */
	private  static final  String account_info_sql="select username,password from account where id=?;";
	private static final String update_account_sql="update   account set username=?,password=? where id=?;";
			

	/*
	 * 
	 *  Teacher qeury
	 * 
	 */
	private static final String teacher_info_sql="select id,nom,prenom,date_naissance,num_contact,email,account_id,img from enseignement where id=?;";
	private static final String update_Teacher_sql="update  enseignement set nom=?,prenom=?,num_contact=?,email=?,img=? where id=?;";
	private static final String teacher_class_sql="select class_id from enseignement_has_class where enseig_id=?;";
	private static final String teacher_emploi_sql="select Emploi_temp_id from  emploi_temp_has_enseignement where enseig_id=?;";


	
	
	/*
	 * 
	 * 
	 * 
	 * 
	 * 
	*/
	
	
	// Class 
	String range="";

	private static final String programme_id_class_sql="select emploi_id from class where id=?;";
	private static final String programme_class_sql="select * from emploi_temp where emploi_id=?;";
	private static final String programme_matieres_sql="select matiere_id from emploi_temp where  emploi_id=?;";
	private static final String class_info_sql="select * from class where id=?;";
	private static final String spet_class_sql="select  specialiste from class where id=?;";
	private static final String cahier_id_class_sql="select cahier_id from class where id=?;";


	// matieres
	private static final String matieres_enseig_inClass_sql="select matiere_id from enseignement_has_matiere where matiere_Niveau_id =? and enseign_id=?;";

	
	
	
	
	
	
	//TextBook
        private static final String select_lesson_sql="select * from cahier_text where cahier=? and matier_id=? and ensieg_id=?;";
	    private static final String get_Lesson_sql="select * from cahier_text where id=?;";
		private static final String Add_Lesson_sql="insert into cahier_text(text,date,matier_id,ensieg_id,cahier)values(?,?,?,?,?);";
		private static final String delete_Lesson_sql="delete  from cahier_text where id=?;" ;
		private static final String edite_Lesson_sql="update  cahier_text set text=? where id=?;" ;

				

		/*
		 * 
		 * 
		 * 
		 */
		
		//Students 
         private static final String student_class_sql="select * from eleve where class_id=?; ";
         private static final String student_result_sql="select nom,prenom, n_evalution,n_devoir_1,n_devoir_2,n_control,Mouyen,eleve_id "
         		+ "from eleve  "
         		+ "inner join resultats "
         		+ "on resultats.eleve_id=eleve.id where resultats.class_id=?; ";

         private static final String set_student_Resulte_sql="update  resultats set n_evalution=?, n_devoir_1=?, n_devoir_2=?,n_control=?, Mouyen=? where eleve_id=?; ";

		
		
	
	// Inscription
		private static final String insert_inscription_sql="insert into inscription(nom,prenom,numéro_contact,email,date_naissance,anneè,file) values(?,?,?,?,?,?,?);";

	
	
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
	//get  matiere_id that the teacher explain in niveau_class 

	public ArrayList<Integer> matiere_enseign_class(int niveau_id,int enseign_id) throws SQLException  {

	try {
		Connectdb();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}


    ArrayList<Integer> matieres_id=new ArrayList();
    int matiere_id=0;
	PreparedStatement mystat;
    mystat=mycon.prepareStatement(matieres_enseig_inClass_sql);
	    mystat.setInt(1, niveau_id);
	    mystat.setInt(2, enseign_id);

			ResultSet result=mystat.executeQuery();
	 while(result.next()) {
		 matiere_id=result.getInt(1);
		 matieres_id.add(matiere_id);
		 
	 }
	 
	 mycon.close();		
	 return matieres_id;
	 
	 }
	/*
	*
	*
	*/
	
	
public Matiére  nom_matiere(ArrayList<Integer> matieres_id,String specialiste) throws SQLException  {
		
		try {
			Connectdb();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 ArrayList<Group> class_info= new ArrayList();
		 Group group;
		 Matiére matiére =new Matiére() ;
		 
		PreparedStatement mystat;
		range="";
		int d=matieres_id.size();
		
		System.out.println(d);
		int i;
		for( i=0;i<d;i++) {
			range=range+"?,";
		}
		String k;
		k=range.substring(0, range.length() - 1);;
		
		range=k;
		String sql="select * from matiere where id in (";
		sql=sql+k;
		sql=sql+") and specialiste=?;";
		
		System.out.print(sql);

		
       mystat=mycon.prepareStatement(sql);
        int d1=1;
       for( i=0;i<=matieres_id.size()-1;i++) {
			mystat.setInt(d1, matieres_id.get(i));
			d1=d1+1;
			System.out.print(" class_id"+matieres_id.get(i)+"d1:"+d1);

		}
          
           mystat.setString(d1, specialiste);
      
     String nom_matiere="";
   
         
		ResultSet result=mystat.executeQuery();
		 while(result.next()) {
			 matiére.setId(result.getInt(1));
			 matiére.setNom_matiere(result.getString(2));
			 matiére.setNiveau_id(result.getInt(3));
			 
		 }
	     mycon.close();		


		 return matiére ;
		 
		 
		 
		 }
	/*
	 * 
	 * add Lesson
	 */
	
	
	public void add_Lesson( Cahier_text mylesson) throws SQLException  {
		
		try {
			Connectdb();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PreparedStatement mystat;
		mystat=mycon.prepareStatement(Add_Lesson_sql);
		mystat.setString(1,mylesson.getText());
		mystat.setString(2,mylesson.getDate());
		mystat.setInt(3, mylesson.getMatiere_id());
		mystat.setInt(4, mylesson.getEnseig_id());
		mystat.setInt(5, mylesson.getCahier());
       mystat.executeUpdate();
       mycon.close();		
		
	}
	
	
	
	

	//get list de lesson  of the class in 

	public ArrayList<Cahier_text> lesson_matiere(int cahier_id ,int matier_id,int enseig_id) throws SQLException  {
		
		try {
			Connectdb();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<Cahier_text> lesson_matiere=new ArrayList();
		Cahier_text cahier_text;
		
	    PreparedStatement mystat;
		
	    mystat=mycon.prepareStatement(select_lesson_sql);
	   mystat.setInt(1, cahier_id);
	   mystat.setInt(2, matier_id);
	   mystat.setInt(3, enseig_id);



	 
	 ResultSet result=mystat.executeQuery();
	 while(result.next()) {
		 cahier_text=new Cahier_text();
		 cahier_text.setId(result.getInt(1));
		 cahier_text.setText(result.getString(2));
		 cahier_text.setDate(result.getString(3));
		 cahier_text.setMatiere_id(result.getInt(4));
		 cahier_text.setEnseig_id(result.getInt(5));
		 cahier_text.setCahier(result.getInt(6));
		 
		 lesson_matiere.add(cahier_text);
		 
	 }
		 
		 
	 
		 
		return lesson_matiere;
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
				 * 
				 */
				
              // get _lesson_sql
				
				public Cahier_text get_lesson( int id ) throws SQLException {
					try {
						Connectdb();
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					Cahier_text lesson =new Cahier_text();
					PreparedStatement mystat;
					mystat=mycon.prepareStatement(get_Lesson_sql);
					mystat.setInt(1, id);
					ResultSet result;
					 result=mystat.executeQuery();

					 while(result.next()) {
						 lesson.setId(result.getInt(1));
						 lesson.setText(result.getString(2));
						 lesson.setDate(result.getString(3));
						 lesson.setMatiere_id(result.getInt(4));
						 lesson.setEnseig_id(result.getInt(5));
						 lesson.setCahier(result.getInt(6));
						 
						 
					 }
			          
			          
			          
			          
					mycon.close();
					 return lesson;
					
				}
				// edite_lesson_sql
				
				public void edite_lesson( String text,int id ) throws SQLException {
					try {
						Connectdb();
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					PreparedStatement mystat;
					mystat=mycon.prepareStatement(edite_Lesson_sql);
					mystat.setString(1, text);
					 mystat.setInt(2, id);
			          mystat.executeUpdate();
					mycon.close();
					
					
				}
				/*
				 * 
				 * save inscription
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
				 type_Account.setId_user(id);

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
						 type_Account.setId_user(id);


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
								 type_Account.setId_user(id);

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
										 type_Account.setId_user(id);


									 }
								 
								 
								 
							 }
						 
						 
						 
						 
						 
						 
					 }
					 
			 }
		       mycon.close();		

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
						
					
				       mycon.close();		

						return  id_account;
						
						
						
						

					 
				 }
				 
				 
				 
/*
 * 
 *  Account 
 * 
 * 				 
 */
				 // get Account info
				 
				 public  Account account_info(int id) throws SQLException  {
						
						try {
							Connectdb();
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						Account account=new Account();
						account.setId(id);
						PreparedStatement mystat;
						mystat=mycon.prepareStatement(account_info_sql);
						mystat.setInt(1, id);
						ResultSet result=mystat.executeQuery();
						 while(result.next()) {
							 
						
							 account.setUsername(result.getString(1));
							 account.setPassword(result.getString(2));
							 
						 }
					     mycon.close();		
 
						 return account;
						 
						 
						 
						 }		
				 
				 // update Account information 
				 
				 
				 
				 public void  update_Account(Account account ) throws SQLException {
						
						try {
							Connectdb();
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						PreparedStatement mystat;
						mystat=mycon.prepareStatement(update_account_sql);
						mystat.setString(1,account.getUsername()  );
						mystat.setString(2,account.getPassword());
						mystat.setInt(3,account.getId());
					    mystat.executeUpdate();
					   System.out.print("comlet update account ");
			            mycon.close();
						
						
					}


/*
 * 
 * 
 * Teacher 
 * 
 * 
 * 
 * 
 * 
 * */
				 
				 // teacher information 

public Teacher teacher_info(int id) throws SQLException  {
	
	try {
		Connectdb();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	Teacher teacher=new Teacher();
	PreparedStatement mystat;
	mystat=mycon.prepareStatement(teacher_info_sql);
	mystat.setInt(1, id);
	ResultSet result=mystat.executeQuery();
	 while(result.next()) {
		 
		 teacher.setId(result.getInt(1));
		 teacher.setLast_name(result.getString(2));
		 teacher.setFirst_name(result.getString(3));

		 teacher.setDate_birth(result.getString(4));
		 teacher.setContact_number(result.getString(5));
		teacher.setEmail(result.getString(6));
		teacher.setId_account(result.getInt(7));
		 teacher.setImg(result.getBinaryStream(8));
		 
	 }
     mycon.close();		

	 
	 return teacher;
	 
	 
	 
	 }

// update teacher information 
	
//update_Enseignant_sql

		public void  update_teacher(Teacher teacher ) throws SQLException {
			
			try {
				Connectdb();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			PreparedStatement mystat;
			mystat=mycon.prepareStatement(update_Teacher_sql);
			mystat.setString(1,  teacher.getLast_name());
			mystat.setString(2,  teacher.getFirst_name());
			mystat.setString(3, teacher.getContact_number() );
			mystat.setString(4,  teacher.getEmail());
		    mystat.setBlob(5, teacher.getImg());
		    mystat.setInt(6,  teacher.getId());
		    mystat.executeUpdate();
		   System.out.print("comlet update user ");
            mycon.close();
			
			
		}
		
		
//  define teacher class 
		
		public ArrayList<Integer>  teacher_class(int id) throws SQLException  {
			
			try {
				Connectdb();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 ArrayList<Integer> class_id= new ArrayList();
			  int id_class=0;
			PreparedStatement mystat;
			mystat=mycon.prepareStatement(teacher_class_sql);
			mystat.setInt(1, id);
			ResultSet result=mystat.executeQuery();
			 while(result.next()) {
				 
				 id_class=result.getInt(1);
				 class_id.add(id_class);
				 
			 }
		     mycon.close();		


			 return class_id;
			 
			 
			 
			 }
		
	// get class indormation that the teacher study 	 
		
public ArrayList<Group>  class_info(ArrayList<Integer> class_id) throws SQLException  {
			
			try {
				Connectdb();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 ArrayList<Group> class_info= new ArrayList();
			 Group group;
			 
			PreparedStatement mystat;
			range="";
			int d=class_id.size();
			
			System.out.println(d);
			int i;
			for( i=0;i<d;i++) {
				range=range+"?,";
			}
			String k;
			k=range.substring(0, range.length() - 1);;
			
			range=k;
			String sql="select * from class where id in (";
			sql=sql+k;
			sql=sql+");";
			
			System.out.print(sql);

			
	       mystat=mycon.prepareStatement(sql);
	        int d1=1;
	       for( i=0;i<=class_id.size()-1;i++) {
				mystat.setInt(d1, class_id.get(i));
				d1=d1+1;
				System.out.print(" class_id"+class_id.get(i)+"d1:"+d1);

			}
	      
	     
       
	         
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
//get the specialiste of class 

	public String   class_spet( String class_id) throws SQLException  {
		
		try {
			Connectdb();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String spet="";
		PreparedStatement mystat;
		mystat=mycon.prepareStatement(spet_class_sql);
		mystat.setString(1, class_id);
		ResultSet result=mystat.executeQuery();
		 while(result.next()) {
			 spet=result.getString(1);
			
			 
		 }
	     mycon.close();		


		 return spet;
		 
		 
		 
		 }
	//get cahier_id of class 

			public int  cahier_id_class( String class_id) throws SQLException  {
				
				try {
					Connectdb();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
      int cahier_id =0;
           PreparedStatement mystat;
				mystat=mycon.prepareStatement(cahier_id_class_sql);
				mystat.setString(1, class_id);
				ResultSet result=mystat.executeQuery();
				 while(result.next()) {
					 cahier_id=result.getInt(1)	;				 
				 }
			     mycon.close();		


				 return cahier_id;
				 
				 
				 
				 }
	
		
// emploi de temps 

// get  Arraylist  emploi_temp  of the teacher 

    public ArrayList<Integer> teacher_emploi(int id) throws SQLException  {
	
	try {
		Connectdb();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	ArrayList<Integer> emploi_temp=new ArrayList();
	int  emlpoi_temp_id=0;
	PreparedStatement mystat;
	mystat=mycon.prepareStatement(teacher_emploi_sql);
	mystat.setInt(1, id);
	ResultSet result=mystat.executeQuery();
	 while(result.next()) {
		 
		 emlpoi_temp_id=result.getInt(1);
		 System.out.println(emlpoi_temp_id);
		 emploi_temp.add(emlpoi_temp_id);
		 
	 }
	 
     mycon.close();		
	 return emploi_temp;
	 
	 }
    
    
  //  Programmme de l'enseignant  

	
public ArrayList<Emploi>  teacher_emploi_info(ArrayList<Integer> emploi_id) throws SQLException  {
		
		try {
			Connectdb();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 ArrayList<Emploi> list_emploi= new ArrayList();
		 Emploi emploi;
		 
		PreparedStatement mystat;
		
		int d=emploi_id.size();
		  range="";
		System.out.println(d);
		int i;
		for( i=0;i<d;i++) {
			range=range+"?,";
		}
		String k;
		k=range.substring(0, range.length() - 1);;
		
		range=k;
		String sql="select * from emploi_temp where id in(";
		sql=sql+k;
		sql=sql+");";
		
		System.out.print(sql);

		
       mystat=mycon.prepareStatement(sql);
        int d1=1;
       for( i=0;i<=emploi_id.size()-1;i++) {
			mystat.setInt(d1, emploi_id.get(i));
			d1=d1+1;
			System.out.print(" class_id"+emploi_id.get(i)+"d1:"+d1);

		}
      
     
   
         
		ResultSet result=mystat.executeQuery();
		 while(result.next()) {
			 emploi=new Emploi();
			 emploi.setId(result.getInt(1));
			 emploi.setOpen_time(result.getString(2));
			 emploi.setDay(result.getString(3));
			 emploi.setEmploi_id(result.getInt(4));
			 emploi.setMatiere_id(result.getInt(5));
			  
		  list_emploi.add(emploi);
			 
		 }
	     mycon.close();		


		 return list_emploi ;
		 
		 
		 
		 }

/*
 * 
 * 
 * 
 */
//array list of emploi_id inside Emploi de temp teacher in emploi_temp table 

//get  Arraylist  emploi_temp  of the teacher 

public ArrayList<Integer> list_emploi_id(ArrayList<Integer> emploi_temp_id) throws SQLException  {

try {
	Connectdb();
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}



PreparedStatement mystat;

int d=emploi_temp_id.size();

System.out.println(d);
   range="";
int i;
for( i=0;i<d;i++) {
	range=range+"?,";
}
String k;
k=range.substring(0, range.length() - 1);;

range=k;
String sql="select emploi_id from emploi_temp where id in(";
sql=sql+k;
sql=sql+");";

   System.out.print(sql);
  ArrayList<Integer> list_emploi_id= new ArrayList();
     int emploi_id=0;
   
     mystat=mycon.prepareStatement(sql);
     int d1=1;
    for( i=0;i<=emploi_temp_id.size()-1;i++) {
			mystat.setInt(d1, emploi_temp_id.get(i));
			d1=d1+1;
			System.out.print(" emploi_id"+emploi_temp_id.get(i)+"d1:");

		}
   
  

      
		ResultSet result=mystat.executeQuery();
 while(result.next()) {
	 emploi_id=result.getInt(1);
	 list_emploi_id.add(emploi_id);
	 
 }
 
 mycon.close();		
 return list_emploi_id;
 
 }
/*
*
*
*/
// array list of the class inside Emploi de temp teacher



public ArrayList<Group>  class_emploi(ArrayList<Integer> emploi_id) throws SQLException  {
	
	try {
		Connectdb();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 ArrayList<Group> class_info= new ArrayList();
	 Group group;
	 
	PreparedStatement mystat;
	
	int d=emploi_id.size();
	
	System.out.println(d);
	range="";
	int i;
	for( i=0;i<d;i++) {
		range=range+"?,";
	}
	String k;
	k=range.substring(0, range.length() - 1);;
	
	range=k;
	String sql="select * from class where emploi_id in (";
	sql=sql+k;
	sql=sql+");";
	
	System.out.print(sql);

	
   mystat=mycon.prepareStatement(sql);
   int d1=1;
   for( i=0;i<=emploi_id.size()-1;i++) {
		mystat.setInt(d1, emploi_id.get(i));
		d1=d1+1;
		
	}
  
 

     
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

        System.out.println(group.getSpecialiste());
		 class_info.add(group);
		 
	 }
     mycon.close();		


	 return class_info ;
	 
	 
	 
	 }

/*
 * 
 *  the properties of the class programme,absences,student 
 * 
 * 
 * 
 */

// get emploi_id of the class



public int emploi_class_id(int class_id) throws SQLException  {
	
	try {
		Connectdb();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	int emploi_class_id=0;
	PreparedStatement mystat;
	mystat=mycon.prepareStatement(programme_id_class_sql);
	mystat.setInt(1, class_id);
	ResultSet result=mystat.executeQuery();
	 while(result.next()) {
		 emploi_class_id =result.getInt(1);
		
		 
	 }
     mycon.close();		

	 
	 return emploi_class_id;
	 

}

// get programme of the  class  by using emploi_temp tale

public ArrayList<Emploi> programme_class(int emploi_class_id) throws SQLException  {
	
	try {
		Connectdb();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	ArrayList<Emploi> programme=new ArrayList();
	Emploi emploi;
	PreparedStatement mystat;
	mystat=mycon.prepareStatement(programme_class_sql);
	mystat.setInt(1, emploi_class_id);
	ResultSet result=mystat.executeQuery();
	 while(result.next()) {
		 emploi=new Emploi();
		 emploi.setId(result.getInt(1));
		 emploi.setOpen_time(result.getString(2));
		 emploi.setDay(result.getString(3));
		 emploi.setEmploi_id(result.getInt(4));
		 emploi.setMatiere_id(result.getInt(5));
		 programme.add(emploi);
		 
	 }
	 
     mycon.close();		
	 return programme;
	 
	 }




//get list de matiere inside  programme of the  class  by using emploi_temp tale




public ArrayList<Matiére> programme_class_matiere(ArrayList<Integer> list_matieres_id) throws SQLException  {
	
	try {
		Connectdb();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	ArrayList<Matiére> programme_matiere=new ArrayList();
	Matiére matiére;
	
PreparedStatement mystat;
	
	int d=list_matieres_id.size();
	
	System.out.println(d);
	range="";
	int i;
	for( i=0;i<d;i++) {
		range=range+"?,";
	}
	String k;
	k=range.substring(0, range.length() - 1);;
	
	range=k;
	String sql="select * from matiere where id in (";
	sql=sql+k;
	sql=sql+");";
	
	System.out.print(sql);

	
   mystat=mycon.prepareStatement(sql);
   int d1=1;
   for( i=0;i<list_matieres_id.size();i++) {
		mystat.setInt(d1,list_matieres_id.get(i));
		d1=d1+1;
		
	}
	
	
	
	
	ResultSet result=mystat.executeQuery();
	 while(result.next()) {
		 matiére=new Matiére();
		 matiére.setId(result.getInt(1));
		 matiére.setNom_matiere(result.getString(2));
		 matiére.setNiveau_id(result.getInt(3));
		 programme_matiere.add(matiére);
		 
	 }
	 
  mycon.close();		
	 return programme_matiere;
	 
	 }
	 


/*
 * 
 * 
 */
//get list de matiere_id inside  programme of the  class  by using emploi_temp tale



public ArrayList<Integer> list_matiere_id(int emploi_class_id) throws SQLException  {

try {
	Connectdb();
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

ArrayList<Integer> list_matieres_id=new ArrayList();
int matieres_id=0;
PreparedStatement mystat;
    mystat=mycon.prepareStatement(programme_matieres_sql);
     mystat.setInt(1, emploi_class_id);
		ResultSet result=mystat.executeQuery();
    while(result.next()) {
	matieres_id=result.getInt(1);
	System.out.println("matieres_id_111"+"\n"+matieres_id);
	 list_matieres_id.add(matieres_id);
	 
}

mycon.close();		
return list_matieres_id;

}





// get class info 


public Group class_info( int class_id) throws SQLException {
	
    

		try {
			Connectdb();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Group groupe=new Group();
		PreparedStatement mystat;
		mystat=mycon.prepareStatement(class_info_sql);
		mystat.setInt(1, class_id);
		
		
		
		 
		 ResultSet result=mystat.executeQuery();
		 while(result.next()) {
			 
			 groupe.setId(result.getInt(1));
			 groupe.setNbr_class(result.getInt(2));
			 groupe.setId_period(result.getInt(3));
			 groupe.setSpecialiste(result.getString(4));
			 groupe.setId_niveau(result.getInt(5));
			 groupe.setEmlpoi_id(result.getInt(6));
			 groupe.setCahier_id(result.getInt(7));

			
		 }
		 mycon.close();
		 return groupe;		
}

    

// get information about class y uding String 


public Group class_info( String class_id) throws SQLException {
	
    

		try {
			Connectdb();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Group groupe=new Group();
		PreparedStatement mystat;
		mystat=mycon.prepareStatement(class_info_sql);
		mystat.setString(1, class_id);
		
		
		
		 
		 ResultSet result=mystat.executeQuery();
		 while(result.next()) {
			 
			 groupe.setId(result.getInt(1));
			 groupe.setNbr_class(result.getInt(2));
			 groupe.setId_period(result.getInt(3));
			 groupe.setSpecialiste(result.getString(4));
			 groupe.setId_niveau(result.getInt(5));
			 groupe.setEmlpoi_id(result.getInt(6));
			 groupe.setCahier_id(result.getInt(7));

			
		 }
		 mycon.close();
		 return groupe;		
}

// Student Resulte in class 

public ArrayList<Student> student_class(String class_id) throws SQLException  {

try {
	Connectdb();
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
ArrayList<Student> list_student=new ArrayList();
Student student;
PreparedStatement mystat;
mystat=mycon.prepareStatement(student_class_sql);
mystat.setString(1, class_id);
ResultSet result=mystat.executeQuery();
 while(result.next()) {
	 student=new Student();
	 student.setId(result.getInt(1));
	 student.setLast_name(result.getString(2));
	 student.setFirst_name(result.getString(3));
	 student.setDate_birth(result.getString(4));
	 student.setParent_id(result.getInt(5));
	 student.setClass_id(result.getInt(6));
	 
	 list_student.add(student);
 }
 
 mycon.close();		
 return list_student;
 
 }



// Resulte student 

 public ArrayList<Resulte> student_Resulte(String class_id) throws SQLException  {

try {
	Connectdb();
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
ArrayList<Resulte> student_resulte=new ArrayList();
Resulte resulte;
PreparedStatement mystat;
mystat=mycon.prepareStatement(student_result_sql);
mystat.setString(1, class_id);
ResultSet result=mystat.executeQuery();
 while(result.next()) {
	 resulte=new Resulte();
	 resulte.setLast_name(result.getString(1));;
	 resulte.setFirst_name(result.getString(2));
	 resulte.setEvalution(result.getDouble(3));

	 resulte.setDevoir_1(result.getDouble(4));
	 resulte.setDevoir_2(result.getDouble(5));
	 resulte.setControl(result.getDouble(6));
	 resulte.setMouyenne(result.getDouble(7));
	 resulte.setEleve_id(result.getInt(8));
	 
	 student_resulte.add( resulte);
 }
 
 mycon.close();		
 return student_resulte;
 
 }

 
 
//edite_Resulte_Student_sql
	
	public void edite_Resulte( String text,int id ) throws SQLException {
		try {
			Connectdb();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PreparedStatement mystat;
		mystat=mycon.prepareStatement(edite_Lesson_sql);
		mystat.setString(1, text);
		 mystat.setInt(2, id);
       mystat.executeUpdate();
		mycon.close();
		
		
	}
 
 
 
 
 
 
 
 
 

}
