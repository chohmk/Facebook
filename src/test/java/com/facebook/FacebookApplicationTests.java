package com.facebook;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class FacebookApplicationTests {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Test
	void contextLoads() {
	}
	
	@Test
	void 더하기테스트() {
		log.debug("######### 더하기테스트 수행");
	}

}
