package com.facebook.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 유저에 관해서
@Controller
@RequestMapping("/user")
public class UserController {
	/**
	 * 회원가입 화면
	 * @param model
	 * @return
	 */
	@RequestMapping("/sign_up_view")
	
	public String signUpView() {
		
		return "user/signUp";
	}
	
	/**
	 * 로그인 화면
	 * @param model
	 * @return
	 */
	@RequestMapping("/sign_in_view")
	public String signInView() {
		
		return "user/signIn";
	}
	
	/**
	 * 로그아웃 화면
	 * @param session
	 * @return
	 */
	@RequestMapping("sign_out")
	public String signOut(HttpSession session) {
		session.removeAttribute("userName");
		session.removeAttribute("userLoginId");
		session.removeAttribute("userId");
		
		return "redirect:/user/sign_in_view";
		
	}
}
