package component.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;

import component.dto.HospitalDto;
import component.dto.LikeDto;
import component.dto.UpdateSelector;

@Repository
public class HospitalDao {
	@Autowired
	SqlSessionTemplate session;
	String ns = "Hospital.";
	
	public HospitalDto hospitalDetail(int id) {
		System.out.println("-----hospitalDao---------");

		return session.selectOne(ns + "getHospital", id);
	}
	
	public List<HospitalDto> getAllHospital() {
		System.out.println("-----getAllHospital dao---------");

		return session.selectList(ns + "getAllHospital");
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
}