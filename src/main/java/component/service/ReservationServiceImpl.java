package component.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import component.dao.ReservationDao;
import component.dto.ReservationDetailDto;
import component.dto.ReservationDto;
import component.dto.ReservationGetList;

@Service
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	ReservationDao dao;

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
