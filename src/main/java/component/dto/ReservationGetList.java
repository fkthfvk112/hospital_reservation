package component.dto;

import java.io.Serializable;

public class ReservationGetList implements Serializable{
	String id;
	String yyyymm;
	
	public ReservationGetList() {
	}

	public ReservationGetList(String id, String yyyymm) {
		this.id = id;
		this.yyyymm = yyyymm;
	}
	
	
}
