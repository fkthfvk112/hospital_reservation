package component.dto;

public class UserDto {
	private String id;
	private String pw;
	private String name;
	private String email;
	private int auth;
	private int warning;
	private int myHospital_id;
	
	public UserDto() {
	}

	public UserDto(String id, String pw, String name, String email, int auth, int warning, int myHospital_id) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.auth = auth;
		this.warning = warning;
		this.myHospital_id = myHospital_id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public int getWarning() {
		return warning;
	}

	public void setWarning(int warning) {
		this.warning = warning;
	}

	public int getMyHospital_id() {
		return myHospital_id;
	}

	public void setMyHospital_id(int myHospital_id) {
		this.myHospital_id = myHospital_id;
	}
	
	
}
