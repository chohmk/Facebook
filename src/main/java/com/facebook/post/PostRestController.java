package com.facebook.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.facebook.post.bo.PostBO;

@RequestMapping("/post")
@RestController
public class PostRestController {
	@Autowired
	private PostBO postBO;
	
	/**
	 * 글쓰기 API
	 * @param content
	 * @param file
	 * @param session
	 * @return
	 */
	// 글쓰기 화면 
	@RequestMapping("/create")
	public Map<String, Object> create(
			@RequestParam("content") String content, 
			@RequestParam("file") MultipartFile file,
			HttpSession session) {
		
		Integer userId = (Integer) session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		
		Map<String, Object> result = new HashMap<>();
		if (userId == null) {
			result.put("code", 300);	// 비로그인 상태
			result.put("result", "error");
			result.put("errorMessage", "로그인을 해주세요");
			
			return result;
		}
		
		postBO.addPost(userId, userLoginId, content, file);
		result.put("code", 100);
		result.put("result", "success");
		return result;
		
	}
}
