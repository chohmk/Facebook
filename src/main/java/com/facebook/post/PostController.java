package com.facebook.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/post")
@Controller
public class PostController {
	
	/**
	 * 글쓰기 화면
	 * @return
	 */
	@RequestMapping("/post_create_view")
	public String postCreateView() {
		
		return "post/postCreate";
	}
	
	@RequestMapping("/post_detail_view")
	public String postDetailView() {
		
		return "post/postDetail";
	}
}
