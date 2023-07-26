package component.service;

import java.util.List;

import component.dto.ReservationDetailDto;
import component.dto.ReservationDto;
import component.dto.ReservationGetList;

public interface ReservationService {

	List<ReservationDto> getreservlist(ReservationGetList data);
	ReservationDetailDto getreservdetail(int reservationId);
	boolean deletereserv(int reservId);
}
