package Model;

public class Group {
	private int id;
	 private int nbr_class;
	 private int id_period;
	 private String specialiste ;
	 private int id_niveau;
	 private int emlpoi_id;
	 
	public int getEmlpoi_id() {
		return emlpoi_id;
	}
	public void setEmlpoi_id(int emlpoi_id) {
		this.emlpoi_id = emlpoi_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNbr_class() {
		return nbr_class;
	}
	public void setNbr_class(int nbr_class) {
		this.nbr_class = nbr_class;
	}
	public int getId_period() {
		return id_period;
	}
	public void setId_period(int id_period) {
		this.id_period = id_period;
	}
	public String getSpecialiste() {
		return specialiste;
	}
	public void setSpecialiste(String specialiste) {
		this.specialiste = specialiste;
	}
	public int getId_niveau() {
		return id_niveau;
	}
	public void setId_niveau(int id_niveau) {
		this.id_niveau = id_niveau;
	}
	
	
	
	public Group(int id, int nbr_class, int id_period, String specialiste, int id_niveau, int emlpoi_id) {
		super();
		this.id = id;
		this.nbr_class = nbr_class;
		this.id_period = id_period;
		this.specialiste = specialiste;
		this.id_niveau = id_niveau;
		this.emlpoi_id = emlpoi_id;
	}
	public Group() {
		
	}
	 
	

}
