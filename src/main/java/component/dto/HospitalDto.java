package component.dto;

import java.io.Serializable;

import org.springframework.context.annotation.ComponentScan;

public class HospitalDto implements Serializable{
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
	public int getPhoto_id() {
		return photo_id;
	}
	public void setPhoto_id(int photo_id) {
		this.photo_id = photo_id;
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
	public boolean isHasStaff() {
		return hasStaff;
	}
	public void setHasStaff(boolean hasStaff) {
		this.hasStaff = hasStaff;
	}
	public int getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(int staff_id) {
		this.staff_id = staff_id;
	}
	public String getDel_date() {
		return del_date;
	}
	public void setDel_date(String del_date) {
		this.del_date = del_date;
	}
	private int id;
	private String title;
	private String description;
	private int photo_id;
	private String sort;
	private String location_latitude;
	private String location_longitude;
	private boolean hasStaff;
	private int staff_id;
	private String del_date;

}