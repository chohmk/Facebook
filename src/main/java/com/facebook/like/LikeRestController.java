package com.facebook.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LikeRestController {
	public Map<String, Object> like(
			@PathVariable int postId,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			result.put("code", 300);// 비로그인 상태
			result.put("result", "error");
			return result;
		}
		// 좋아요 있으면 삭제/ 없으면 추가
		
		
		result.put("code", 100);
		result.put("result", "success");
		
		return result;
	}
}
