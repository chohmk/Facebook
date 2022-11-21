package com.facebook.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.facebook.user.model.User;

@Repository
public interface UserDAO {
	// 중복확인 select
	public boolean existLoginId(String loginId);
	
	// 회원가입 insert
	public void insertUser(
			@Param("loginId") String loginId, 
			@Param("password") String password, 
			@Param("name") String name);
	
	// 로그인 select
	public User selectUserByLoginIdAndPassword(
			@Param("loginId") String loginId, 
			@Param("password") String password);
	
	// 글쓴이 정보 select
	public User selectUserById(int id);
}
