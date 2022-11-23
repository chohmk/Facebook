package com.facebook.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.facebook.comment.bo.CommentBO;


@RequestMapping("/comment")
@RestController
public class CommentRestController {
	@Autowired
	private CommentBO commentBO;
	
/**
 * 댓글 쓰기 API
 * @param postId
 * @param content
 * @param session
 * @return
 */
	@PostMapping("/create")
	public Map<String, Object> createComment(
			@RequestParam("postId") int postId,
			@RequestParam("content") String content,
			HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			result.put("code", 300);
			result.put("result", "error");
			result.put("errorMessage", "로그인을 해주세요");
			return result;
		}
		commentBO.createComment(userId, postId, content);
		result.put("code", 100);
		result.put("result", "success");
		return result;
	}
	/**
	 * 댓글 삭제 API
	 * @param postId
	 * @return
	 */
	@DeleteMapping("delete")
	public Map<String, Object> deleteComment(
			@RequestParam("id") int id) {

		
		commentBO.deleteCommentsById(id);
		Map<String, Object> result = new HashMap<>();
		result.put("code", 100); // 성공
		result.put("result", "success");
		
		
		
		return result;
	}
}
