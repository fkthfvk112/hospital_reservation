package component.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import component.dto.HospitalDto;
import component.dto.LikeDto;
import component.dto.ReviewDto;
import component.dto.SearchDto;
import component.dto.UpdateSelector;
import component.service.HospitalService;
import component.service.ReviewService;

@Controller
public class HospitalController {

	@Autowired
	HospitalService service;

	//-----------이동----------------------
	@GetMapping("hospitalDetail.do")
	public String hospitalDetail(
			Model model, 
			int id,
			@RequestParam(required=false, defaultValue = "recent") String type) {
		System.out.println("-----hospitalDetail 1:2---------");
		
		HospitalDto dto = service.hospitalDetail(id);
		model.addAttribute("hospitalDto", dto);
		model.addAttribute("sort_type", type);
		System.out.println("-----hospitalDetail 2:2---------");
		
		return "hospitalDetail";
	}
	/*
	 @GetMapping("hospitalDetail.do")
	public String hospitalDetail(Model model, int id) {
		System.out.println("-----hospitalDetail 1:2---------");
		
		HospitalDto dto = service.hospitalDetail(id);
		model.addAttribute("hospitalDto", dto);
		
		System.out.println("-----hospitalDetail 2:2---------");
		
		return "hospitalDetail";
	}
	 */
	/*
	 @GetMapping("hospitalDetail.do")
	public String hospitalDetail(
			Model model, 
			int id,
			@RequestParam(required=false, defaultValue = "recent") String type) {
		System.out.println("-----hospitalDetail 1:2---------");
		
		HospitalDto dto = service.hospitalDetail(id);
		model.addAttribute("hospitalDto", dto);
		model.addAttribute("sort_type", type);
		System.out.println("-----hospitalDetail 2:2---------");
		
		return "hospitalDetail";
	}
	 */
	
	@GetMapping("toHosCreate.do")
	public String toHosCreate() {
		return "hospitalCreate";
	}
	
	@PostMapping("updateHospital.do")
	@ResponseBody
	public String updateHospital(Model model, UpdateSelector dto) {
		service.updateHospital(dto);
		System.out.println("-------------updateHospital Controller----------");
        String json = "{\"success\": \"success\"}";
		return json;
	}
	
	@GetMapping("hosList.do")
	public String hosList(Model model) {
		List<HospitalDto> dtoList = service.getAllHospital();

		model.addAttribute("hospitalDtoList", dtoList);

		System.out.println("컨트롤러");
		return "hosList";
	}
	
	//---------------------------------------------
	@PostMapping("handleLike.do")
	@ResponseBody
	public int handleLike(LikeDto dto) {
		System.out.println("-----handleLike 1:2---------");
		System.out.println(dto.toString());
		return service.handleLike(dto);
	}

	
	@PostMapping("createHospital.do")
	public String createHospital(HospitalDto dto) {
		System.out.println("--------createHospital----------------");
		service.createHospital(dto);
		HospitalDto createdDto = service.getHospitalIdByName(dto.getTitle());
		int createdHosId = createdDto.getId();
		return "redirect:hospitalDetail.do?id=" + createdHosId;
	}
	
	@GetMapping("countHosLike.do")
	@ResponseBody
	public int countHosLike(int hosId) {
		System.out.println("--------countHosLike Controller----------------");

		return service.countHosLike(hosId);
	}
	
	@GetMapping("searchHospital.do")
	public String searchHospital(SearchDto searchDto, Model model) {
		System.out.println("--------searchHospital Controller----------------");
		List<HospitalDto> dtoList = service.searchHospital(searchDto); 
		model.addAttribute("hospitalDtoList", dtoList);
		
		return "hosList";
	}
	
	@GetMapping("hosStarAvg.do")
	@ResponseBody
	public Double hosStarAvg(int hosId) {
		System.out.println("--------countHosLike Controller----------------");

		return service.hosStarAvg(hosId);
	}
}