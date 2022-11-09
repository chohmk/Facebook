package com.facebook.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
}