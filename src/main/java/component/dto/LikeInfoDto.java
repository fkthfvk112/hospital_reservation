package component.dto;

import java.io.Serializable;

public class LikeInfoDto implements Serializable{

	private int id;
	private String userId;
	private int hospitalId;
	
	public LikeInfoDto() {
	}

	public LikeInfoDto(int id, String userId, int hospitalId) {
		super();
		this.id = id;
		this.userId = userId;
		this.hospitalId = hospitalId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

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

	@Override
	public String toString() {
		return "LikeInfoDto [id=" + id + ", userId=" + userId + ", hospitalId=" + hospitalId + "]";
	}


	
}
