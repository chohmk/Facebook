package com.facebook.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.facebook.like.dao.LikeDAO;

@Service
public class LikeBO {
	@Autowired
	private LikeDAO likeDAO;
	// likeToggle 
	// 있으면 제거
	// 없으면 추가
	
	// 좋아요 개수 select (postId, 비로그인 일수도 있기 때문에Integer userId)
	public int getLikeCountByPostIdOrUserId(int postId, Integer userId) {
		return likeDAO.selectLikeCountByPostIdOrUserId(postId, userId);
	}
}
