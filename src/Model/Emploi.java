package Model;

public class Emploi {
	
	private int id;
	private String open_time;
	private String day;
    private int emploi_id;
	private int matiere_id;
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
	public int getEmploi_id() {
		return emploi_id;
	}
	public void setEmploi_id(int emploi_id) {
		this.emploi_id = emploi_id;
	}
	public int getMatiere_id() {
		return matiere_id;
	}
	public void setMatiere_id(int matiere_id) {
		this.matiere_id = matiere_id;
	}
	public Emploi(int id, String open_time, String day, int emploi_id, int matiere_id) {
		super();
		this.id = id;
		this.open_time = open_time;
		this.day = day;
		this.emploi_id = emploi_id;
		this.matiere_id = matiere_id;
	}
	  
	
	public Emploi() {
		
	}
	
	
	
	
	
	
	

}
