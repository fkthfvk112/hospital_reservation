package component.dto;

import java.io.Serializable;

public class UploadPhotoDto implements Serializable{
	private int id;
	private int hospital_id;
	private String url;
	private String newfilename;
	
	public UploadPhotoDto(int hospital_id, String url, String newfilename) {
		super();
		this.hospital_id = hospital_id;
		this.url = url;
		this.newfilename = newfilename;
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getNewfilename() {
		return newfilename;
	}
	public void setNewfilename(String newfilename) {
		this.newfilename = newfilename;
	}
	@Override
	public String toString() {
		return "UploadPhotoDto [id=" + id + ", hospital_id=" + hospital_id + ", url=" + url + ", newfilename="
				+ newfilename + "]";
	}
}

