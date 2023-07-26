package component.dto;

import java.io.Serializable;

public class LikeDto implements Serializable{
	private String userId;
	private int hospitalId;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getHospitalId() {
		return hospitalId;
	}
	public void setHospitalId(int hospitalId) {
		this.hospitalId = hospitalId;
	}
	
	
}