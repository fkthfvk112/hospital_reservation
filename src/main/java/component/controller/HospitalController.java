package component.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import component.dto.HospitalDto;
import component.dto.LikeDto;
import component.dto.ReviewDto;
import component.dto.SearchDto;
import component.dto.UpdateSelector;
import component.dto.UploadPhotoDto;
import component.dto.UserDto;
import component.service.HospitalService;
import component.service.PhotoService;
import component.service.ReviewService;
import component.service.UserService;

import com.cloudinary.*;
import com.cloudinary.utils.ObjectUtils;

@Controller
@PropertySource("classpath:properties/cloudinary.properties")
public class HospitalController {

	@Autowired
	HospitalService service;
	
	@Autowired
	PhotoService photoService;
	
	@Autowired
	UserService userService;

	//-----------이동----------------------
	@GetMapping("hospitalDetail.do")
	public String hospitalDetail(
			Model model, 
			int id,
			@RequestParam(required=false, defaultValue = "recent") String type) {
		System.out.println("-----hospitalDetail 1:2---------");
		
		HospitalDto dto = service.hospitalDetail(id);
		List<UploadPhotoDto> photoDtos = photoService.getAllPhotoByHosId(id);
		model.addAttribute("hospitalDto", dto);
		model.addAttribute("sort_type", type);
		model.addAttribute("photoDtos", photoDtos);
		System.out.println("-----hospitalDetail 2:2---------");
		
		return "hospitalDetail";
	}
	
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

	@Value("${cloudinary.cloud-name}")
    private String cloudName;

    @Value("${cloudinary.api-key}")
    private String apiKey;

    @Value("${cloudinary.api-secret}")
    private String apiSecret;
    
	@PostMapping("createHospital.do")
	public String createHospital(HospitalDto dto, List<MultipartFile> imgFiles, HttpServletRequest request) {

		System.out.println("--------createHospital----------------");
        UserDto userDto = (UserDto) request.getSession().getAttribute("login");

		service.createHospital(dto);
		HospitalDto createdDto = service.getHospitalIdByName(dto.getTitle());
		int createdHosId = createdDto.getId();
		dto.setId(createdHosId);
		
		userService.updateHosIdToUser(userDto, dto);
		

		//-------------------이미지 처리 ---------------------
		
		Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", cloudName,
                "api_key", apiKey,
                "api_secret", apiSecret
        ));
		
		for(MultipartFile imgFile : imgFiles) {
			Map<String, Object> param = new HashMap<>();
			param.put("public_id", imgFile.getOriginalFilename());
			param.put("folder", "hospitalImg");
			try {
				Map uploadResult = cloudinary.uploader().upload(imgFile.getBytes(), param);
				
				String imageUrl = (String) uploadResult.get("url");
				String public_id = (String) uploadResult.get("public_id");
				UploadPhotoDto photoDto = new UploadPhotoDto(createdHosId, imageUrl, public_id);
				photoService.uploadPhoto(photoDto);
			
			} catch (IOException e) {
				System.out.println("-------이미지 에러-----------");
				e.printStackTrace();
			}
		}
		//-----생성 후 처리----------
		request.getSession().removeAttribute("login");
		userDto.setMyHospital_id(createdHosId);
		request.getSession().setAttribute("login", userDto);
		
		
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
		model.addAttribute("searchDto", searchDto);
		
		return "hosList";
	}
	
	@GetMapping("hosStarAvg.do")
	@ResponseBody
	public Double hosStarAvg(int hosId) {
		System.out.println("--------countHosLike Controller----------------");

		return service.hosStarAvg(hosId);
	}
}