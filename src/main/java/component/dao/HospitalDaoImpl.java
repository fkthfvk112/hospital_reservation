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
import component.dto.SearchDto;
import component.dto.UpdateSelector;

@Repository
public class HospitalDaoImpl implements HospitalDao{
	@Autowired
	SqlSessionTemplate session;
	String ns = "Hospital.";
	public HospitalDto hospitalDetail(int id) {
		System.out.println("-----hospitalD---------");

		return session.selectOne(ns + "getHospital", id);
	}
	
	public List<HospitalDto> getAllHospital() {
		System.out.println("-----getAllHospital dao---------");
		List<HospitalDto> hosDtoList = session.selectList(ns + "getAllHospital");
		
		for(HospitalDto hosDto:hosDtoList) {
			Double starAvg = session.selectOne(ns + "hosStarAvg", hosDto.getId());
			System.out.println("별점" + starAvg);
			hosDto.setStarAvg(starAvg);
		}

		return hosDtoList;
	}
	
	public int createHospital(HospitalDto dto) {
		System.out.println("-----createHospital dao---------");
		
		return session.insert(ns + "createHospital", dto);
	}
	
	//update
	public int updateHospital(UpdateSelector dto) {
		int selection = dto.getSelection();
		System.out.println("-------------updateHospital dao----------");

		System.out.println(dto.toString());
        Map<String, String> updateMap = new HashMap<>();
        updateMap.put("content", dto.getContent());
        updateMap.put("hosId", Integer.toString(dto.getHosId()));
        
		switch(selection) {
			case 0:
				session.update(ns + "updateDescription", updateMap);
			break;
			
			case 1:
				session.update(ns + "updateOperTime", updateMap);
			break;	
			
			case 2:
				session.update(ns + "updateSort", updateMap);
			break;
		}
		
		return 1;
	}
	
	
	public int handleLike(LikeDto dto) {
		int result = 0;
		int isLiked = session.selectOne(ns + "countLikeCondition", dto);
		System.out.println("-----handleLike isLiked -----" + isLiked);
		if(isLiked >= 1) {//이 유저가 이 병원을 이미 좋아함
			session.delete(ns + "unsetLike", dto);
			System.out.println("--------좋아요 취소--------");
		}else {
			session.insert(ns + "setLike", dto);
			System.out.println("--------좋아요--------");
		}
		return result;
	}
	
	public int countHosLike(int hosId) {
		return session.selectOne(ns + "countHosLike", hosId);
	}

	@Override
	public List<HospitalDto> searchHospital(SearchDto searchDto) {
		List<HospitalDto> hosDtoList = null;
		
		System.out.println("---------------search Dto-----" + searchDto.toString());
		switch(searchDto.getConditionOne()) {
			case "default":
				System.out.println("-------디폴트");
				hosDtoList = session.selectList(ns + "searchHospitalDefault", searchDto);
				break;
				
			case "highScore":
				hosDtoList = session.selectList(ns + "searchHospitalStarDesc", searchDto);
				break;
				
			case "lowScore":
				hosDtoList = session.selectList(ns + "searchHospitalStarAsc", searchDto);
				break;
				
			case "highReview":
				hosDtoList = session.selectList(ns + "searchHospitalReviewDesc", searchDto);
				break;
				
			case "lowReview":
				hosDtoList = session.selectList(ns + "searchHospitalReviewAsc", searchDto);
				break;
		}
		
		for(HospitalDto hosDto:hosDtoList) {
			Double starAvg = session.selectOne(ns + "hosStarAvg", hosDto.getId());
			System.out.println("별점" + starAvg);
			hosDto.setStarAvg(starAvg);
		}
		
		return hosDtoList;
	}

	@Override
	public Double hosStarAvg(int hosId) {
		return session.selectOne(ns + "hosStarAvg", hosId);
	}
	
	@Override
	public HospitalDto getHospitalIdByName(String hosName) {
		return session.selectOne(ns + "getHospitalIdByName", hosName);
	}
}

