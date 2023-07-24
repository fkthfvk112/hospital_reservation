package component.dto;

import java.io.Serializable;

public class ReviewDto implements Serializable{
	private int id;
	private int hospital_id;
	private String user_id;
	private String content;
	private String wdate;
	private int score;
	
	public ReviewDto() {
	}

	public ReviewDto(int id, int hospital_id, String user_id, String content, String wdate, int score) {
		super();
		this.id = id;
		this.hospital_id = hospital_id;
		this.user_id = user_id;
		this.content = content;
		this.wdate = wdate;
		this.score = score;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getHospital_id() {
		return hospital_id;
	}

	public void setHospital_id(int hospital_id) {
		this.hospital_id = hospital_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "ReviewDto [id=" + id + ", hospital_id=" + hospital_id + ", user_id=" + user_id + ", content=" + content
				+ ", wdate=" + wdate + ", score=" + score + "]";
	}
	
	
	
	
	
	
}
