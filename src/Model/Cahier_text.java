package Model;

public class Cahier_text {
	private int id;
	private String text;
	private String date;
	private String matiere;
	private String class_id;
	private int enseig_id;
	
	
	
	



	public Cahier_text(int id, String text, String date, String matiere, String class_id, int enseig_id) {
		super();
		this.id = id;
		this.text = text;
		this.date = date;
		this.matiere = matiere;
		this.class_id = class_id;
		this.enseig_id = enseig_id;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getText() {
		return text;
	}



	public void setText(String text) {
		this.text = text;
	}



	public String getDate() {
		return date;
	}



	public void setDate(String date) {
		this.date = date;
	}






	public String getMatiere() {
		return matiere;
	}



	public void setMatiere(String matiere) {
		this.matiere = matiere;
	}



	public String getClass_id() {
		return class_id;
	}



	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}



	public int getEnseig_id() {
		return enseig_id;
	}



	public void setEnseig_id(int enseig_id) {
		this.enseig_id = enseig_id;
	}



	public Cahier_text() {
		
	}
	

}
