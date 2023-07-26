package component.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import component.dto.HospitalDto;
import component.dto.LikeDto;
import component.dto.ReservDto;
import java.util.List;

import component.dto.ReservationDetailDto;
import component.dto.ReservationDto;
import component.dto.ReservationGetList;

public interface ReservationDao {
	List<ReservationDto> getreservlist(ReservationGetList data);
	ReservationDetailDto getreservdetail(int reservationId);
	int deletereserv(int reservId);
	int reservation(ReservDto dto);
	List<ReservDto> getReservByDate(String date_s, String hosId);
	List<ReservDto> getReservByHosId(int hosId);
}