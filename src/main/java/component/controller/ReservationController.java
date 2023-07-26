package component.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import component.dto.ReservDto;
import component.service.ReservationService;
import org.springframework.web.bind.annotation.RequestParam;

import component.dto.ReservationDetailDto;
import component.dto.ReservationDto;
import component.dto.ReservationGetList;
import component.dto.UserDto;
import component.service.ReservationService;
import util.reservationUtil;

@Controller
public class ReservationController {

	@Autowired
	ReservationService service;
	
	@PostMapping("reservation.do")
	public String reservation(ReservDto dto, Model model) {
		System.out.println("------reservation-------");
		System.out.println(dto.toString());
		
		service.reservation(dto);
		
		return "/"; //수정
	}
	
	@GetMapping("getReservByDate.do")
	@ResponseBody
	public List<ReservDto> getReservByDate(String date_s, String hosId, Model model) {
		System.out.println("------getReservByDate-------");
		System.out.println("아이디" + hosId);

		return service.getReservByDate(date_s, hosId);
	}
	
	@GetMapping("myreservation.do")
	public String myreservation(@RequestParam(required = false, defaultValue = "0") int year,
								@RequestParam(required = false, defaultValue = "15") int month,
								@RequestParam(required = false, defaultValue = "0") int reservationId,
								Model model, HttpServletRequest request) {
		System.out.println("ReservationController myreservation() " + new Date());
		
		Calendar cal = Calendar.getInstance();

		cal.set(Calendar.DATE,1);
		Date date = new Date();
		
		if(year==0) {
			year = cal.get(Calendar.YEAR);
		}
		
		if(month == 15) {
			month = cal.get(Calendar.MONTH) + 1; // month: 0 ~ 11
		}
		
		
		if(month < 1){
			month = 12;
			year--;
		}
		
		if(month > 12){
			month = 1;
			year++;
		}
		
		cal.set(year,month-1,1);
		
		// 요일
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK); // 년,월은 사용자의 클릭에 따라 바뀌더라도 날짜는 1일로 세팅된 상태
													   // -> 사용자가 선택한 년월의 1일의 요일 == 무슨 요일부터 해당 달이 시작하는지 체크 가능
		String loginid = ((UserDto)request.getSession().getAttribute("login")).getId();
		ReservationGetList data = new ReservationGetList(loginid,year +"-" + reservationUtil.maketwo(month+"")); // DB에는 -이 있는걸로 저장되어있는 거 아닌가? 그럼 비교할 얘도 -가 있어야하는거 아닌가?
		List<ReservationDto> reservlist = service.getreservlist(data);
		
		ReservationDetailDto dto = null;
		if(reservationId != 0) {
			dto = service.getreservdetail(reservationId);
		}
		
		model.addAttribute("reservlist", reservlist); 
		model.addAttribute("year", year); 
		model.addAttribute("month", month); 
		model.addAttribute("dayOfWeek", dayOfWeek); 
		model.addAttribute("cal", cal);
		
		model.addAttribute("reservationId", reservationId);
		model.addAttribute("reservationDetailDto", dto);
		
		
		model.addAttribute("content", "myreservationlist"); 
				
		return "mypage";
	}
	
	// 예약 취소
	@GetMapping("deletereserv.do")
	public String deletereserv(int reservId,Model model) {
		System.out.println("ReservationController reservationdetail() " + new Date());
		
		boolean isS = service.deletereserv(reservId);
		
		String result="NO"; 
		String nextpage = "myreservation.do";
		if(isS == true) { // 예약 취소 성공
			result="YES"; 
		}
		System.out.println("예약 취소");
		 model.addAttribute("target","예약 취소");
		 model.addAttribute("result",result);
		 model.addAttribute("nextpage",nextpage);
		 
		 return "alert"; 
	}
	
}
