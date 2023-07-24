package component.dto;

public class LikeDto {
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
	
	@Override
	public String toString() {
		return "LikeDto [userId=" + userId + ", hospitalId=" + hospitalId + "]";
	}
	
	
}
