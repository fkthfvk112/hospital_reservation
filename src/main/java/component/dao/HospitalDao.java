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
import component.dto.SearchDto;
import component.dto.UpdateSelector;

public interface HospitalDao {

	HospitalDto hospitalDetail(int id);
	List<HospitalDto> getAllHospital();
	int createHospital(HospitalDto dto);
	int updateHospital(UpdateSelector dto);
	int handleLike(LikeDto dto);
	int countHosLike(int hosId);
	List<HospitalDto> searchHospital(SearchDto dto);
	Double hosStarAvg(int hosId);
}
