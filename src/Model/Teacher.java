package Model;

import java.io.InputStream;

public class Teacher {
	private int id;
	
	private String first_name;
	private String last_name;
	private String date_birth;
	private String contact_number;
	private String email;
    private InputStream img;

	private int id_account;
	
	
	
	
	public Teacher() {
		
	}
	
	
	
	
	
	public Teacher(int id, String first_name, String last_name, String date_birth, String contact_number, String email,
			 InputStream img,int id_account) {
		super();
		this.id = id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.date_birth = date_birth;
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
	public String getDate_birth() {
		return date_birth;
	}
	public void setDate_birth(String date_birth) {
		this.date_birth = date_birth;
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

	public InputStream getImg() {
		return img;
	}

	public void setImg(InputStream img) {
		this.img = img;
	}

	public int getId_account() {
		return id_account;
	}
	public void setId_account(int id_account) {
		this.id_account = id_account;
	}
	

}
