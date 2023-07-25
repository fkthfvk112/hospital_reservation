package component.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import component.dao.HospitalDaoImpl;
import component.dto.HospitalDto;

@Service
public class HospitalServiceImpl implements HopitalService{
	@Autowired
	HospitalDaoImpl dao;
	public HospitalDto hospitalDetail(int id) {
		System.out.println("-----hospitalService---------");

		return dao.hospitalDetail(id);
	}
	
	// wjy
	
	
}
