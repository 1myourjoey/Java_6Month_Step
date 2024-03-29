package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import dto.LoginRequest;

@Controller
public class MyController {
	@GetMapping("/")
	public String root() {
		return "index";
	}

	@GetMapping("/hello") // 요청
	public String abc() { // 메소드 이름 상관 없음
		return "hello"; // view의 이름
	}

	@GetMapping("/login")
	public String login() {
		return "inputForm";
	}

	@PostMapping("/result")
	public String result(LoginRequest loginRequest) {
		System.out.println(loginRequest.getId());
		System.out.println(loginRequest.getEmail());
		return "result";
	}

//	public String result(@RequestParam String id, @RequestParam String email) {
//		System.out.println(id);
//		System.out.println(email);
//		return "result";
//	}
//	public String result(HttpServletRequest request) {
//		String id = request.getParameter("id");
//		System.out.println(id);
//		return "result";
//	}
	
	@GetMapping("/move")
	public String move() {
		return "redirect:/";
	}
}