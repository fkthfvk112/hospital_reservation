package component.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import component.dto.ReservationDetailDto;
import component.dto.ReservationDto;
import component.dto.ReservationGetList;

@Repository
public class ReservationDaoImpl implements ReservationDao{

	@Autowired
	SqlSession session;
	
	String ns = "Reservation.";

	@Override
	public List<ReservationDto> getreservlist(ReservationGetList data) {
		return session.selectList(ns+"getreservlist", data);
	}

	@Override
	public ReservationDetailDto getreservdetail(int reservationId) {
		return session.selectOne(ns+"getreservdetail", reservationId);
	}

	@Override
	public int deletereserv(int reservId) {
		return session.delete(ns+"deletereserv", reservId);
	}
}
