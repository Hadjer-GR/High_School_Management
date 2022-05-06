package Model;


public class Parent {
	
	private int id;
	private String contact_number;
	private String email;
    private String img;

	private int id_account;
	
	
	public Parent() {
		
	}
	
	
	
	public Parent(int id, String contact_number, String email, String img,int id_account) {
		super();
		this.id = id;
		this.contact_number = contact_number;
		this.email = email;
		this.img=img;
		this.id_account = id_account;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContact_number() {
		return contact_number;
	}
	public void setContact_number(String contact_number) {
		this.contact_number = contact_number;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}	
	

	public String getImg() {
		return img;
	}



	public void setImg(String img) {
		this.img = img;
	}



	public int getId_account() {
		return id_account;
	}
	public void setId_account(int id_account) {
		this.id_account = id_account;
	}
	
	
	

}
