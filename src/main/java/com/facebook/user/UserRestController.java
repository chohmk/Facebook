package com.facebook.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.facebook.common.EncryptUtils;
import com.facebook.user.bo.UserBO;
import com.facebook.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	@Autowired
	private UserBO userBO;

	/**
	 * 아이디 중복확인 API
	 * @param loginId
	 * @return
	 */
	// 아이디 중복확인
	@RequestMapping("is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("loginId") String loginId) {
		
		Map<String, Object> result = new HashMap<>();
		boolean isDuplicated = userBO.existLoginId(loginId);
		if (isDuplicated) {
			result.put("result", true);	// 중복
			result.put("code", 100);	// 성공
		} else {
			result.put("result", false);	// 중복 아님
			result.put("code", 100);	// 성공
		}
		
		return result;
	}
	
	/**
	 * 회원가입 API
	 * @param loginId
	 * @param password
	 * @param name
	 * @return
	 */
	// 회원가입
	@PostMapping("sign_up") 
	public Map<String, Object> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name) {
		
		// 암호화
		String encryptPassword = EncryptUtils.md5(password);
		
		// DB insert
		userBO.addUser(loginId, encryptPassword, name);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 100);
		result.put("result", "success");
		
		return result;
	}
	
	/**
	 * 로그인 API
	 * @param loginId
	 * @param password
	 * @param session
	 * @return
	 */
	// 로그인
	@PostMapping("sign_in")
	public Map<String, Object> signIn(
			@RequestParam("") String loginId,
			@RequestParam("") String password,
			HttpSession session) {
		
		// 암호화
		String encryptPassword = EncryptUtils.md5(password);
		
		// DB select
		User user = userBO.getUserByLoginIdAndPassword(loginId, encryptPassword);
		
		Map<String, Object> result = new HashMap<>();
		// user 가 null이 아니면 로그인상태
		if (user != null) {
			result.put("code", 100);
			result.put("result", "success");
			// 세션에 유저정보를 담는다.(로그인 상태유지)
			session.setAttribute("userName", user.getName());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userId", user.getId());
		} else {
			result.put("code", 400);
			result.put("errorMessage", "존재하지 않는 사용자 입니다.");
		}
		
		return result;
	}
}
