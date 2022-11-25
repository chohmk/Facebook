package com.facebook.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {
	// 좋아요 개수 select
	public int selectLikeCountByPostIdOrUserId(
			@Param("postId") int postId, 
			@Param("userId") Integer userId);
	
	// 좋아요 안눌려있으면 추가 insert
	public void insertLike(
			@Param("postId") int postId, 
			@Param("userId") int userId);

	// 좋아요 눌려있으면 삭제
	public void deleteLikeByPostIdUserId(
			@Param("postId") int postId, 
			@Param("userId") int userId);
	
	// 게시글 삭제할 때 좋아요 삭제
	public void deleteLikeByPostId(int postId);
}
