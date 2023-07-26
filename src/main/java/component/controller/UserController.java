package component.controller;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import component.dto.UserDto;
import component.service.EmailService;
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
		System.out.println("UserController loginAf() " + new Date());

		UserDto dto = service.login(user);
		String loginmsg = "LOGIN_NO";

		// 사용자가 입력한 비밀번호를 해시화하여 저장된 해시된 비밀번호와 비교
		String hashedPassword = sha256(user.getPw()); // 해시 함수를 적용한 비밀번호

		// System.out.println("해시화 전 원래 비밀번호 : " + user.getPw());
		// System.out.println("해시화된 비밀번호 : " + hashedPassword);
		// System.out.println("db에 저장된 비밀번호 : " + dto.getPw());

		if (dto != null && dto.getPw().equals(hashedPassword)) {
			request.getSession().setAttribute("login", dto); // session에 저장
			loginmsg = "LOGIN_YES";
		}

		model.addAttribute("loginmsg", loginmsg);

		return "message";
	}

	@PostMapping("kakaoLogin.do")
	public String kakaoLogin(@RequestParam("access_token") String accessToken, HttpSession session,
			RedirectAttributes redirectAttributes) {
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

		// 클라이언트에서 전송한 원래 비밀번호
		String originalPassword = user.getPw();

		if (!isValidUserInfo(user)) {
			model.addAttribute("message", "USER_NO");
			return "message";
		}

		// 비밀번호 해시화
		String hashedPassword = sha256(originalPassword);
		user.setPw(hashedPassword);

		boolean isS = service.adduser(user);
		String message = "USER_YES";
		if (isS == false) {
			message = "USER_NO";
		}
		model.addAttribute("message", message);

		return "message";
	}

	private boolean isValidUserInfo(UserDto user) {

		// 아이디, 비밀번호, 이름, 이메일이 비어있을경우 false
		if (user.getId().trim().isEmpty() || user.getPw().trim().isEmpty() || user.getName().trim().isEmpty()
				|| user.getEmail().trim().isEmpty()) {
			return false;
		}
		// Regular Expression (정규 표현) > Regex
		// 이메일 형식검사
		String emailRegex = "^[a-zA-Z0-9]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
		if (!Pattern.matches(emailRegex, user.getEmail().trim())) {
			return false; // 유효하지 않은 이메일 형식일 경우 false를 반환
		}

		// 비밀번호 조합 검사
		// 최소 9자리 이상, 하나 이상의 영문자+숫자+특문(특수문자는 ~!@#$%^&* 중 하나)
		String pwRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%^&*])[A-Za-z\\d@$!%*#?&]{9,}$";
		if (!Pattern.matches(pwRegex, user.getPw().trim())) {
			return false; // 비밀번호가 조합 조건을 만족하지 않을 경우 false를 반환
		}

		return true;
	}

	// 비밀번호 해시화 (SHA-256 사용)
	public static String sha256(String pw) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			byte[] hash = md.digest(pw.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();

			for (int i = 0; i < hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}
			return hexString.toString();
		} catch (Exception e) {
			return "";
		}
	}

	@ResponseBody
	@PostMapping("idcheck.do")
	public String idcheck(String id) {
		System.out.println("UserController idcheck() " + new Date());

		boolean isS = service.idcheck(id);
		String msg = "YES";
		if (isS == true) {
			msg = "NO";
		}
		return msg;
	}

	@GetMapping("main.do")
	public String main() {
		System.out.println("UserController main() " + new Date());
		return "main";
	}

	@GetMapping("findId.do")
	public String findId() {
		System.out.println("UserController findId() " + new Date());
		return "findId";
	}

	@PostMapping("findIdAf.do")
	public String findIdByEmail(String email, Model model, RedirectAttributes redirectAttributes) {
		String foundId = service.findId(email);
		System.out.println("UserController findIdAf() " + new Date());

		if (foundId != null) { // id를 찾았을 경우
			model.addAttribute("foundId", foundId);
			return "findIdAf";
		} else {
			System.out.println("일치하는 아이디가 없습니다.");
			redirectAttributes.addFlashAttribute("error", "입력한 이메일과 일치하는 아이디가 없습니다.");
			return "redirect:/findId.do";
		}
	}

	@GetMapping("findPw.do")
	public String findPw() {
		System.out.println("UserController findPw() " + new Date());
		return "findPw";
	}

	private final EmailService emailService;

	@Autowired
	public UserController(EmailService emailService) {
		this.emailService = emailService;
	}

	@PostMapping("findPwAf.do")
	public String findPwAf(UserDto user, Model model, HttpSession session) {
		System.out.println("UserController findPwAf() " + new Date());
		// 입력받은 이름, 아이디, 이메일 정보
		String name = user.getName();
		String id = user.getId();
		String email = user.getEmail();

		// 입력된 정보로 회원찾기
		UserDto foundUser = service.findUserByNameIdEmail(name, id, email);

		// verifyCode.jsp로 아이디, 이메일 전달
	    model.addAttribute("id", id);
	    model.addAttribute("email", email);
	    System.out.println("findPwAf.do 에서 id : "+id);
		
		if (foundUser != null) {
			System.out.println("유저를 찾았음");
			// 인증번호 생성 (임의로 생성하도록 설정)
			String verificationCode = generateVerificationCode();
			System.out.println("인증번호 생성완료");
			// 인증번호를 세션에 저장하여 이후 비교에 사용
			session.setAttribute("verificationCode", verificationCode);
			session.setAttribute("foundUser", foundUser);
			System.out.println("인증번호 세션저장 완료");
			// 이메일로 인증번호 발송
			emailService.sendVerificationEmail(email, verificationCode);
			
			return "verifyCode";
		} else {
			model.addAttribute("error", "입력한 정보와 일치하는 회원을 찾을 수 없습니다.");
			return "findPw";
		}
	}

	@GetMapping("verifyCode.do")
	public String verifyCode() {
		System.out.println("UserController verifyCode() " + new Date());
		return "verifyCode";
	}

	@PostMapping("verifyCodeAf.do")
	public String verifyCodeAf(@RequestParam("id") String id, @RequestParam("code") String code, HttpSession session, Model model) {
		System.out.println("UserController verifyCodeAf() " + new Date());
		// 세션에서 저장된 인증번호와 입력한 인증번호 비교
		String verificationCode = (String) session.getAttribute("verificationCode");
		UserDto foundUser = (UserDto) session.getAttribute("foundUser");

		if (verificationCode.equals(code)) {
			// 인증번호 일치 시 비밀번호 재설정 페이지로 이동
			model.addAttribute("foundUser", foundUser);
			// resetPassword.jsp로 아이디 전달
		    model.addAttribute("id", id);
			System.out.println("verifyCodeAf.do에서 id : "+id);
			return "resetPassword";
		} else {
			model.addAttribute("error", "인증번호가 일치하지 않습니다.");
			return "verifyCode"; // 인증번호 불일치 시 다시 입력 페이지로 이동
		}
	}

	@PostMapping("resetPasswordAf.do")
	public String resetPasswordAf(@ModelAttribute("foundUser") UserDto foundUser,
	                              @RequestParam("id") String id,
	                              Model model) {
	    System.out.println("UserController resetPasswordAf() " + new Date());
	    
	    // 입력받은 새 비밀번호 출력
	    String newPassword = foundUser.getNewPassword();
	    System.out.println("새 비밀번호: " + newPassword);
	   
	    // 비밀번호 해시화
	    String hashedPassword = sha256(newPassword);
	    foundUser.setPw(hashedPassword);
	    
	    // 받아온 아이디를 UserDto에 설정
	    foundUser.setId(id);
	    System.out.println("resetPasswordAf.do 에서 id : "+id);
	    
	    // 비밀번호 재설정
	    service.updatePassword(foundUser);
	    
	    // 비밀번호 재설정 완료 후 로그인 페이지로 이동 또는 메시지 출력 등의 처리
	    model.addAttribute("NewPwmsg", "NewPw_YES");
	    return "message";
	}

	// 인증번호 생성 (임의로 6자리 숫자로 생성하도록 설정)
	private String generateVerificationCode() {
		Random random = new Random();
		int code = 100000 + random.nextInt(900000);
		return String.valueOf(code);
	}

}
