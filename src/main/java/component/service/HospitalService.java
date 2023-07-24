package component.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import component.dao.HospitalDao;
import component.dto.HospitalDto;
import component.dto.LikeDto;

@Service
public class HospitalService {
	@Autowired
	HospitalDao dao;
	
	public HospitalDto hospitalDetail(int id) {
		System.out.println("-----hospitalDetail service---------");

		return dao.hospitalDetail(id);
	}
	
	public int createHospital(HospitalDto dto) {
		System.out.println("-----createHospital service---------");

		return dao.createHospital(dto);
	}
	
	public int handleLike(LikeDto dto) {
		
		return dao.handleLike(dto);
	}
}