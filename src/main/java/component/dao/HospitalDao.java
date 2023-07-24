package component.dao;


import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import component.dto.HospitalDto;
import component.dto.LikeDto;

@Repository
public class HospitalDao {
	@Autowired
	SqlSessionTemplate session;
	String ns = "Hospital.";
	
	public HospitalDto hospitalDetail(int id) {
		System.out.println("-----hospitalDao---------");

		return session.selectOne(ns + "getHospital", id);
	}
	
	public int createHospital(HospitalDto dto) {
		System.out.println("-----createHospital dao---------");
		
		return session.insert(ns + "createHospital", dto);
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
}