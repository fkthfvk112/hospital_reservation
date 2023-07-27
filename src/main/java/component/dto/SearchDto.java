package component.dto;

import java.io.Serializable;

public class SearchDto implements Serializable{
	private String conditionOne;//최신순, 평점 높은순, 낮은순
	private int conditionTwo;//거리
	private String conditionThree;//검색 영역
	private String userLocation;
	public String getConditionOne() {
		return conditionOne;
	}
	public void setConditionOne(String conditionOne) {
		this.conditionOne = conditionOne;
	}
	public int getConditionTwo() {
		return conditionTwo;
	}
	public void setConditionTwo(int conditionTwo) {
		this.conditionTwo = conditionTwo;
	}
	public String getConditionThree() {
		return conditionThree;
	}
	public void setConditionThree(String conditionThree) {
		this.conditionThree = conditionThree;
	}
	public String getUserLocation() {
		return userLocation;
	}
	public void setUserLocation(String userLocation) {
		this.userLocation = userLocation;
	}
	@Override
	public String toString() {
		return "SearchDto [conditionOne=" + conditionOne + ", conditionTwo=" + conditionTwo + ", conditionThree="
				+ conditionThree + ", userLocation=" + userLocation + "]";
	}
	
}
