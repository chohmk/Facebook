package com.facebook.user.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {
	// 중복확인 select
	public boolean existLoginId(String loginId);
}
