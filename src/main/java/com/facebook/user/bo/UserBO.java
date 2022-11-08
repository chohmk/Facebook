package com.facebook.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.facebook.user.dao.UserDAO;
import com.facebook.user.model.User;

@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;
	
	// 중복확인 select
	public boolean existLoginId(String loginId) {
		return userDAO.existLoginId(loginId);
	}
	
	// 회원가입
	public void addUser(String loginId, String password, String name) {
		userDAO.insertUser(loginId, password, name);
	}
	
	// 로그인
	public User getUserByLoginIdAndPassword(String loginId, String password) {
		return userDAO.selectUserByLoginIdAndPassword(loginId, password);
	}
}
