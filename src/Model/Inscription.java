package Model;

import java.io.InputStream;

public class Inscription {
	private int id;
	private String  number;
	private String first_name;
	private String last_name;
	private String date_birth;
	private String academic_year;
	private String email;
    private InputStream inputStream;
    
    public Inscription() {
    	
    }
	public Inscription(int id, String number, String first_name, String last_name, String date_birth, String academic_year,
			String email, InputStream inputStream) {
		super();
		this.id = id;
		this.number = number;
		this.first_name = first_name;
		this.last_name = last_name;
		this.date_birth = date_birth;
		this.academic_year = academic_year;
		this.email = email;
		this.inputStream = inputStream;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
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
	public String getAcademic_year() {
		return academic_year;
	}
	public void setAcademic_year(String academic_year) {
		this.academic_year = academic_year;
	}
	

}
