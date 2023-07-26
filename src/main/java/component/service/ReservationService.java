package component.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import component.dto.ReservDto;
import component.dto.ReservationDetailDto;
import component.dto.ReservationDto;
import component.dto.ReservationGetList;


public interface ReservationService {

	List<ReservationDto> getreservlist(ReservationGetList data);
	ReservationDetailDto getreservdetail(int reservationId);
	boolean deletereserv(int reservId);
	int reservation(ReservDto dto);
	List<ReservDto> getReservByDate(String date_s, String hosId);
	List<ReservDto> getReservByHosId(int hosId);
}
