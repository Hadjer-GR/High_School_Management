package Model;

public class Student {

       private int id;
	
	private String first_name;
	private String last_name;
	private String date_birth;
	private  int parent_id;
	private int class_id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getDate_birth() {
		return date_birth;
	}
	public void setDate_birth(String date_birth) {
		this.date_birth = date_birth;
	}
	public int getParent_id() {
		return parent_id;
	}
	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}
	public int getClass_id() {
		return class_id;
	}
	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}
	public Student(int id, String first_name, String last_name, String date_birth, int parent_id, int class_id) {
		super();
		this.id = id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.date_birth = date_birth;
		this.parent_id = parent_id;
		this.class_id = class_id;
	}
	
	public Student() {
		
	}
	
	
	
	
	
	
	
	
	
	
}
