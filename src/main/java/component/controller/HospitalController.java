package component.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import component.dto.HospitalDto;
import component.dto.LikeDto;
import component.service.HospitalService;

@Controller
public class HospitalController {
	
	@Autowired
	HospitalService service;
	
	@GetMapping("hospitalDetail.do")
	public String hospitalDetail(Model model, int id) {
		System.out.println("-----hospitalDetail 1:2---------");
		
		HospitalDto dto = service.hospitalDetail(id);
		model.addAttribute("hospitalDto", dto);
		
		System.out.println(dto.getDescription());
		System.out.println("-----hospitalDetail 2:2---------");
		
		return "hospitalDetail";
	}
	
	@PostMapping("handleLike.do")
	@ResponseBody
	public int handleLike(LikeDto dto) {
		System.out.println("-----handleLike 1:2---------");
		System.out.println(dto.toString());
		return service.handleLike(dto);
	}
	
	@GetMapping("toHosCreate.do")
	public String toHosCreate() {
		return "hospitalCreate";
	}
	
	@PostMapping("createHospital.do")
	public String createHospital(HospitalDto dto) {
		System.out.println("--------createHospital----------------");
		System.out.println(dto.toString());
		
		service.createHospital(dto);
		
		return "home";
	}
}