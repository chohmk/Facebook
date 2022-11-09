package com.facebook.timeline;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/timeline")
public class TimelineController {
	@RequestMapping("/timeline_view")
	public String TimelineView() {
	
		return "timeline/timeline";
	}
}
