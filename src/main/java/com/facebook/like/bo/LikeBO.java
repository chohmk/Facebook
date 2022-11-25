package com.facebook.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.facebook.like.dao.LikeDAO;

@Service
public class LikeBO {
	@Autowired
	private LikeDAO likeDAO;
	// likeToggle
	public void likeToggle(int postId, int userId) {
		if (getLikeCountByPostIdOrUserId(postId, userId) > 0) {
			// 있으면 삭제 delete
			likeDAO.deleteLikeByPostIdUserId(postId, userId);
		} else {
			// 없으면 추가 insert
			likeDAO.insertLike(postId, userId);
			
		}
	}
	
	// 좋아요 개수 select (postId, 비로그인 일수도 있기 때문에Integer userId)
	public int getLikeCountByPostIdOrUserId(int postId, Integer userId) {
		return likeDAO.selectLikeCountByPostIdOrUserId(postId, userId);
	}
	
	// 게시글 삭제할 때 좋아요도 삭제
	public void deleteLikeByPostId(int postId) {
		likeDAO.deleteLikeByPostId(postId);
	}
	
	
	
	
}
