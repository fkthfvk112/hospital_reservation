package component.dto;

import java.io.Serializable;

import org.springframework.context.annotation.ComponentScan;

public class HospitalDto implements Serializable{
	private int id;
	private String title;
	private String description;
	private String sort;
	private String location_latitude;
	private String location_longitude;
	private String staff_id;
	private String del_date;
	private String opertime;
	private Double starAvg;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
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
	public String getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(String staff_id) {
		this.staff_id = staff_id;
	}
	public String getDel_date() {
		return del_date;
	}
	public void setDel_date(String del_date) {
		this.del_date = del_date;
	}
	public String getOpertime() {
		return opertime;
	}
	public void setOpertime(String opertime) {
		this.opertime = opertime;
	}
	public Double getStarAvg() {
		return starAvg;
	}
	public void setStarAvg(Double starAvg) {
		this.starAvg = starAvg;
	}
	@Override
	public String toString() {
		return "HospitalDto [id=" + id + ", title=" + title + ", description=" + description + ", sort=" + sort
				+ ", location_latitude=" + location_latitude + ", location_longitude=" + location_longitude
				+ ", staff_id=" + staff_id + ", del_date=" + del_date + ", opertime=" + opertime + ", starAvg="
				+ starAvg + "]";
	}
	
}