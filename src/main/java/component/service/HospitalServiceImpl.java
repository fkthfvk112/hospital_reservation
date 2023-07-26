package component.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import component.dao.HospitalDao;
import component.dao.HospitalDaoImpl;
import component.dto.HospitalDto;
import component.dto.LikeDto;
import component.dto.UpdateSelector;

@Service
public class HospitalServiceImpl implements HospitalService{
	@Autowired
	HospitalDao dao;

	@Override
	public HospitalDto hospitalDetail(int id) {
		System.out.println("-----hospitalDetail service---------");

		return dao.hospitalDetail(id);
	}
	
	@Override
	public List<HospitalDto>  getAllHospital() {
		System.out.println("-----getAllHospital stvice---------");

		return dao.getAllHospital();
	}
	
	@Override
	public int createHospital(HospitalDto dto) {
		System.out.println("-----createHospital service---------");

		return dao.createHospital(dto);
	}
	
	@Override
	public int handleLike(LikeDto dto) {
		
		return dao.handleLike(dto);
	}
	
	@Override
	public int countHosLike(int hosId) {
		return dao.countHosLike(hosId);
	}
	
	@Override
	public int updateHospital(UpdateSelector dto) {
		System.out.println("-------------updateHospital service----------");

		return dao.updateHospital(dto);
	}
}
