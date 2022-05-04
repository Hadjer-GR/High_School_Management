package Model;

public class Lesson {
	private int id;
	private String date;
	private String text;
	private  String matiere ;
	
	public String getMatiere() {
		return matiere;
	}
	public void setMatiere(String matiere) {
		this.matiere = matiere;
	}
	public Lesson(int id,String date,String text) {
		this.id=id;
		this.date=date;
		this.text=text;
		
		
	}
	public Lesson() {
		
	}
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
	

}
