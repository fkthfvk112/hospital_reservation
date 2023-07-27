package component.dto;

public class MyReviewDto {

	
	private int rid;
	private String rwdate;
	private int rscore;
	private String rcontent;
	private int hospital_id;
	private String user_id;
	private String htitle;
	private String hsort;	
	private String location_latitude;
	private String location_longitude;
	
	public MyReviewDto() {
	}

	public MyReviewDto(int rid, String rwdate, int rscore, String rcontent, int hospital_id, String user_id,
			String htitle, String hsort, String location_latitude, String location_longitude) {
		super();
		this.rid = rid;
		this.rwdate = rwdate;
		this.rscore = rscore;
		this.rcontent = rcontent;
		this.hospital_id = hospital_id;
		this.user_id = user_id;
		this.htitle = htitle;
		this.hsort = hsort;
		this.location_latitude = location_latitude;
		this.location_longitude = location_longitude;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getRwdate() {
		return rwdate;
	}

	public void setRwdate(String rwdate) {
		this.rwdate = rwdate;
	}

	public int getRscore() {
		return rscore;
	}

	public void setRscore(int rscore) {
		this.rscore = rscore;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
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

	public String getHtitle() {
		return htitle;
	}

	public void setHtitle(String htitle) {
		this.htitle = htitle;
	}

	public String getHsort() {
		return hsort;
	}

	public void setHsort(String hsort) {
		this.hsort = hsort;
	}

	public String getLocation_latitude() {
		return location_latitude;
	}

	public void setLocation_latitude(String location_latitude) {
		this.location_latitude = location_latitude;
	}

	public String getLocation_longitude() {
		return location_longitude;
	}

	public void setLocation_longitude(String location_longitude) {
		this.location_longitude = location_longitude;
	}
	
	
}
