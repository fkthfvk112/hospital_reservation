package component.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import component.dao.HospitalDao;
import component.dto.HospitalDto;

@Service
public class HospitalService {
	@Autowired
	HospitalDao dao;
	public HospitalDto hospitalDetail(int id) {
		System.out.println("-----hospitalService---------");

		return dao.hospitalDetail(id);
	}
}