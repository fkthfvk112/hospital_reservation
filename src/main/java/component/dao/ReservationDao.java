package component.dao;

import java.util.List;

import component.dto.ReservationDetailDto;
import component.dto.ReservationDto;
import component.dto.ReservationGetList;

public interface ReservationDao {

	List<ReservationDto> getreservlist(ReservationGetList data);
	ReservationDetailDto getreservdetail(int reservationId);
	int deletereserv(int reservId);
}
