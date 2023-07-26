package component.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import component.dao.HospitalDao;
import component.dto.HospitalDto;
import component.dto.LikeDto;
import component.dto.UpdateSelector;

@Service
public class HospitalService {
	@Autowired
	HospitalDao dao;
	
	public HospitalDto hospitalDetail(int id) {
		System.out.println("-----hospitalDetail service---------");

		return dao.hospitalDetail(id);
	}
	
	public List<HospitalDto>  getAllHospital() {
		System.out.println("-----getAllHospital stvice---------");

		return dao.getAllHospital();
	}
	
	public int createHospital(HospitalDto dto) {
		System.out.println("-----createHospital service---------");

		return dao.createHospital(dto);
	}
	
	public int handleLike(LikeDto dto) {
		
		return dao.handleLike(dto);
	}
	
	public int countHosLike(int hosId) {
		return dao.countHosLike(hosId);
	}
	
	public int updateHospital(UpdateSelector dto) {
		System.out.println("-------------updateHospital service----------");

		return dao.updateHospital(dto);
	}
}