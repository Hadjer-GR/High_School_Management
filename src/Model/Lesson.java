package Model;

public class Lesson {
	private int id;
	private String date;
	private String text;
	private  int matiere_id ;
	private int enseig_id ;
	private int cahier;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getMatiere_id() {
		return matiere_id;
	}
	public void setMatiere_id(int matiere_id) {
		this.matiere_id = matiere_id;
	}
	public int getEnseig_id() {
		return enseig_id;
	}
	public void setEnseig_id(int enseig_id) {
		this.enseig_id = enseig_id;
	}
	public int getCahier() {
		return cahier;
	}
	public void setCahier(int cahier) {
		this.cahier = cahier;
	}
	public Lesson(int id, String date, String text, int matiere_id, int enseig_id, int cahier) {
		super();
		this.id = id;
		this.date = date;
		this.text = text;
		this.matiere_id = matiere_id;
		this.enseig_id = enseig_id;
		this.cahier = cahier;
	}
	
	public Lesson() {
		
	}
	
	
	
	

}
