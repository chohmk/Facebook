package com.facebook.timeline;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/timeline")
public class TimelineController {
	@RequestMapping("/timeline_view")
	public String TimelineView() {
	
		return "timeline/timeline";
	}
}
