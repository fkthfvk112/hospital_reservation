package component.dto;

import java.io.Serializable;

public class ReservationDto implements Serializable{

	private int id; // 예약 id auto-increament
	private String wdate; // DB에 wdate [yyyy-mm-dd HH:MM:SS] = reservYear+ reservDate + reservTime 
	private int state; // 1:예약 완료, 2: 취소
	private String description; // 예약 내용
	private String userId;
	private int hospitalId;
	
	public ReservationDto() {
	}

	public ReservationDto(int id, String wdate, int state, String description, String userId, int hospitalId) {
		super();
		this.id = id;
		this.wdate = wdate;
		this.state = state;
		this.description = description;
		this.userId = userId;
		this.hospitalId = hospitalId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
		return "ReservationDto [id=" + id + ", wdate=" + wdate + ", state=" + state + ", description=" + description
				+ ", userId=" + userId + ", hospitalId=" + hospitalId + "]";
	}

	
	
}
