package Model;

public class Emploi {
	
	private int id;
	private String open_time;
	private String day;
	private String matiere;
	private int salle;
	private int class_id;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOpen_time() {
		return open_time;
	}
	public void setOpen_time(String open_time) {
		this.open_time = open_time;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getMatiere() {
		return matiere;
	}
	public void setMatiere(String matiere) {
		this.matiere = matiere;
	}
	public int getSalle() {
		return salle;
	}
	public void setSalle(int salle) {
		this.salle = salle;
	}
	public int getClass_id() {
		return class_id;
	}
	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}
	public Emploi(int id, String open_time, String day, String matiere, int salle, int class_id) {
		super();
		this.id = id;
		this.open_time = open_time;
		this.day = day;
		this.matiere = matiere;
		this.salle = salle;
		this.class_id = class_id;
	} 
	
	public Emploi() {
		
		
	}
	
	
	
}
	
	