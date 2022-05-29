package Model;

public class Resulte {
	
	private int id;
	private String first_name; 
	private String last_name; 

	private double evalution;
	private double devoir_1;
	private double devoir_2;
	private double control;
	private String class_id;
	 private int eleve_id;
	
	 
	 
	 
	 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
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
	public double getEvalution() {
		return evalution;
	}
	public void setEvalution(double evalution) {
		this.evalution = evalution;
	}
	public double getDevoir_1() {
		return devoir_1;
	}
	public void setDevoir_1(double devoir_1) {
		this.devoir_1 = devoir_1;
	}
	public double getDevoir_2() {
		return devoir_2;
	}
	public void setDevoir_2(double devoir_2) {
		this.devoir_2 = devoir_2;
	}
	public double getControl() {
		return control;
	}
	public void setControl(double control) {
		this.control = control;
	}
	
	public int getEleve_id() {
		return eleve_id;
	}
	public void setEleve_id(int eleve_id) {
		this.eleve_id = eleve_id;
	}

	 
	
	public Resulte(int id, String first_name, String last_name, double evalution, double devoir_1, double devoir_2,
			double control, String class_id, int eleve_id) {
		super();
		this.id = id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.evalution = evalution;
		this.devoir_1 = devoir_1;
		this.devoir_2 = devoir_2;
		this.control = control;
		this.class_id = class_id;
		this.eleve_id = eleve_id;
	}
	public Resulte() {
		
	}
	 
	 
	
	
	
	

}
