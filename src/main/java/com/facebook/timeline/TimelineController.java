package com.facebook.timeline;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/timeline")
/**
 * 타임라인 화면
 * @author Lenovo
 *
 */
public class TimelineController {
	@RequestMapping("/timeline_view")
	public String TimelineView() {
	
		return "timeline/timeline";
	}
}
