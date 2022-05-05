package Model;

public class Type_Account {
	private String type;
	private int id_account;

	public int getId_account() {
		return id_account;
	}

	public void setId_account(int id_account) {
		this.id_account = id_account;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Type_Account(String type,int id_account) {
		super();
		this.type = type;
		this.id_account=id_account;
	}

	public Type_Account() {
		super();
	}
	

}
