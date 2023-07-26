package component.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import component.dto.ReservDto;
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
	
	@Override
	public int reservation(ReservDto dto) {
		System.out.println("-----hospitalDao---------");
		String tempTime = dto.getReservTime() + ":00";
		
		String wdate = dto.getReservDate() + " " + tempTime;
		System.out.println("예약 시간 " + wdate);
		dto.setWdate(wdate);
		
		
		return session.insert(ns + "reservation", dto);
	}
	
	@Override
	public List<ReservDto> getReservByDate(String date_s, String hosId){
		System.out.println("-----검색 날짜 : " + date_s);
        Map<String, String> reservMap = new HashMap<>();
        reservMap.put("date_s", date_s);
        reservMap.put("hosId", hosId);
        
		return session.selectList(ns + "getReservByDate", reservMap);
	}
	
	@Override
	public List<ReservDto> getReservByHosId(int hosId) {
		return session.selectList(ns + "getReservByHosId", hosId);
	}
}
