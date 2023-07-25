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

import component.dto.UserDto;
import component.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService service;
	
	@RequestMapping(value = "login.do")
	public String login() {
		System.out.println("UserController login() " + new Date());
		return "login";
	}
	
	@PostMapping("loginAf.do")
	public String login(UserDto user, Model model, HttpServletRequest request) {
		System.out.println("UserController login() " + new Date());
		
		UserDto dto = service.login(user);
		String loginmsg = "LOGIN_NO";
		if(dto != null) {
			request.getSession().setAttribute("login", dto);	// session에 저장			
			loginmsg = "LOGIN_YES";
		}
		model.addAttribute("loginmsg", loginmsg);
		
		return "message";
	}
	
	@RequestMapping(value = "logout.do")
	public String logout(HttpServletRequest request) {
		System.out.println("UserController logout() " + new Date());		
		request.getSession().removeAttribute("login");		
		return "redirect:/login.do";
	}
	
	@GetMapping("regi.do")
	public String regi() {
		System.out.println("UserController regi() " + new Date());
		return "regi";
	}
	
	@PostMapping("regiAf.do")
	public String regiAf(UserDto user, Model model) {
		System.out.println("UserController regiAf() " + new Date());
		
		boolean isS = service.adduser(user);
		String message = "USER_YES";
		if(isS == false) {
			message = "USER_NO";
		}
		model.addAttribute("message", message);
		
		return "message";
	}	
	
	@ResponseBody
	@PostMapping("idcheck.do")
	public String idcheck(String id) {
		System.out.println("UserController idcheck() " + new Date());
		
		boolean isS = service.idcheck(id);
		String msg = "YES";
		if(isS == true) {
			msg = "NO";
		}
		return msg;
	}
	
	@GetMapping("main.do")
	public String main() {
		System.out.println("UserController main() " + new Date());
		return "main";
	}
	
	// 우지예
	
	// 메인에서 마이 페이지 오도록 임시방편 - 메인 민경님꺼랑 합치면 지울 메소드
	@GetMapping("mypage.do")
	public String mypage() {
		System.out.println("UserController mypage() " + new Date());
		return "mypage";
	}
	
	
	//TODO 마이페이지 - 프로필
	@GetMapping("myprofile.do")
	public String myprofile(Model model) {
		System.out.println("UserController myprofile() " + new Date());
		
		model.addAttribute("content", "profile"); // mypage 페이지 가서 내용으로 띄울 jsp 파일명
		// 내 정보는 db서 가져오는 게 아니라 로그인 세션에서 받으면 될 듯?
		return "mypage";
	}
	
	//TODO 마이페이지 - 기존 비밀번호 확인 (ajax)
	@ResponseBody
	@PostMapping("checkoriginpw.do")
	public String checkoriginpw(String originpw,String userid, HttpServletRequest request) { // 리턴값이 jsp 파일며잉 아니라 ajax의 결과값이기에 리턴자료형이 String이 아니어도 됨
		System.out.println("UserController checkoriginpw() " + new Date());
		
		String hashedoriginpw = sha256(originpw); // 비밀번호 변경 페이지에서 입력받은 비밀번호 해쉬화
		String sessionpw = ((UserDto)request.getSession().getAttribute("login")).getPw(); // 로그인 시 세션에 저장된 유저 비밀번호
		
		if (hashedoriginpw == sessionpw) {
			return "YES";
		}
		
		return "No"; // ajax가 있는 jsp파일로 보낼 데이터
	}
	
	//TODO 마이페이지 - 새 비밀번호 조합 확인 (ajax)
	@ResponseBody
	@PostMapping("checknewpw.do")
	public boolean checknewpw(String pw) { // 리턴값이 jsp 파일며잉 아니라 ajax의 결과값이기에 리턴자료형이 String이 아니어도 됨
		System.out.println("UserController checknewpw() " + new Date());
		
		// 비밀번호 조합 검사
		// 최소 9자리 이상, 하나 이상의 영문자+숫자+특문(특수문자는 ~!@#$%^&* 중 하나)
	    String pwRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%^&*])[A-Za-z\\d@$!%*#?&]{9,}$";
	    if (!Pattern.matches(pwRegex,pw.trim())) {
	        return false; // 비밀번호가 조합 조건을 만족하지 않을 경우 false를 반환
	    }
		
		return true; // ajax가 있는 jsp파일로 보낼 데이터
	}
	
		
	//TODO 마이페이지 - 비밀번호 변경 (ajax)
	@ResponseBody
	@PostMapping("changepw.do")
	public boolean changepw(UserDto userdto) { // 리턴값이 jsp 파일며잉 아니라 ajax의 결과값이기에 리턴자료형이 String이 아니어도 됨
		System.out.println("UserController changepw() " + new Date());
		
		boolean isS = service.changepw(userdto);
		
		if(isS == true) {
			return true;
		}else {
			return false;
		}
	}
	
	

}
