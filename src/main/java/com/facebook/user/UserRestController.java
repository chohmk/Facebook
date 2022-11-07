package com.facebook.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.facebook.user.bo.UserBO;

@RestController
@RequestMapping("/user")
public class UserRestController {
	@Autowired
	private UserBO userBO;

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
}
