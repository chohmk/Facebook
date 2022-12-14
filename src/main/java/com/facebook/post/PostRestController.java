package com.facebook.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
	@PostMapping("/create")
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
	
	/**
	 * 수정 API
	 * @param postId
	 * @param content
	 * @param file
	 * @param session
	 * @return
	 */
	@PutMapping("/update")
	public Map<String, Object> update(
			@RequestParam("postId") int postId, 
			@RequestParam("content") String content, 
			@RequestParam(value="file", required=false) MultipartFile file, 
			HttpSession session) {
		int userId = (int)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		
		int count = postBO.updatePost(postId, userId, userLoginId, content, file);
		
		Map<String, Object> result = new HashMap<>();
		if (count > 0) {
			result.put("code", 100); // 성공
		} else {
			result.put("code", 400); // 실패
			result.put("errorMessage", "수정 실패");
		}
		return result;
		
		
	}
	@DeleteMapping("/delete")
	public Map<String, Object> delete(
			@RequestParam("postId") int id) {
		
		// DB delte
		postBO.deletePostByPostId(id);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code",100);
		result.put("result", "success");
		
		return result;
	}
}
