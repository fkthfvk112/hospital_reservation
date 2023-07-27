package component.dto;

import java.io.Serializable;

public class UserDto implements Serializable{
	private String id;
	private String pw;
	private String name;
	private String email;
	private int auth;
	private int warning;
	private int myHopital_id;
	
	private String newPassword;
	
	public UserDto() {
	}
	
	public UserDto(String id, String pw, String name, String email, int auth, int warning, int myHopital_id) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.auth = auth;
		this.warning = warning;
		this.myHopital_id = myHopital_id;
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

	public int getMyHopital_id() {
		return myHopital_id;
	}

	public void setMyHopital_id(int myHopital_id) {
		this.myHopital_id = myHopital_id;
	}

	@Override
	public String toString() {
		return "UserDto [id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email + ", auth=" + auth
				+ ", warning=" + warning + ", myHopital_id=" + myHopital_id + "]";
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
}