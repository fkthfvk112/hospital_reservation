package component.controller;

import java.io.Console;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import component.dto.HospitalDto;
import component.dto.ReservDto;
import component.dto.UserDto;
import component.service.HospitalService;
import component.service.ReservationService;
import org.springframework.web.bind.annotation.ResponseBody;

import component.dto.UserDto;
import component.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService service;

	@Autowired
	HospitalService hosService;
	
	@Autowired
	ReservationService reservService;

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
	
	@PostMapping("kakaoLogin.do")
    public String kakaoLogin(@RequestParam("access_token") String accessToken, HttpSession session, RedirectAttributes redirectAttributes) {
        // 카카오 API를 이용하여 사용자 정보를 가져오는 URL
        String apiUrl = "https://kapi.kakao.com/v2/user/me";
        System.out.println("kakaoLogin Success (1)");
        
        try {
            URL url = new URL(apiUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);
            System.out.println("kakaoLogin Success (2)");
            
            int responseCode = conn.getResponseCode();
            if (responseCode == 200) { // 요청에 성공한 경우
                ObjectMapper mapper = new ObjectMapper();
                JsonNode jsonNode = mapper.readTree(conn.getInputStream());
                System.out.println("kakaoLogin Success (3)");
                
                // 카카오로api 부터 받아온 사용자 정보
                String userId = jsonNode.get("id").asText();
                String nickname = jsonNode.get("properties").get("nickname").asText();
                String email = jsonNode.get("kakao_account").get("email").asText();
                System.out.println("kakaoLogin Success (4)");
                
                // 세션에 사용자 정보 저장
                session.setAttribute("userId", userId);
                session.setAttribute("nickname", nickname);
                session.setAttribute("email", email);
                System.out.println("kakaoLogin Success (5)");
                
                // 로그인 성공 후 메인 페이지로
                return "redirect:/main.do";
            } else {
                // 요청에 실패한 경우, 실패 메시지를 RedirectAttributes에 담아서 리다이렉트
                redirectAttributes.addFlashAttribute("errorMsg", "카카오 로그인에 실패했습니다.");
                return "redirect:/login.do";
            }
        } catch (IOException e) {
            e.printStackTrace();
            // 예외 발생 시, 예외 메시지를 RedirectAttributes에 담아서 리다이렉트
            redirectAttributes.addFlashAttribute("errorMsg", "카카오 API 연동 중 오류가 발생했습니다.");
            return "login";
        }
    }
	@RequestMapping(value = "logout.do")
	public String logout(HttpServletRequest request) {
		System.out.println("UserController logout() " + new Date());		
		request.getSession().removeAttribute("login");		
		return "redirect:/home.do";
	}
	
	@GetMapping("regi.do")
	public String regi() {
		System.out.println("UserController regi() " + new Date());
		return "regi";
	}
	
	@PostMapping("regiAf.do")
	public String regiAf(UserDto user, Model model) {
		System.out.println("UserController regiAf() " + new Date());
		
		 if (!isValidUserInfo(user)) {
		        model.addAttribute("message", "USER_NO");
		        return "message";
		 }
		 
		boolean isS = service.adduser(user);
		String message = "USER_YES";
		if(isS == false) {
			message = "USER_NO";
		}
		model.addAttribute("message", message);
		
		return "message";
	}	

	private boolean isValidUserInfo(UserDto user) {
		
		// 아이디, 비밀번호, 이름, 이메일이 비어있을경우 false
	    if (user.getId().trim().isEmpty()
	        || user.getPw().trim().isEmpty()
	        || user.getName().trim().isEmpty()
	        || user.getEmail().trim().isEmpty()) {
	        return false;
	    }
	    
	    // 이메일 형식검사
	    String emailRegex = "^[a-zA-Z0-9]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
	    if (!Pattern.matches(emailRegex, user.getEmail().trim())) {
	        return false; // 유효하지 않은 이메일 형식일 경우 false를 반환합니다.
	    }
	    
	    return true;
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
	
	@GetMapping("home.do")
	public String home() {
		System.out.println("UserController main() " + new Date());
		return "home";
	}
	
	@GetMapping("ownerPage.do")
	public String ownerPage(Model model, HttpSession session) {
		UserDto dto = (UserDto)session.getAttribute("login");
		
		System.out.println("-------user id--" + dto.toString());

		//수정:주석 없애기
//		if(dto == null || dto.getAuth() != 2) {//validation check
//			System.out.println("------ownerPage::not log in--------");
//			return "home";
//		}
		//int hosId = dto.getMyHopital_id();
		int hosId = 7;//수정 :: 삭제
		HospitalDto hosDto = hosService.hospitalDetail(hosId);
		model.addAttribute("myHospitalDto", hosDto);
		
		List<ReservDto> ReservDtoList = (List<ReservDto>)reservService.getReservByHosId(hosId);
		model.addAttribute("myHospitalReservDtos", ReservDtoList);
		System.out.println("------ownerPage--------");
		return "ownerPage";
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
		

		
		//String hashedoriginpw = sha256(originpw); // 비밀번호 변경 페이지에서 입력받은 비밀번호 해쉬화
		String hashedoriginpw ="123";//수정:삭제
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
