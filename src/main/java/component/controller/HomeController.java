package component.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	
	// 홈화면으로
			@RequestMapping("home.do")
			public String home() {
				System.out.println("HomeController home() " + new Date());
				
				return "home";
			}

}
