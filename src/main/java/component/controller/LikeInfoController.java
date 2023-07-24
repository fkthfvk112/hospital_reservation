package component.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.patch;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import component.dto.HospitalDto;
import component.dto.LikeInfoDto;
import component.dto.UserDto;
import component.service.LikeInfoService;

@Controller
public class LikeInfoController {

	@Autowired
	LikeInfoService service;
	
	@GetMapping("mylike.do")
	public String mylike(Model model, HttpServletRequest request) {
		System.out.println("LikeInfoController mylike() " + new Date());
		
		UserDto dto = (UserDto)request.getSession().getAttribute("login");
		String userid = dto.getId();
		
	
		List<HospitalDto>  likeHospitalList = service.gethospitaldetaillist(userid);
		
		
		model.addAttribute("likeHospitalList", likeHospitalList);
		
		model.addAttribute("content", "mylike"); // 마이 페이지 사이드 메뉴에서 선택시 mylike를 content로 넘겨줘야 마이 페이지 안에서 mylike.jsp가 열림
		
		return "mypage";
	}
	
	@ResponseBody
	@GetMapping("canclelike.do")
	public boolean canclelike(LikeInfoDto dto) {
		System.out.println("LikeInfoController canclelike() " + new Date());
		
		return service.canclelike(dto);
	}
	
}
