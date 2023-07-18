package component.dao;


import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import component.dto.HospitalDto;

@Repository
public class HospitalDao {
	@Autowired
	SqlSessionTemplate session;
	String ns = "Hospital.";
	public HospitalDto hospitalDetail(int id) {
		System.out.println("-----hospitalD---------");

		return session.selectOne(ns + "getHospital", id);
	}
}

