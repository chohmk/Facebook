package com.facebook.timeline;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/timeline")

// 타임라인
public class TimelineController {
	@RequestMapping("/timeline_view")
	public String TimelineView(Model model, HttpSession session) {
	
		
		return "timeline/timeline";
	}
}
