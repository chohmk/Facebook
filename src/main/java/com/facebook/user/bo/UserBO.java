package com.facebook.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.facebook.user.dao.UserDAO;

@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;
	
	// 중복확인 select
	public boolean existLoginId(String loginId) {
		return userDAO.existLoginId(loginId);
	}
}
