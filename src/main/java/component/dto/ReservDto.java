package component.dto;

import java.io.Serializable;

public class ReservDto implements Serializable {
	private String userId;
	private int hospitalId;
	private String reservDate;
	private String reservTime;
	private String description;
	private String wdate;
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
	public String getReservDate() {
		return reservDate;
	}
	public void setReservDate(String reservDate) {
		this.reservDate = reservDate;
	}
	public String getReservTime() {
		return reservTime;
	}
	public void setReservTime(String reservTime) {
		this.reservTime = reservTime;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	@Override
	public String toString() {
		return "ReservDto [userId=" + userId + ", hospitalId=" + hospitalId + ", reservDate=" + reservDate
				+ ", reservTime=" + reservTime + ", description=" + description + ", wdate=" + wdate + "]";
	}

}
