package component.controller;

import java.io.Console;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import component.dto.MyReviewDto;
import component.dto.ReviewDto;
import component.dto.UserDto;
import component.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	ReviewService service;
	
	// review 목록 - 최신순 
	@GetMapping("review.do")
	@ResponseBody
	public List<ReviewDto> recentList(int hosId, String type) {
		System.out.println("ReviewController recentList() " + new Date());
		System.out.println("ReviewController recentList() 1 병원 ID " + hosId);
		System.out.println("ReviewController recentList() 1 정렬방식 " + type);

		List<ReviewDto> list = new ArrayList<ReviewDto>();
		if(type.equals("recent")) {
			list = service.recentList(hosId);
		} else if (type.equals("scoreup")) {
			list = service.scoreUplist(hosId);
		} else {
			list = service.scoreDownlist(hosId);
		}
		return list;
	}

//	// review 목록 - 평점높은순
//	@GetMapping("scoreUplist.do")
//	@ResponseBody
//	public List<ReviewDto> scoreUplist(@RequestParam int hosId) {
//		System.out.println("ReviewController scoreUplist() " + new Date());
//		System.out.println("ReviewController scoreUplist() 1 병원 ID " + hosId);
//		
//		List<ReviewDto> list = service.scoreUplist(hosId);
//		System.out.println("list?! : " + list);
//		return list;
//	}
//	
//	// review 목록 - 평점낮은순
//	@GetMapping("scoreDownlist.do")
//	@ResponseBody
//	public List<ReviewDto> scoreDownlist(@RequestParam int hosId) {
//		System.out.println("ReviewController scoreDownlist() " + new Date());
//		System.out.println("ReviewController scoreDownlist() 1 병원 ID " + hosId);
//		
//		List<ReviewDto> list = service.scoreDownlist(hosId);
//		
//		return list;
//	}
//	

	// 리뷰 등록하기
	@PostMapping("reviewWriteAf.do")
	public String reviewWrite(ReviewDto dto) {
		System.out.println("ReviewController reviewWrite() " + new Date());
		
		boolean isS = service.reviewWrite(dto);
		System.out.println(isS);
		if(isS) {
			System.out.println("리뷰 작성에 성공했습니다");
		}else {
			System.out.println("리뷰 작성에 실패했습니다");
		}
		System.out.println("ReviewController reviewWrite() 1");
		
		return "redirect:/hospitalDetail.do?id=" + dto.getHospital_id(); // 임시로 병원번호를 설정함
	}
	

	// 리뷰삭제
	@ResponseBody
	@RequestMapping(value="reviewDelete.do", method = RequestMethod.GET)
	public String reviewDelete(ReviewDto dto) {
		System.out.println("ReviewController reviewDelete() " + new Date());
		
		try {
	        boolean isS = service.reviewDelete(dto);
	        System.out.println(isS);
	        
	        if (isS) {
	            System.out.println("삭제 성공");
	        } else {
	            System.out.println("삭제 실패");
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); // 에러 내용을 콘솔에 출력합니다.
	    }
		
		String json = "{\"success\": \"success\"}";
		return json;
	}
	
	@GetMapping("myreview.do")
	public String myreview(Model model, HttpServletRequest request) {
		System.out.println("ReviewController myreview() " + new Date());
		
		String userid = ((UserDto)request.getSession().getAttribute("login")).getId();
		
		List<MyReviewDto> likeReviewDtoList = service.getreviewdetaillist(userid);
		
		model.addAttribute("likeReviewDtoList", likeReviewDtoList);
		
		model.addAttribute("content", "myreview");
		
		return "mypage";
	}
	
}















