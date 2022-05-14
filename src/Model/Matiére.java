package Model;

public class Matiére {
	private int id;
	String nom_matiere;
	private int niveau_id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom_matiere() {
		return nom_matiere;
	}
	public void setNom_matiere(String nom_matiere) {
		this.nom_matiere = nom_matiere;
	}
	public int getNiveau_id() {
		return niveau_id;
	}
	public void setNiveau_id(int niveau_id) {
		this.niveau_id = niveau_id;
	}
	public Matiére(int id, String nom_matiere, int niveau_id) {
		super();
		this.id = id;
		this.nom_matiere = nom_matiere;
		this.niveau_id = niveau_id;
	}
	
	public Matiére() {
		
	}
	

}
