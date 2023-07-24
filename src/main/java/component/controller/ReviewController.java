package component.controller;

import java.io.Console;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import component.dto.ReviewDto;
import component.dto.UserDto;
import component.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	ReviewService service;
	
	// review 목록 - 최신순 
	@GetMapping("review.do")
	public String recentList(ReviewDto dto, Model model) {
		System.out.println("ReviewController recentList() " + new Date());
		
		List<ReviewDto> list = service.recentList(dto);
		//System.out.println("recentList"+list);
		
		System.out.println("ReviewController recentList() 1");
		
		model.addAttribute("list", list);
		
		System.out.println("ReviewController recentList() 2");
		return "review";
	}



	// review 목록 - 평점높은순
	@GetMapping("scoreUplist.do")
	public String scoreUplist(ReviewDto dto, Model model) {
		System.out.println("ReviewController scoreUplist() " + new Date());
		
		List<ReviewDto> list = service.scoreUplist(dto);
		//System.out.println("scoreUplist"+list);
		System.out.println("ReviewController scoreUplist() 1");
		
		model.addAttribute("list", list);
		System.out.println("ReviewController scoreUplist() 2");
		
		return "review";
	}
	
	// review 목록 - 평점낮은순
	@GetMapping("scoreDownlist.do")
	public String scoreDownlist(ReviewDto dto, Model model) {
		System.out.println("ReviewController scoreDownlist() " + new Date());
		
		List<ReviewDto> list = service.scoreDownlist(dto);
		//System.out.println("scoreDownlist"+list);
		System.out.println("ReviewController scoreDownlist() 1");
		
		model.addAttribute("list", list);
		System.out.println("ReviewController scoreDownlist() 2");
		
		return "review";
	}
	

	// 리뷰 등록하기
	@PostMapping("reviewWriteAf.do")
	public String reviewWrite(ReviewDto dto) {
		System.out.println("ReviewController reviewWrite() " + new Date());
		
		boolean isS = service.reviewWrite(dto);
		
		if(isS) {
			System.out.println("리뷰 작성에 성공했습니다");
		}else {
			System.out.println("리뷰 작성에 실패했습니다");
		}
		System.out.println("reviewWrite 1");
		
		return "redirect:/review.do?hospital_id=1"; // 임시로 병원번호를 설정함
		//return "redirect:/review.do";
	}
	

	
	
	
	
}















