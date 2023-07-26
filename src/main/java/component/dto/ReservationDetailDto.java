package component.dto;

public class ReservationDetailDto {

	private int rid;
	private String rdate;
	private int rstate;
	private String rdescription;
	private String userId;
	private int hospitalId;
	private String htitle;
	private String hsort;
	
	public ReservationDetailDto() {
	}

	public ReservationDetailDto(int rid, String rdate, int rstate, String rdescription, String userId, int hospitalId,
			String htitle, String hsort) {
		super();
		this.rid = rid;
		this.rdate = rdate;
		this.rstate = rstate;
		this.rdescription = rdescription;
		this.userId = userId;
		this.hospitalId = hospitalId;
		this.htitle = htitle;
		this.hsort = hsort;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public int getRstate() {
		return rstate;
	}

	public void setRstate(int rstate) {
		this.rstate = rstate;
	}

	public String getRdescription() {
		return rdescription;
	}

	public void setRdescription(String rdescription) {
		this.rdescription = rdescription;
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
	
	
	
	
}
