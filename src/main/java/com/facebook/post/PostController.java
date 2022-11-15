package com.facebook.post;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.facebook.post.bo.PostBO;
import com.facebook.post.model.Post;

@RequestMapping("/post")
@Controller
public class PostController {
	@Autowired
	private PostBO postBO;
	
	/**
	 * 글쓰기 화면
	 * @return
	 */
	@RequestMapping("/post_create_view")
	public String postCreateView() {
		
		return "post/postCreate";
	}
	
	// 내 게시물
	@RequestMapping("/post_detail_view")
	public String postDetailView(
			@RequestParam("id") int id,
			Model model) {
		Post post = postBO.getPostByPostId(id);
		model.addAttribute("post", post);
		
		return "post/postDetail";
	}
}
