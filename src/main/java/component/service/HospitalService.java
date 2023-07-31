package component.service;

import java.util.List;

import component.dto.HospitalDto;
import component.dto.LikeDto;
import component.dto.SearchDto;
import component.dto.UpdateSelector;
import component.dto.UserDto;

public interface HospitalService {
	HospitalDto hospitalDetail(int id);
	List<HospitalDto>  getAllHospital();
	public int createHospital(HospitalDto dto);
	int handleLike(LikeDto dto);
	int countHosLike(int hosId);
	int updateHospital(UpdateSelector dto);
	List<HospitalDto> searchHospital(SearchDto dto);
	Double hosStarAvg(int hosId);
	HospitalDto getHospitalIdByName(String hosName);
}
