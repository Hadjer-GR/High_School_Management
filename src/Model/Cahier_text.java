package Model;

public class Cahier_text {
	private int id;
	private String text;
	private String date;
	private int matiere_id;
	private int cahier;
	private int enseig_id;
	
	
	
	public Cahier_text(int id, String text, String date, int matiere_id, int cahier, int enseig_id) {
		super();
		this.id = id;
		this.text = text;
		this.date = date;
		this.matiere_id = matiere_id;
		this.cahier = cahier;
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



	public int getMatiere_id() {
		return matiere_id;
	}



	public void setMatiere_id(int matiere_id) {
		this.matiere_id = matiere_id;
	}



	public int getCahier() {
		return cahier;
	}



	public void setCahier(int cahier) {
		this.cahier = cahier;
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
