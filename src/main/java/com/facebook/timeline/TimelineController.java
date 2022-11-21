package com.facebook.timeline;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.facebook.post.bo.PostBO;
import com.facebook.post.model.Post;



@Controller
@RequestMapping("/timeline")


public class TimelineController {
	@Autowired
	private PostBO postBO;
	
/**
 * 타임라인 화면
 * @param model
 * @param session
 * @return
 */
	@RequestMapping("/timeline_view")
	public String TimelineView(Model model, HttpSession session) {
	
		//List<Post> postList = postBO.getPostList();
		Integer userId = (Integer)session.getAttribute("userId");
		List<CardView> cardViewList = timelineBO
		
		List<Post> postList = postBO.getPostList();
		

		model.addAttribute("postList", postList);

		return "timeline/timeline";
	}
}

