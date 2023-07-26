package component.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import component.dao.ReservationDao;
import component.dto.ReservDto;
import component.dto.ReservationDetailDto;
import component.dto.ReservationDto;
import component.dto.ReservationGetList;

@Service
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	ReservationDao dao;

	@Override
	public int reservation(ReservDto dto) {
		System.out.println("-----reservation service---------");

		return dao.reservation(dto);
	}
	
	@Override
	public List<ReservDto> getReservByDate(String date_s, String hosId) {
		System.out.println("-----getReservByDate service---------");
		return dao.getReservByDate(date_s, hosId);
	}
	
	@Override
	public List<ReservDto> getReservByHosId(int hosId) {
		return dao.getReservByHosId(hosId);
	}
	
	@Override
	public List<ReservationDto> getreservlist(ReservationGetList data) {
		return dao.getreservlist(data);
	}

	@Override
	public ReservationDetailDto getreservdetail(int reservationId) {
		return dao.getreservdetail(reservationId);
	}

	@Override
	public boolean deletereserv(int reservId) {
		return dao.deletereserv(reservId) >0;
	}
	
}
