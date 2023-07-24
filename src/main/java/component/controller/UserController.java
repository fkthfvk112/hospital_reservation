package component.controller;
import java.io.Console;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@GetMapping("home.do")
	public String main() {
		System.out.println("UserController main() " + new Date());
		return "home";
	}
	
	
}
	

