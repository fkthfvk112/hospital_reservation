package component.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import component.dto.HospitalDto;
import component.service.HospitalService;

@Controller
public class HospitalController {
	
	@Autowired
	HospitalService service;
	
	@GetMapping("hospitalDetail.do")
	public void hospitalDetail() {
		System.out.println("-----hospitalDetail 1:2---------");

		HospitalDto dto = service.hospitalDetail(1);
		System.out.println(dto.getDescription());
		System.out.println("-----hospitalDetail 2:2---------");
	}
}
