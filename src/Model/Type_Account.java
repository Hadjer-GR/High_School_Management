package Model;

public class Type_Account {
	private String type;
	private int id_account;
	private int id_user;

	public int getId_user() {
		return id_user;
	}

	public void setId_user(int id_user) {
		this.id_user = id_user;
	}

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

	public Type_Account(String type,int id_account,int id_user) {
		super();
		this.type = type;
		this.id_account=id_account;
		this.id_user=id_user;
	}

	public Type_Account() {
		super();
	}
	

}
